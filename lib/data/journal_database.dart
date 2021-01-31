import 'package:moor_flutter/moor_flutter.dart';
import 'package:moor/moor.dart';

part 'journal_database.g.dart';

class Notes extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get noteDescription => text().nullable()();
  IntColumn get layerId => integer().nullable()();
  IntColumn get previousLayerId => integer().nullable()();
  DateTimeColumn get dateAdded => dateTime().nullable()();
  DateTimeColumn get dateChanged => dateTime().nullable()();
}

class FutureTasks extends Table{
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get dateChanged => dateTime().nullable()();
  DateTimeColumn get dateAdded => dateTime().nullable()();
  IntColumn get layerId => integer().nullable()();
  IntColumn get previousLayerId => integer().nullable()();
  TextColumn get description => text().nullable()();
  BoolColumn get taskIsImportant => boolean().withDefault(Constant(false))();
  IntColumn get taskType => integer().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get dateCompleted => dateTime().nullable()();
}

class MonthlyTasks extends Table{
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get dateChanged => dateTime().nullable()();
  DateTimeColumn get dateAdded => dateTime().nullable()();
  IntColumn get layerId => integer().nullable()();
  IntColumn get previousLayerId => integer().nullable()();
  TextColumn get description => text().nullable()();
  BoolColumn get taskIsImportant => boolean().withDefault(Constant(false))();
  IntColumn get taskType => integer().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get dateCompleted => dateTime().nullable()();
}

class Habits extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text().nullable()();
  BoolColumn get isVisible => boolean().withDefault(Constant(false))();
}

class Trackers extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get habitId => integer().nullable()();
  DateTimeColumn get habitDate => dateTime().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(Constant(false))();
}

class CurrentTasks extends Table{
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get dateAdded => dateTime().nullable()();
  DateTimeColumn get dateChanged => dateTime().nullable()();
  IntColumn get layerId => integer().nullable()();
  IntColumn get previousLayerId => integer().nullable()();
  TextColumn get description => text().nullable()();
  BoolColumn get taskIsImportant => boolean().withDefault(Constant(false))();
  IntColumn get taskType => integer().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(Constant(false))();
  DateTimeColumn get dateCompleted => dateTime().nullable()();
}

@UseMoor(
  tables: [
    Notes,
    FutureTasks,
    MonthlyTasks,
    Habits,
    Trackers,
    CurrentTasks
  ],
  daos: [
    NotesDao,
    FutureTasksDao,
    MonthlyTasksDao,
    CurrentTasksDao,
    HabitsDao,
    TrackersDao
  ])
class AppDatabase extends _$AppDatabase {
  AppDatabase() :
      super(FlutterQueryExecutor.inDatabaseFolder(
        path: 'db.sqlite',
        logStatements: true,
      ));

  @override
  int get schemaVersion => 2;

}

@UseDao(tables: [Notes])
class NotesDao extends DatabaseAccessor<AppDatabase> with _$NotesDaoMixin
{
  final AppDatabase db;
  NotesDao(this.db) : super(db);

  Future<List<Note>> getAllNotes() => select(notes).get();
  Stream<List<Note>> watchAllNotes() => select(notes).watch();

  Stream<List<Note>> watchNotesInLayer(int layer, int prevLayer) {
    return
      (select(notes)..
        where((tbl) => tbl.layerId.equals(layer)
          & tbl.previousLayerId.equals(prevLayer
        )))
      .watch();
  }

  Future insertNote(Insertable<Note> note) => into(notes).insert(note);
  Future updateNote(Insertable<Note> note) => update(notes).replace(note);
  Future deleteNote(Insertable<Note> note) => delete(notes).delete(note);

  Future deleteAllNoteId(Note note) async
  {
    List<Note> deleteList = [note];
    List<Note> lookUpList = await getAllNotesId(note.id);

    while(lookUpList.length > 0)
    {

      deleteList = deleteList + lookUpList;
      List<Note> tempList = new List<Note>();
      tempList = tempList + lookUpList;

      lookUpList.clear();

      for (var i in tempList)
      {
        lookUpList = lookUpList + await getAllNotesId(i.id);
      }
    }

    for(var i in  deleteList)
    {
      deleteNote(i);
    }
  }

