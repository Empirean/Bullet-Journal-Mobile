import 'package:bullet_journal/data/journal_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentHistory extends StatefulWidget {
  @override
  _CurrentHistoryState createState() => _CurrentHistoryState();
}

class _CurrentHistoryState extends State<CurrentHistory> {

  int _layer = 0;
  int _previousLayer = -1;
  String _title = "Current Tasks History";
  Map _data = {};
  CurrentTask _currentTask;
  List<String> _taskTypes = [
    'Task',
    'Event',
    'Notes'
  ];

  @override
  Widget build(BuildContext context) {

    _data = ModalRoute.of(context).settings.arguments;

    if (_data != null)
    {
      _layer = _data["layer"];
      _currentTask = _data["currentItem"];

      _title = _currentTask.description;
      _previousLayer = _currentTask.id;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          _title,
          style: TextStyle(
              fontSize: 30.0
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildCurrentTasksList(context))
        ],
      ),
    );
  }

  StreamBuilder<List<CurrentTask>> _buildCurrentTasksList(BuildContext context) {
    final database = Provider.of<CurrentTasksDao>(context, listen: false);
    return StreamBuilder(
      stream: database.watchCurrentHistoryInLayer(_layer, _previousLayer),
      builder: (context, AsyncSnapshot<List<CurrentTask>> snapshot) {
        final currentTask = snapshot.data?? List();

        return ListView.builder(
          itemCount: currentTask.length,
          itemBuilder: (_, index) {
            final itemTask = currentTask[index];
            return _buildCurrentTaskListItem(itemTask, database);
          },
        );

      },
    );
  }

  Widget _buildCurrentTaskListItem(CurrentTask currentItem, CurrentTasksDao database) {
    return
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/current_history', arguments: {
            "currentItem" : currentItem,
            "layer" : _layer + 1,
          });

        },
        child: Card(
          color: currentItem.taskIsImportant ? Colors.redAccent : null,
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      _showButton(currentItem.isCompleted, currentItem),
                      SizedBox(width: 10,),
                      Text(_taskTypes[currentItem.taskType]),
                      SizedBox(width: 10,),
                      Expanded(
                          child: Text(
                            currentItem.description ,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                      ),

                    ],
                  ),
                  Text("Date Added: " + currentItem.dateAdded.toString()),
                  Text("Date Changed: " + currentItem.dateChanged.toString()),
                  _showDateCompleted(currentItem.isCompleted, currentItem),
                ],
              )

        ),
      );
  }

  Widget _showButton(bool isCompleted, CurrentTask currentTask)
  {
    if (isCompleted)
    {
      return RaisedButton(
          child: Text("Undo"),
          onPressed: (){
            final database = Provider.of<CurrentTasksDao>(context, listen: false);
            database.updateCurrentTask(currentTask.copyWith(
              dateCompleted: null,
              isCompleted: false,
              dateChanged: DateTime.now(),
            ));
          }
      );
    }
    return RaisedButton(
      onPressed: null,
      child: Text("Todo"),
    );
  }

  Widget _showDateCompleted(bool isCompleted, CurrentTask currentTask)
  {
    if(isCompleted)
    {
      return Text("Date Completed: " + currentTask.dateCompleted.toString());
    }
    return Container();
  }
}
