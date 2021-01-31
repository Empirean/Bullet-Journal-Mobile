import 'package:flutter/material.dart';
import 'package:bullet_journal/services/journal_drawer.dart';
import 'package:provider/provider.dart';
import 'package:bullet_journal/data/journal_database.dart';

class TrackerPage extends StatefulWidget {
  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {

  DateTime _currentDate;
  List<String> _days;

  @override
  void initState() {

    super.initState();
    _currentDate = DateTime.now();
    _days = _generateDayList(_currentDate);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Tracker",
          style: TextStyle(
              fontSize: 30.0
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today_outlined),
            onPressed: () async {
              final DateTime picker = await showDatePicker(
                context: context,
                initialDate: _currentDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2050),

              );

              if (picker !=null && picker != _currentDate)
              {
                setState(() {
                  _currentDate = picker;
                  _days = _generateDayList(_currentDate);
                });
              }
            }
          ),
        ],
      ),

      body:
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child:
          Row(
            children: [
              StreamBuilder(
                stream: _getHabits(),
                builder: (context, snapshot)
                {
                  return FutureBuilder(
                    future: _getRows(),
                    builder: (context, snapshot)
                    {
                      if (snapshot.hasData && snapshot != null)
                      {
                        return DataTable(
                          headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black54),
                          columns: _getColumns(),
                          rows:snapshot.data,);
                      }

                      return DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.black54),
                        columns: _getColumns(),
                        rows:[],);
                    },
                  );
                }
              ),
              SizedBox(width: 100,),
            ],
          ),
        ),
      ),

      drawer: JournalDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/habits',);
        },
        backgroundColor: Colors.black,
        splashColor: Colors.black54,
        child: Icon(
            Icons.view_list_outlined
        ),
      ),
    );
  }

  List<String> _generateDayList(DateTime currentDay)
  {
    List<String> _returnList = new List<String>();
    _returnList.add("Habits");
    for(int i = 1; i <= DateTime(_currentDate.year, _currentDate.month + 1, 0).day; i++)
    {
      _returnList.add(i.toString());
    }

    return _returnList;
  }

  List<DataColumn> _getColumns()
  {
    List<DataColumn> _dataColumns = new List<DataColumn>();

    for(var i in _days)
    {
      _dataColumns.add(
          new DataColumn(label: Text(i,
            style: TextStyle(
              fontSize: 30,
            ),

          ))
      );
    }

    return _dataColumns;
  }

  Stream<List<Habit>> _getHabits()
  {
    final db = Provider.of<HabitsDao>(context, listen: false);
    return db.watchAllVisibleHabits();
  }

  Future<List<DataRow>> _getRows() async
  {
    List<DataRow> _dataRows = new List<DataRow>();

    final dbHabits = Provider.of<HabitsDao>(context, listen: false);

    List<Habit> _habits = await dbHabits.getAllVisibleHabits();

    for(var i in _habits)
    {
      List<DataCell> _cellList = new List<DataCell>();

      for(int j = 0; j < _days.length; j++)
      {
        if (j == 0)
        {

          DataCell dc = new DataCell(
            Text(i.description,
              style: TextStyle(
                fontSize: 30,
              ),
            )
          );
          _cellList.add(dc);
        }
        else
        {
            DataCell dc = new DataCell(

            StreamBuilder(
              stream: _watchRowIcon(i.id, int.parse(_days[j])),
              builder: (context, snapshot) {

                if (snapshot.hasData && snapshot.data.isNotEmpty && snapshot != null)
                {
                  return Icon(Icons.check_box_outlined);
                }

                return Icon(Icons.check_box_outline_blank);

              },
            ),
            onTap: () async {

              final db = Provider.of<TrackersDao>(context, listen: false);

              List<Tracker> trackerList = await db.getTracker(i.id, new DateTime(_currentDate.year, _currentDate.month, int.parse(_days[j])));
              if (trackerList.length > 0)
              {
                db.deleteTracker(trackerList[0]);
              }
              else
              {
                Tracker tracker = Tracker(
                    habitDate: new DateTime(_currentDate.year, _currentDate.month, j),
                    habitId: i.id,
                    isCompleted: true
                );

                db.insertTracker(tracker);
              }


            },
          );
          _cellList.add(dc);
        }
      }
      _dataRows.add(new DataRow(cells: _cellList));
    }

    return _dataRows;
  }

  Stream<List<Tracker>> _watchRowIcon(int id, int day)
  {
    final db = Provider.of<TrackersDao>(context, listen: false);
    return  db.watchTracker(id, new DateTime(_currentDate.year, _currentDate.month, day));

  }

}