  Future<List<Note>> getAllNotesId(int id)
  {
    return
      (select(notes)..
          where((tbl) => tbl.previousLayerId.equals(id))
      ).get();
  }
}

@UseDao(tables: [FutureTasks])
class FutureTasksDao extends DatabaseAccessor<AppDatabase> with _$FutureTasksDaoMixin
{
  final AppDatabase db;
  FutureTasksDao(this.db) : super(db);

  Future<List<FutureTask>> getAllFutureTasks() => select(futureTasks).get();
  Stream<List<FutureTask>> watchAllFutureTasks() => select(futureTasks).watch();

  Stream<List<FutureTask>> watchFutureTasksInLayer(int layer, int prevLayer)
  {
    return
      (select(futureTasks)..
        where((tbl) => tbl.layerId.equals(layer)
            & tbl.previousLayerId.equals(prevLayer)
            & tbl.isCompleted.equals(false)
        )).watch();
  }


  Stream<List<FutureTask>> watchFutureHistoryInLayer(int layer, int prevLayer)
  {
    return
      (select(futureTasks)..
      where((tbl) => tbl.layerId.equals(layer)
      & tbl.previousLayerId.equals(prevLayer)
      )).watch();
  }

  Future insertFutureTask(Insertable<FutureTask> futureTask) => into(futureTasks).insert(futureTask);
  Future updateFutureTask(Insertable<FutureTask> futureTask) => update(futureTasks).replace(futureTask);
  Future deleteFutureTask(Insertable<FutureTask> futureTask) => delete(futureTasks).delete(futureTask);

  Future deleteAllFutureTaskId(FutureTask futureTask) async {
    List<FutureTask> deleteList = [futureTask];
    List<FutureTask> lookUpList = await getAllFutureTaskId(futureTask.id);

    while(lookUpList.length > 0)
    {
      deleteList = deleteList + lookUpList;
      List<FutureTask> tempList = new List<FutureTask>();
      tempList = tempList + lookUpList;

      lookUpList.clear();

      for (var i in tempList)
      {
        lookUpList = lookUpList + await getAllFutureTaskId(i.id);
      }
    }

    for (var i in deleteList)
    {
        deleteFutureTask(i);
    }

  }

  Future completeAllFutureTaskId(FutureTask futureTask) async {
    List<FutureTask> completeList = [futureTask];
    List<FutureTask> lookUpList = await getAllFutureTaskId(futureTask.id);

    while(lookUpList.length > 0)
    {
      completeList = completeList + lookUpList;
      List<FutureTask> tempList = new List<FutureTask>();
      tempList = tempList + lookUpList;

      lookUpList.clear();

      for (var i in tempList)
      {
        lookUpList = lookUpList + await getAllFutureTaskId(i.id);
      }
    }

    for (var i in completeList)
    {
      updateFutureTask(i.copyWith(
        dateChanged: DateTime.now(),
        dateCompleted: DateTime.now(),
        isCompleted: true,
      ));
    }
  }

  Future<List<FutureTask>> getAllFutureTaskId(int id)
  {
    return
      (select(futureTasks)..
        where((tbl) => tbl.previousLayerId.equals(id))
      ).get();
  }
}

@UseDao(tables: [MonthlyTasks])
class MonthlyTasksDao extends DatabaseAccessor<AppDatabase> with _$MonthlyTasksDaoMixin
{
  final AppDatabase db;
  MonthlyTasksDao(this.db):super(db);

  Future<List<MonthlyTask>> getAllMonthlyTasks() => select(monthlyTasks).get();
  Stream<List<MonthlyTask>> watchAllMonthlyTasks() => select(monthlyTasks).watch();

  Stream<List<MonthlyTask>> watchMonthlyTasksInLayer(int layer, int prevLayer)
  {
    return
      (select(monthlyTasks)..
        where((tbl) => tbl.layerId.equals(layer)
        & tbl.previousLayerId.equals(prevLayer)
        & tbl.isCompleted.equals(false)
      )).watch();
  }

