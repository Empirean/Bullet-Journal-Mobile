import 'package:bullet_journal/services/journal_entrytypes.dart';
import 'package:bullet_journal/data/journal_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MonthlyData extends StatefulWidget {
  @override
  _MonthlyDataState createState() => _MonthlyDataState();
}

class _MonthlyDataState extends State<MonthlyData> {

  final _controller = TextEditingController();
  String _dropDownValue = 'Task';
  bool _validate = true;
  bool _isImportant = false;

  int _layer = 0;
  int _previousLayer = -1;
  MonthlyTask _currentTask;
  String _title = "New Monthly Task";


  Map _data = {};
  journal_entryMode _mode = journal_entryMode.add;
  List<String> _taskTypes = [
    'Task',
    'Event',
    'Notes'
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        _data = ModalRoute.of(context).settings.arguments;

        if (_data != null)
        {
          _mode = _data["entryMode"];
          _currentTask = _data["monthlyItem"];

          if (_currentTask != null)
          {
            _layer = _data["layer"];
            _previousLayer = _currentTask.id;
          }

          if (_mode == journal_entryMode.edit)
          {
            _title = "Edit Monthly Task";
            _controller.text = _currentTask.description;
            _isImportant = _currentTask.taskIsImportant;
          }
        }
      });
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(_title,
          style: TextStyle(
              fontSize: 30.0
          ),),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            splashColor: Colors.black54,
            icon: Icon(Icons.save),
            onPressed: () {
              setState(() {
                _validate = _controller.text.length > 0 ? true : false;

                if (_validate)
                {
                  final database = Provider.of<MonthlyTasksDao>(context, listen: false);

                  if (_mode == journal_entryMode.add)
                  {
                    final monthlyTask = MonthlyTask(
                      description: _controller.text,
                      layerId: _layer,
                      previousLayerId: _previousLayer,
                      taskType: _taskTypes.indexOf(_dropDownValue),
                      taskIsImportant: _isImportant,
                      dateAdded: DateTime.now(),
                      dateChanged: DateTime.now(),
                    );

                    database.insertMonthlyTask(monthlyTask);
                    _controller.clear();
                  }

                  if (_mode == journal_entryMode.edit)
                  {
                    database.updateMonthlyTask(_currentTask.copyWith(
                      description: _controller.text,
                      dateChanged: DateTime.now(),
                      taskType: _taskTypes.indexOf(_dropDownValue),
                      taskIsImportant: _isImportant,
                    ));

                    Navigator.pop(context);
                  }
                }

              });
            }
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.black
              ),
              errorText: _validate ? null : 'Please enter a monthly task',
              hintText: 'New monthly task'
            ),
            maxLines: 5,
          ),
          SizedBox(height: 20),
          Text(
            'Task Type',
            style: TextStyle(
                fontSize: 12
            ),
          ),
          SizedBox(height:20),
          DropdownButton(
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
            value: _dropDownValue,
            items: _taskTypes.map<DropdownMenuItem<String>>((String value)
            {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value));
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                _dropDownValue = newValue;
              });
            }
          ),
          SizedBox(height: 20),
          CheckboxListTile(
            title: Text('Is Important'),
            value: _isImportant,
            onChanged: (newValue)
            {
              setState(() {
                _isImportant = newValue;
              });
            }
          )
        ],
      ),
    );
  }
}
