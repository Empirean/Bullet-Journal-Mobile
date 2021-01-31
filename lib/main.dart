import 'package:bullet_journal/data/journal_database.dart';
import 'package:bullet_journal/data_entry/current_data.dart';
import 'package:bullet_journal/data_entry/future_data.dart';
import 'package:bullet_journal/data_entry/habit_data.dart';
import 'package:bullet_journal/data_entry/monthly_data.dart';
import 'package:bullet_journal/data_entry/notes_data.dart';
import 'package:bullet_journal/history/future_history.dart';
import 'package:bullet_journal/history/monthly_history.dart';
import 'package:bullet_journal/pages/current_task.dart';
import 'package:bullet_journal/pages/future_task.dart';
import 'package:bullet_journal/pages/habits.dart';
import 'package:bullet_journal/pages/monthly_task.dart';
import 'package:bullet_journal/pages/notes.dart';
import 'package:bullet_journal/history/current_history.dart';
import 'package:flutter/material.dart';
import 'package:bullet_journal/pages/tracker.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final db = AppDatabase();
    return MultiProvider(
      providers:[
        Provider(
          create: (_) => db.notesDao
        ),
        Provider(
          create: (_) => db.futureTasksDao,
        ),
        Provider(
          create: (_) => db.monthlyTasksDao,
        ),
        Provider(
          create: (_) => db.currentTasksDao,
        ),
        Provider(
          create: (_) => db.habitsDao,
        ),
        Provider(
          create: (_) => db.trackersDao,
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/' : (context) => TrackerPage(),
          '/habits' : (context) => HabitsPage(),
          '/habit_data' : (context) => HabitData(),
          '/current_task' : (context) => CurrentPage(),
          '/current_data' : (context) => CurrentData(),
          '/current_history' : (context) => CurrentHistory(),
          '/monthly_task' : (context) => MonthlyPage(),
          '/monthly_data' : (context) => MonthlyData(),
          '/monthly_history' : (context) => MonthlyHistory(),
          '/future_task' : (context) => FuturePage(),
          '/future_data' : (context) => FutureData(),
          '/future_history' : (context) => FutureHistory(),
          '/notes' : (context) => NotesPage(),
          '/notes_data' : (context) => NotesData(),
        },
      ),
    );
  }
}




