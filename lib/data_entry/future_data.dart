import 'package:bullet_journal/services/journal_entrytypes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bullet_journal/data/journal_database.dart';

class FutureData extends StatefulWidget {
  @override
  _FutureDataState createState() => _FutureDataState();
}

class _FutureDataState extends State<FutureData> {
  
  final _controller = TextEditingController();
  String _dropDownValue = 'Task';
  bool _validate = true;
  bool _isImportant = false;

  int _layer = 0;
  int _previousLayer = -1;
  FutureTask _currentTask;
  String _title = "New Future Task";

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

    Future.delayed(Duration.zero,() {
      setState(() {
        _data = ModalRoute.of(context).settings.arguments;

        if (_data != null)
        {
          _mode = _data["entryMode"];
          _currentTask = _data["futureItem"];

          if (_currentTask != null)
          {
            _layer = _data["layer"];
            _previousLayer = _currentTask.id;
          }

          if (_mode == journal_entryMode.edit)
          {
            _title = "Edit Future Task";
            _controller.text = _currentTask.description;
            _isImportant = _currentTask.isCompleted;
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
              icon: Icon(
                Icons.save
              ),
              onPressed: () {
                setState(() {
                  _validate = _controller.text.length > 0 ? true : false;

                  if (_validate)
                  {
                    final database = Provider.of<FutureTasksDao>(context, listen: false);

                    if (_mode == journal_entryMode.add)
                    {
                      final futureTask = FutureTask(
                        description: _controller.text,
                        layerId: _layer,
                        previousLayerId: _previousLayer,
                        taskType: _taskTypes.indexOf(_dropDownValue),
                        taskIsImportant: _isImportant,
                        dateAdded: DateTime.now(),
                        dateChanged: DateTime.now(),
                      );

                      database.insertFutureTask(futureTask);
                      _controller.clear();
                    }

                    if (_mode == journal_entryMode.edit)
                    {
                      database.updateFutureTask(_currentTask.copyWith(
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
              errorText: _validate ? null : 'Please enter a future task',
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.black
              ),
              hintText: 'New future task',
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
                    child: Text(value)
                );
              }
            ).toList() ,
            onChanged: (String newValue)
            {
              setState(() {
                _dropDownValue = newValue;
              });
            }),
          SizedBox(height: 20),
          CheckboxListTile(
            title: Text('Is Important'),
            value: _isImportant,
            onChanged: (newValue) {
              setState(() {
                _isImportant = newValue;
              });
            }
          ),
        ],
      )
    );
  }
}
