import 'package:bullet_journal/services/journal_drawer.dart';
import 'package:flutter/material.dart';
import 'package:bullet_journal/data/journal_database.dart';
import 'package:bullet_journal/services/journal_entrytypes.dart';
import 'package:provider/provider.dart';

class CurrentPage extends StatefulWidget {
  @override
  _CurrentPageState createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {


  int _layer = 0;
  int _previousLayer = -1;
  bool _hasDrawer = true;
  String _title = "Current Tasks";
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
      _hasDrawer = _data["hasDrawer"];
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
        actions: [
          IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Navigator.pushNamed(context, "/current_history");
              })
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildCurrentTasksList(context))
        ],
      ),
      drawer: _hasDrawer ? JournalDrawer() : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/current_data',
              arguments: {
                "currentItem" : _currentTask,
                "layer" : _layer,
                "entryMode" : journal_entryMode.add,
              }
          );
        },
        backgroundColor: Colors.black,
        splashColor: Colors.black54,
        child: Icon(
            Icons.add
        ),
      ),
    );
  }

  StreamBuilder<List<CurrentTask>> _buildCurrentTasksList(BuildContext context) {
    final database = Provider.of<CurrentTasksDao>(context, listen: false);
    return StreamBuilder(
      // stream: database.watchAllCurrentTasks(),
      stream: database.watchCurrentTasksInLayer(_layer, _previousLayer),
      builder: (context, AsyncSnapshot<List<CurrentTask>> snapshot) {
        final currentTask = snapshot.data ?? List();
        currentTask.add(new CurrentTask(id: -1));
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
    if (currentItem.id == -1)
    {
      return SizedBox(height: 80,);
    }
    return
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/current_task', arguments: {
            "currentItem" : currentItem,
            "layer" : _layer + 1,
            "hasDrawer" : false,
          });

        },
        child: Card(
          color: currentItem.taskIsImportant ? Colors.redAccent : null,
          child:
          Row(
            children: [
              IconButton(

                  icon: currentItem.isCompleted ? Icon(Icons.done) : Icon(Icons.check_box_outline_blank_sharp),
                  onPressed: () {
                    setState(() {
                      database.completeAllCurrentTaskId(currentItem);
                    });
                  }
              ),
              Text(_taskTypes[currentItem.taskType]),
              SizedBox(width: 10,),
              Expanded(
                child: Text(
                  currentItem.description,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              PopupMenuButton(
                onSelected: (PopupMenuItemsValue result) {
                  setState(() {

                    if (result == PopupMenuItemsValue.delete)
                    {
                      database.deleteAllCurrentTaskId(currentItem);
                    }
                    if (result == PopupMenuItemsValue.edit)
                    {
                      Navigator.pushNamed(context, '/current_data', arguments: {
                        'currentItem': currentItem,
                        'layer' : _layer,
                        "entryMode" : journal_entryMode.edit,}
                      );
                    }
                  });
                },
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<PopupMenuItemsValue>>
                [
                  const PopupMenuItem(
                      value: PopupMenuItemsValue.edit,
                      child: Text('Edit')),
                  const PopupMenuItem(
                      value: PopupMenuItemsValue.delete,
                      child: Text('Delete'))
                ],
              ),
            ],
          ),
        ),
      );
  }
}