  Stream<List<MonthlyTask>> watchMonthlyHistoryInLayer(int layer, int prevLayer)
  {
    return
      (select(monthlyTasks)..
      where((tbl) => tbl.layerId.equals(layer)
      & tbl.previousLayerId.equals(prevLayer)
      )).watch();
  }

  Future insertMonthlyTask(Insertable<MonthlyTask> monthlyTask) => into(monthlyTasks).insert(monthlyTask);
  Future updateMonthlyTask(Insertable<MonthlyTask> monthlyTask) => update(monthlyTasks).replace(monthlyTask);
  Future deleteMonthlyTask(Insertable<MonthlyTask> monthlyTask) => delete(monthlyTasks).delete(monthlyTask);

  Future deleteAllMonthlyTaskId(MonthlyTask monthlyTask) async {
    List<MonthlyTask> deleteList = [monthlyTask];
    List<MonthlyTask> lookUpList = await getAllMonthlyTaskId(monthlyTask.id);

    while(lookUpList.length > 0)
    {
      deleteList = deleteList + lookUpList;
      List<MonthlyTask> tempList = new List<MonthlyTask>();
      tempList = tempList + lookUpList;

      lookUpList.clear();

      for (var i in tempList)
      {
        lookUpList = lookUpList + await getAllMonthlyTaskId(i.id);
      }
    }

    for (var i in deleteList)
    {
      deleteMonthlyTask(i);
    }

  }

  Future completeAllMonthlyTaskId(MonthlyTask monthlyTask) async {
    List<MonthlyTask> completeList = [monthlyTask];
    List<MonthlyTask> lookUpList = await getAllMonthlyTaskId(monthlyTask.id);

    while(lookUpList.length > 0)
    {
      completeList = completeList + lookUpList;
      List<MonthlyTask> tempList = new List<MonthlyTask>();
      tempList = tempList + lookUpList;

      lookUpList.clear();

      for (var i in tempList)
      {
        lookUpList = lookUpList + await getAllMonthlyTaskId(i.id);
      }
    }

    for (var i in completeList)
    {
      updateMonthlyTask(i.copyWith(
        dateChanged: DateTime.now(),
        dateCompleted: DateTime.now(),
        isCompleted: true,
      ));
    }
  }

  Future<List<MonthlyTask>> getAllMonthlyTaskId(int id)
  {
    return
      (select(monthlyTasks)..
      where((tbl) => tbl.previousLayerId.equals(id))
      ).get();
  }

}

@UseDao(tables: [CurrentTasks])
class CurrentTasksDao extends DatabaseAccessor<AppDatabase> with _$CurrentTasksDaoMixin
{
  final AppDatabase db;
  CurrentTasksDao(this.db) : super(db);

  Future<List<CurrentTask>> getAllCurrentTasks() => select(currentTasks).get();
  Stream<List<CurrentTask>> watchAllCurrentTasks() => select(currentTasks).watch();

  Stream<List<CurrentTask>> watchCurrentTasksInLayer(int layer, int prevLayer)
  {
    return
      (select(currentTasks)..
        where((tbl) => tbl.layerId.equals(layer)
        & tbl.previousLayerId.equals(prevLayer)
        & tbl.isCompleted.equals(false)
      )).watch();
  }

  Future<List<CurrentTask>> getCurrentTasksInLayer(int layer, int prevLayer)
  {
    return
      (select(currentTasks)..
      where((tbl) => tbl.layerId.equals(layer)
      & tbl.previousLayerId.equals(prevLayer)
      )).get();
  }

  Stream<List<CurrentTask>> watchCurrentHistoryInLayer(int layer, int prevLayer)
  {
    return
      (select(currentTasks)..
      where((tbl) => tbl.layerId.equals(layer)
      & tbl.previousLayerId.equals(prevLayer)
      )).watch();
  }

