import 'package:flutter/material.dart';
import 'package:bullet_journal/data/journal_database.dart';
import 'package:bullet_journal/services/journal_entrytypes.dart';
import 'package:provider/provider.dart';

class HabitData extends StatefulWidget {
  @override
  _HabitDataState createState() => _HabitDataState();
}

class _HabitDataState extends State<HabitData> {
  final _controller = TextEditingController();
  bool _validate = true;
  bool _isVisible = true;
  String _title = "New Habit";

  Map _data = {};
  Habit _currentHabit;
  journal_entryMode _mode = journal_entryMode.add;

  @override
  Widget build(BuildContext context) {
     _data = ModalRoute.of(context).settings.arguments;

    if (_data != null)
    {
      _mode = _data["entryMode"];
      _currentHabit = _data["habitItem"];
      _controller.text = _currentHabit.description;
      _title = "Edit Habit";
      _isVisible = _currentHabit.isVisible;
    }


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(
            fontSize: 30.0
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              splashColor: Colors.black54,
              onPressed: (){
                setState(() {
                  _validate = _controller.text.length > 0 ? true : false;

                  if (_validate)
                  {
                    final database = Provider.of<HabitsDao>(context,listen: false);
                    if (_mode == journal_entryMode.add)
                    {

                      final habit = Habit(
                        description: _controller.text,
                        isVisible: _isVisible,
                      );

                      database.insertHabit(habit);
                      _controller.clear();
                    }

                    if (_mode == journal_entryMode.edit)
                    {
                      database.updateHabit(_currentHabit.copyWith(
                          description: _controller.text,
                          isVisible: _isVisible
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
        children: [
          TextField(
            controller: _controller,
            maxLines: 5,
            decoration: InputDecoration(
              errorText: _validate ? null : 'Please enter a habit',
              hintText: 'New habit',
              labelText: 'Description',
              labelStyle: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          SizedBox(height: 20,),
          CheckboxListTile(
            title: Text('Is Visible'),
            value: _isVisible,
            onChanged: (newValue)
            {
              setState(() {
                _isVisible = newValue;
              });
            }
          ),
        ],
      ),
    );
  }
}
