import 'package:bullet_journal/services/journal_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bullet_journal/data/journal_database.dart';
import 'package:bullet_journal/services/journal_entrytypes.dart';


class MonthlyPage extends StatefulWidget {
  @override
  _MonthlyPageState createState() => _MonthlyPageState();
}

class _MonthlyPageState extends State<MonthlyPage> {

  int _layer = 0;
  int _previousLayer = -1;
  bool _hasDrawer = true;
  String _title = "Monthly Tasks";
  Map _data = {};
  MonthlyTask _currentTask;
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
      _currentTask = _data["monthlyItem"];

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
                Navigator.pushNamed(context, "/monthly_history");
              }
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _buildMonthlyTasksList(context))
        ],
      ),
      drawer: _hasDrawer ? JournalDrawer() : null,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/monthly_data',
              arguments: {
                "monthlyItem" : _currentTask,
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

  StreamBuilder<List<MonthlyTask>> _buildMonthlyTasksList(BuildContext context) {
    final database = Provider.of<MonthlyTasksDao>(context, listen: false);
    return StreamBuilder(
      // stream: database.watchAllMonthlyTasks(),
      stream: database.watchMonthlyTasksInLayer(_layer, _previousLayer),
      builder: (context, AsyncSnapshot<List<MonthlyTask>> snapshot) {
        final monthlyTask = snapshot.data ?? List();
        monthlyTask.add(new MonthlyTask(id: -1, taskIsImportant: false, isCompleted: false));
        return ListView.builder(
          itemCount: monthlyTask.length,
          itemBuilder: (_, index) {
            final itemTask = monthlyTask[index];
            return _buildMonthlyTaskListItem(itemTask, database);
          },
        );
      },
    );
  }

  Widget _buildMonthlyTaskListItem(MonthlyTask monthlyItem, MonthlyTasksDao database) {
    if (monthlyItem.id == -1)
    {
      return SizedBox(height: 80,);
    }
    return
      GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/monthly_task', arguments: {
            "monthlyItem" : monthlyItem,
            "layer" : _layer + 1,
            "hasDrawer" : false,
          });

        },
        child: Card(
          color: monthlyItem.taskIsImportant ? Colors.redAccent : null,
          child:
          Row(
            children: [
              IconButton(

                  icon: monthlyItem.isCompleted ? Icon(Icons.done) : Icon(Icons.check_box_outline_blank_sharp),
                  onPressed: () {
                    setState(() {
                      database.completeAllMonthlyTaskId(monthlyItem);
                    });
                  }
              ),
              Text(_taskTypes[monthlyItem.taskType]),
              SizedBox(width: 10,),
              Expanded(
                child: Text(
                  monthlyItem.description,
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
                      database.deleteAllMonthlyTaskId(monthlyItem);
                    }
                    if (result == PopupMenuItemsValue.edit)
                    {
                      Navigator.pushNamed(context, '/monthly_data', arguments: {
                        'monthlyItem': monthlyItem,
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