  Future insertCurrentTask(Insertable<CurrentTask> currentTask) => into(currentTasks).insert(currentTask);
  Future updateCurrentTask(Insertable<CurrentTask> currentTask) => update(currentTasks).replace(currentTask);
  Future deleteCurrentTask(Insertable<CurrentTask> currentTask) => delete(currentTasks).delete(currentTask);

  Future deleteAllCurrentTaskId(CurrentTask currentTask) async {
    List<CurrentTask> deleteList = [currentTask];
    List<CurrentTask> lookUpList = await getAllCurrentTaskId(currentTask.id);

    while(lookUpList.length > 0)
    {
      deleteList = deleteList + lookUpList;
      List<CurrentTask> tempList = new List<CurrentTask>();
      tempList = tempList + lookUpList;

      lookUpList.clear();

      for (var i in tempList)
      {
        lookUpList = lookUpList + await getAllCurrentTaskId(i.id);
      }
    }

    for (var i in deleteList)
    {
      deleteCurrentTask(i);
    }

  }

  Future completeAllCurrentTaskId(CurrentTask currentTask) async {
    List<CurrentTask> completeList = [currentTask];
    List<CurrentTask> lookUpList = await getAllCurrentTaskId(currentTask.id);

    while(lookUpList.length > 0)
    {
      completeList = completeList + lookUpList;
      List<CurrentTask> tempList = new List<CurrentTask>();
      tempList = tempList + lookUpList;

      lookUpList.clear();

      for (var i in tempList)
      {
        lookUpList = lookUpList + await getAllCurrentTaskId(i.id);
      }
    }

    for (var i in completeList)
    {
      updateCurrentTask(i.copyWith(
        dateChanged: DateTime.now(),
        dateCompleted: DateTime.now(),
        isCompleted: true,
      ));
    }
  }

  Future<List<CurrentTask>> getAllCurrentTaskId(int id)
  {
    return
      (select(currentTasks)..
        where((tbl) => tbl.previousLayerId.equals(id))
      ).get();
  }
}

@UseDao(tables: [Habits])
class HabitsDao extends DatabaseAccessor<AppDatabase> with _$HabitsDaoMixin
{
  final AppDatabase db;
  HabitsDao(this.db) : super(db);

  Future<List<Habit>> getAllHabits() => select(habits).get();
  Stream<List<Habit>> watchAllHabits() => select(habits).watch();
  Stream<List<Habit>> watchAllVisibleHabits()
  {
    return
      (select(habits)
          ..where((tbl)=> tbl.isVisible.equals(true) )).watch();
  }

  Future<List<Habit>> getAllVisibleHabits()
  {
    return
      (select(habits)
        ..where((tbl) => tbl.isVisible.equals(true))).get();

  }

  Future insertHabit(Insertable<Habit> habit) => into(habits).insert(habit);
  Future updateHabit(Insertable<Habit> habit) => update(habits).replace(habit);
  Future deleteHabit(Insertable<Habit> habit) => delete(habits).delete(habit);


}

@UseDao(tables: [Trackers])
class TrackersDao extends DatabaseAccessor<AppDatabase> with _$TrackersDaoMixin
{
  final AppDatabase db;
  TrackersDao(this.db):super(db);

  Stream<List<Tracker>> watchAllTrackers() => select(trackers).watch();
  Stream<List<Tracker>> watchTracker(int _id, DateTime _date)
  {
    return (select(trackers)..where((tbl) => tbl.habitId.equals(_id) &
      tbl.habitDate.equals(_date) &
      tbl.isCompleted.equals(true)
    )).watch();
  }

  Future<List<Tracker>> getTracker(int _id, DateTime _date)
  {
    return (select(trackers)..where((tbl) => tbl.habitId.equals(_id) &
      tbl.habitDate.equals(_date) &
      tbl.isCompleted.equals(true)
    )).get();
  }

  Future insertTracker(Insertable<Tracker> tracker) => into(trackers).insert(tracker);
  Future updateTracker(Insertable<Tracker> tracker) => update(trackers).replace(tracker);
  Future deleteTracker(Insertable<Tracker> tracker) => delete(trackers).delete(tracker);
}
