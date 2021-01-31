import 'package:bullet_journal/data/journal_database.dart';
import 'package:bullet_journal/services/journal_entrytypes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HabitsPage extends StatefulWidget {
  @override
  _HabitsState createState() => _HabitsState();
}

class _HabitsState extends State<HabitsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Habits',
          style: TextStyle(
            fontSize: 30.0,
          ),

        ),
        backgroundColor: Colors.black,
      ),

      body: Column(
        children: [
          Expanded(
            child: _buildNoteList(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
        splashColor: Colors.black54,
        onPressed: () {
          Navigator.pushNamed(context, '/habit_data');
        },
      ),
    );
  }


  StreamBuilder<List<Habit>> _buildNoteList(BuildContext context) {

    final database = Provider.of<HabitsDao>(context, listen: false);
    return StreamBuilder(
      // stream: database.watchAllNotes(),
      stream: database.watchAllHabits(),
      builder: (context, AsyncSnapshot<List<Habit>> snapshot) {
        final habits = snapshot.data ?? List();
        habits.add(new Habit(id: -1, isVisible: false));
        return ListView.builder(
          itemCount: habits.length,
          itemBuilder: (_, index) {
            final habitItem = habits[index];
            return _buildHabitsListItem(habitItem, database);
          },
        );
      },
    );
  }

  Widget _buildHabitsListItem(Habit habitItem, HabitsDao database) {

    if (habitItem.id == -1)
    {
      return SizedBox(height: 80,);
    }
    return
      GestureDetector(
        onTap: (){

        },
        child: Card(
          child:
          Row(
            children: [
              IconButton(
                icon: habitItem.isVisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    final database = Provider.of<HabitsDao>(context, listen: false);
                    database.updateHabit(habitItem.copyWith(
                      isVisible: !habitItem.isVisible
                    ));
                  });
                }
              ),
              SizedBox(width: 20,),
              Expanded(
                child:
                Text(
                  habitItem.description,
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
                      database.deleteHabit(habitItem);
                    }

                    if (result == PopupMenuItemsValue.edit)
                    {
                      Navigator.pushNamed(context, '/habit_data', arguments: {
                        'habitItem': habitItem,
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
