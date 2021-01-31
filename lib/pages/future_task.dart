import 'package:bullet_journal/services/journal_drawer.dart';
import 'package:bullet_journal/data/journal_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bullet_journal/services/journal_entrytypes.dart';


class FuturePage extends StatefulWidget {
  @override
  _FuturePageState createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {

  int _layer = 0;
  int _previousLayer = -1;
  bool _hasDrawer = true;
  String _title = "Future Log";
  Map _data = {};
  FutureTask _currentTask;
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
      _currentTask = _data["futureItem"];

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
                Navigator.pushNamed(context, "/future_history");
              }
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildFutureTasksList(context))
        ],
      ),
      drawer: _hasDrawer ? JournalDrawer() : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/future_data',
              arguments: {
                "futureItem" : _currentTask,
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

  StreamBuilder<List<FutureTask>> _buildFutureTasksList(BuildContext context) {
    final database = Provider.of<FutureTasksDao>(context, listen: false);
    return StreamBuilder(
      // stream: database.watchAllFutureTasks(),
      stream: database.watchFutureTasksInLayer(_layer, _previousLayer),
      builder: (context, AsyncSnapshot<List<FutureTask>> snapshot) {
        final futureTask = snapshot.data ?? List();
        futureTask.add(new FutureTask(id: -1, taskIsImportant: false, isCompleted: false));
        return ListView.builder(
          itemCount: futureTask.length,
          itemBuilder: (_, index) {
            final itemTask = futureTask[index];
            return _buildFutureTaskListItem(itemTask, database);
          },
        );
      },
    );
  }

  Widget _buildFutureTaskListItem(FutureTask futureItem, FutureTasksDao database) {
    if (futureItem.id == -1)
    {
      return SizedBox(height: 80,);
    }

    return
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/future_task', arguments: {
            "futureItem" : futureItem,
            "layer" : _layer + 1,
            "hasDrawer" : false,
          });

        },
        child: Card(
          color: futureItem.taskIsImportant ? Colors.redAccent : null,
          child:
          Row(
            children: [
              IconButton(

                icon: futureItem.isCompleted ? Icon(Icons.done) : Icon(Icons.check_box_outline_blank_sharp),
                onPressed: () {
                  setState(() {
                    database.completeAllFutureTaskId(futureItem);
                  });
                }
              ),
              Text(_taskTypes[futureItem.taskType]),
              SizedBox(width: 10,),
              Expanded(
                child: Text(
                  futureItem.description,
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
                      database.deleteAllFutureTaskId(futureItem);
                    }
                    if (result == PopupMenuItemsValue.edit)
                    {
                      Navigator.pushNamed(context, '/future_data', arguments: {
                        'futureItem': futureItem,
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

