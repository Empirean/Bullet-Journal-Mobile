// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Note extends DataClass implements Insertable<Note> {
  final int id;
  final String noteDescription;
  final int layerId;
  final int previousLayerId;
  final DateTime dateAdded;
  final DateTime dateChanged;
  Note(
      {@required this.id,
      this.noteDescription,
      this.layerId,
      this.previousLayerId,
      this.dateAdded,
      this.dateChanged});
  factory Note.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Note(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      noteDescription: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}note_description']),
      layerId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}layer_id']),
      previousLayerId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}previous_layer_id']),
      dateAdded: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_added']),
      dateChanged: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_changed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || noteDescription != null) {
      map['note_description'] = Variable<String>(noteDescription);
    }
    if (!nullToAbsent || layerId != null) {
      map['layer_id'] = Variable<int>(layerId);
    }
    if (!nullToAbsent || previousLayerId != null) {
      map['previous_layer_id'] = Variable<int>(previousLayerId);
    }
    if (!nullToAbsent || dateAdded != null) {
      map['date_added'] = Variable<DateTime>(dateAdded);
    }
    if (!nullToAbsent || dateChanged != null) {
      map['date_changed'] = Variable<DateTime>(dateChanged);
    }
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      noteDescription: noteDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(noteDescription),
      layerId: layerId == null && nullToAbsent
          ? const Value.absent()
          : Value(layerId),
      previousLayerId: previousLayerId == null && nullToAbsent
          ? const Value.absent()
          : Value(previousLayerId),
      dateAdded: dateAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(dateAdded),
      dateChanged: dateChanged == null && nullToAbsent
          ? const Value.absent()
          : Value(dateChanged),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      noteDescription: serializer.fromJson<String>(json['noteDescription']),
      layerId: serializer.fromJson<int>(json['layerId']),
      previousLayerId: serializer.fromJson<int>(json['previousLayerId']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      dateChanged: serializer.fromJson<DateTime>(json['dateChanged']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'noteDescription': serializer.toJson<String>(noteDescription),
      'layerId': serializer.toJson<int>(layerId),
      'previousLayerId': serializer.toJson<int>(previousLayerId),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'dateChanged': serializer.toJson<DateTime>(dateChanged),
    };
  }

  Note copyWith(
          {int id,
          String noteDescription,
          int layerId,
          int previousLayerId,
          DateTime dateAdded,
          DateTime dateChanged}) =>
      Note(
        id: id ?? this.id,
        noteDescription: noteDescription ?? this.noteDescription,
        layerId: layerId ?? this.layerId,
        previousLayerId: previousLayerId ?? this.previousLayerId,
        dateAdded: dateAdded ?? this.dateAdded,
        dateChanged: dateChanged ?? this.dateChanged,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('noteDescription: $noteDescription, ')
          ..write('layerId: $layerId, ')
          ..write('previousLayerId: $previousLayerId, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('dateChanged: $dateChanged')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          noteDescription.hashCode,
          $mrjc(
              layerId.hashCode,
              $mrjc(previousLayerId.hashCode,
                  $mrjc(dateAdded.hashCode, dateChanged.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.noteDescription == this.noteDescription &&
          other.layerId == this.layerId &&
          other.previousLayerId == this.previousLayerId &&
          other.dateAdded == this.dateAdded &&
          other.dateChanged == this.dateChanged);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<String> noteDescription;
  final Value<int> layerId;
  final Value<int> previousLayerId;
  final Value<DateTime> dateAdded;
  final Value<DateTime> dateChanged;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.noteDescription = const Value.absent(),
    this.layerId = const Value.absent(),
    this.previousLayerId = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.dateChanged = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    this.noteDescription = const Value.absent(),
    this.layerId = const Value.absent(),
    this.previousLayerId = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.dateChanged = const Value.absent(),
  });
  static Insertable<Note> custom({
    Expression<int> id,
    Expression<String> noteDescription,
    Expression<int> layerId,
    Expression<int> previousLayerId,
    Expression<DateTime> dateAdded,
    Expression<DateTime> dateChanged,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteDescription != null) 'note_description': noteDescription,
      if (layerId != null) 'layer_id': layerId,
      if (previousLayerId != null) 'previous_layer_id': previousLayerId,
      if (dateAdded != null) 'date_added': dateAdded,
      if (dateChanged != null) 'date_changed': dateChanged,
    });
  }

  NotesCompanion copyWith(
      {Value<int> id,
      Value<String> noteDescription,
      Value<int> layerId,
      Value<int> previousLayerId,
      Value<DateTime> dateAdded,
      Value<DateTime> dateChanged}) {
    return NotesCompanion(
      id: id ?? this.id,
      noteDescription: noteDescription ?? this.noteDescription,
      layerId: layerId ?? this.layerId,
      previousLayerId: previousLayerId ?? this.previousLayerId,
      dateAdded: dateAdded ?? this.dateAdded,
      dateChanged: dateChanged ?? this.dateChanged,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (noteDescription.present) {
      map['note_description'] = Variable<String>(noteDescription.value);
    }
    if (layerId.present) {
      map['layer_id'] = Variable<int>(layerId.value);
    }
    if (previousLayerId.present) {
      map['previous_layer_id'] = Variable<int>(previousLayerId.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (dateChanged.present) {
      map['date_changed'] = Variable<DateTime>(dateChanged.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('noteDescription: $noteDescription, ')
          ..write('layerId: $layerId, ')
          ..write('previousLayerId: $previousLayerId, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('dateChanged: $dateChanged')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  final GeneratedDatabase _db;
  final String _alias;
  $NotesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _noteDescriptionMeta =
      const VerificationMeta('noteDescription');
  GeneratedTextColumn _noteDescription;
  @override
  GeneratedTextColumn get noteDescription =>
      _noteDescription ??= _constructNoteDescription();
  GeneratedTextColumn _constructNoteDescription() {
    return GeneratedTextColumn(
      'note_description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _layerIdMeta = const VerificationMeta('layerId');
  GeneratedIntColumn _layerId;
  @override
  GeneratedIntColumn get layerId => _layerId ??= _constructLayerId();
  GeneratedIntColumn _constructLayerId() {
    return GeneratedIntColumn(
      'layer_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _previousLayerIdMeta =
      const VerificationMeta('previousLayerId');
  GeneratedIntColumn _previousLayerId;
  @override
  GeneratedIntColumn get previousLayerId =>
      _previousLayerId ??= _constructPreviousLayerId();
  GeneratedIntColumn _constructPreviousLayerId() {
    return GeneratedIntColumn(
      'previous_layer_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateAddedMeta = const VerificationMeta('dateAdded');
  GeneratedDateTimeColumn _dateAdded;
  @override
  GeneratedDateTimeColumn get dateAdded => _dateAdded ??= _constructDateAdded();
  GeneratedDateTimeColumn _constructDateAdded() {
    return GeneratedDateTimeColumn(
      'date_added',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateChangedMeta =
      const VerificationMeta('dateChanged');
  GeneratedDateTimeColumn _dateChanged;
  @override
  GeneratedDateTimeColumn get dateChanged =>
      _dateChanged ??= _constructDateChanged();
  GeneratedDateTimeColumn _constructDateChanged() {
    return GeneratedDateTimeColumn(
      'date_changed',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, noteDescription, layerId, previousLayerId, dateAdded, dateChanged];
  @override
  $NotesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'notes';
  @override
  final String actualTableName = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('note_description')) {
      context.handle(
          _noteDescriptionMeta,
          noteDescription.isAcceptableOrUnknown(
              data['note_description'], _noteDescriptionMeta));
    }
    if (data.containsKey('layer_id')) {
      context.handle(_layerIdMeta,
          layerId.isAcceptableOrUnknown(data['layer_id'], _layerIdMeta));
    }
    if (data.containsKey('previous_layer_id')) {
      context.handle(
          _previousLayerIdMeta,
          previousLayerId.isAcceptableOrUnknown(
              data['previous_layer_id'], _previousLayerIdMeta));
    }
    if (data.containsKey('date_added')) {
      context.handle(_dateAddedMeta,
          dateAdded.isAcceptableOrUnknown(data['date_added'], _dateAddedMeta));
    }
    if (data.containsKey('date_changed')) {
      context.handle(
          _dateChangedMeta,
          dateChanged.isAcceptableOrUnknown(
              data['date_changed'], _dateChangedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Note.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(_db, alias);
  }
}

class FutureTask extends DataClass implements Insertable<FutureTask> {
  final int id;
  final DateTime dateChanged;
  final DateTime dateAdded;
  final int layerId;
  final int previousLayerId;
  final String description;
  final bool taskIsImportant;
  final int taskType;
  final bool isCompleted;
  final DateTime dateCompleted;
  FutureTask(
      {@required this.id,
      this.dateChanged,
      this.dateAdded,
      this.layerId,
      this.previousLayerId,
      this.description,
      @required this.taskIsImportant,
      this.taskType,
      @required this.isCompleted,
      this.dateCompleted});
  factory FutureTask.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return FutureTask(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      dateChanged: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_changed']),
      dateAdded: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_added']),
      layerId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}layer_id']),
      previousLayerId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}previous_layer_id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      taskIsImportant: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_is_important']),
      taskType:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}task_type']),
      isCompleted: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_completed']),
      dateCompleted: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_completed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || dateChanged != null) {
      map['date_changed'] = Variable<DateTime>(dateChanged);
    }
    if (!nullToAbsent || dateAdded != null) {
      map['date_added'] = Variable<DateTime>(dateAdded);
    }
    if (!nullToAbsent || layerId != null) {
      map['layer_id'] = Variable<int>(layerId);
    }
    if (!nullToAbsent || previousLayerId != null) {
      map['previous_layer_id'] = Variable<int>(previousLayerId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || taskIsImportant != null) {
      map['task_is_important'] = Variable<bool>(taskIsImportant);
    }
    if (!nullToAbsent || taskType != null) {
      map['task_type'] = Variable<int>(taskType);
    }
    if (!nullToAbsent || isCompleted != null) {
      map['is_completed'] = Variable<bool>(isCompleted);
    }
    if (!nullToAbsent || dateCompleted != null) {
      map['date_completed'] = Variable<DateTime>(dateCompleted);
    }
    return map;
  }

  FutureTasksCompanion toCompanion(bool nullToAbsent) {
    return FutureTasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      dateChanged: dateChanged == null && nullToAbsent
          ? const Value.absent()
          : Value(dateChanged),
      dateAdded: dateAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(dateAdded),
      layerId: layerId == null && nullToAbsent
          ? const Value.absent()
          : Value(layerId),
      previousLayerId: previousLayerId == null && nullToAbsent
          ? const Value.absent()
          : Value(previousLayerId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      taskIsImportant: taskIsImportant == null && nullToAbsent
          ? const Value.absent()
          : Value(taskIsImportant),
      taskType: taskType == null && nullToAbsent
          ? const Value.absent()
          : Value(taskType),
      isCompleted: isCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isCompleted),
      dateCompleted: dateCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(dateCompleted),
    );
  }

  factory FutureTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FutureTask(
      id: serializer.fromJson<int>(json['id']),
      dateChanged: serializer.fromJson<DateTime>(json['dateChanged']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      layerId: serializer.fromJson<int>(json['layerId']),
      previousLayerId: serializer.fromJson<int>(json['previousLayerId']),
      description: serializer.fromJson<String>(json['description']),
      taskIsImportant: serializer.fromJson<bool>(json['taskIsImportant']),
      taskType: serializer.fromJson<int>(json['taskType']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      dateCompleted: serializer.fromJson<DateTime>(json['dateCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateChanged': serializer.toJson<DateTime>(dateChanged),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'layerId': serializer.toJson<int>(layerId),
      'previousLayerId': serializer.toJson<int>(previousLayerId),
      'description': serializer.toJson<String>(description),
      'taskIsImportant': serializer.toJson<bool>(taskIsImportant),
      'taskType': serializer.toJson<int>(taskType),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'dateCompleted': serializer.toJson<DateTime>(dateCompleted),
    };
  }

  FutureTask copyWith(
          {int id,
          DateTime dateChanged,
          DateTime dateAdded,
          int layerId,
          int previousLayerId,
          String description,
          bool taskIsImportant,
          int taskType,
          bool isCompleted,
          DateTime dateCompleted}) =>
      FutureTask(
        id: id ?? this.id,
        dateChanged: dateChanged ?? this.dateChanged,
        dateAdded: dateAdded ?? this.dateAdded,
        layerId: layerId ?? this.layerId,
        previousLayerId: previousLayerId ?? this.previousLayerId,
        description: description ?? this.description,
        taskIsImportant: taskIsImportant ?? this.taskIsImportant,
        taskType: taskType ?? this.taskType,
        isCompleted: isCompleted ?? this.isCompleted,
        dateCompleted: dateCompleted ?? this.dateCompleted,
      );
  @override
  String toString() {
    return (StringBuffer('FutureTask(')
          ..write('id: $id, ')
          ..write('dateChanged: $dateChanged, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('layerId: $layerId, ')
          ..write('previousLayerId: $previousLayerId, ')
          ..write('description: $description, ')
          ..write('taskIsImportant: $taskIsImportant, ')
          ..write('taskType: $taskType, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dateCompleted: $dateCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          dateChanged.hashCode,
          $mrjc(
              dateAdded.hashCode,
              $mrjc(
                  layerId.hashCode,
                  $mrjc(
                      previousLayerId.hashCode,
                      $mrjc(
                          description.hashCode,
                          $mrjc(
                              taskIsImportant.hashCode,
                              $mrjc(
                                  taskType.hashCode,
                                  $mrjc(isCompleted.hashCode,
                                      dateCompleted.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FutureTask &&
          other.id == this.id &&
          other.dateChanged == this.dateChanged &&
          other.dateAdded == this.dateAdded &&
          other.layerId == this.layerId &&
          other.previousLayerId == this.previousLayerId &&
          other.description == this.description &&
          other.taskIsImportant == this.taskIsImportant &&
          other.taskType == this.taskType &&
          other.isCompleted == this.isCompleted &&
          other.dateCompleted == this.dateCompleted);
}

class FutureTasksCompanion extends UpdateCompanion<FutureTask> {
  final Value<int> id;
  final Value<DateTime> dateChanged;
  final Value<DateTime> dateAdded;
  final Value<int> layerId;
  final Value<int> previousLayerId;
  final Value<String> description;
  final Value<bool> taskIsImportant;
  final Value<int> taskType;
  final Value<bool> isCompleted;
  final Value<DateTime> dateCompleted;
  const FutureTasksCompanion({
    this.id = const Value.absent(),
    this.dateChanged = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.layerId = const Value.absent(),
    this.previousLayerId = const Value.absent(),
    this.description = const Value.absent(),
    this.taskIsImportant = const Value.absent(),
    this.taskType = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dateCompleted = const Value.absent(),
  });
  FutureTasksCompanion.insert({
    this.id = const Value.absent(),
    this.dateChanged = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.layerId = const Value.absent(),
    this.previousLayerId = const Value.absent(),
    this.description = const Value.absent(),
    this.taskIsImportant = const Value.absent(),
    this.taskType = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dateCompleted = const Value.absent(),
  });
  static Insertable<FutureTask> custom({
    Expression<int> id,
    Expression<DateTime> dateChanged,
    Expression<DateTime> dateAdded,
    Expression<int> layerId,
    Expression<int> previousLayerId,
    Expression<String> description,
    Expression<bool> taskIsImportant,
    Expression<int> taskType,
    Expression<bool> isCompleted,
    Expression<DateTime> dateCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateChanged != null) 'date_changed': dateChanged,
      if (dateAdded != null) 'date_added': dateAdded,
      if (layerId != null) 'layer_id': layerId,
      if (previousLayerId != null) 'previous_layer_id': previousLayerId,
      if (description != null) 'description': description,
      if (taskIsImportant != null) 'task_is_important': taskIsImportant,
      if (taskType != null) 'task_type': taskType,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (dateCompleted != null) 'date_completed': dateCompleted,
    });
  }

  FutureTasksCompanion copyWith(
      {Value<int> id,
      Value<DateTime> dateChanged,
      Value<DateTime> dateAdded,
      Value<int> layerId,
      Value<int> previousLayerId,
      Value<String> description,
      Value<bool> taskIsImportant,
      Value<int> taskType,
      Value<bool> isCompleted,
      Value<DateTime> dateCompleted}) {
    return FutureTasksCompanion(
      id: id ?? this.id,
      dateChanged: dateChanged ?? this.dateChanged,
      dateAdded: dateAdded ?? this.dateAdded,
      layerId: layerId ?? this.layerId,
      previousLayerId: previousLayerId ?? this.previousLayerId,
      description: description ?? this.description,
      taskIsImportant: taskIsImportant ?? this.taskIsImportant,
      taskType: taskType ?? this.taskType,
      isCompleted: isCompleted ?? this.isCompleted,
      dateCompleted: dateCompleted ?? this.dateCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateChanged.present) {
      map['date_changed'] = Variable<DateTime>(dateChanged.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (layerId.present) {
      map['layer_id'] = Variable<int>(layerId.value);
    }
    if (previousLayerId.present) {
      map['previous_layer_id'] = Variable<int>(previousLayerId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (taskIsImportant.present) {
      map['task_is_important'] = Variable<bool>(taskIsImportant.value);
    }
    if (taskType.present) {
      map['task_type'] = Variable<int>(taskType.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (dateCompleted.present) {
      map['date_completed'] = Variable<DateTime>(dateCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FutureTasksCompanion(')
          ..write('id: $id, ')
          ..write('dateChanged: $dateChanged, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('layerId: $layerId, ')
          ..write('previousLayerId: $previousLayerId, ')
          ..write('description: $description, ')
          ..write('taskIsImportant: $taskIsImportant, ')
          ..write('taskType: $taskType, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dateCompleted: $dateCompleted')
          ..write(')'))
        .toString();
  }
}

class $FutureTasksTable extends FutureTasks
    with TableInfo<$FutureTasksTable, FutureTask> {
  final GeneratedDatabase _db;
  final String _alias;
  $FutureTasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateChangedMeta =
      const VerificationMeta('dateChanged');
  GeneratedDateTimeColumn _dateChanged;
  @override
  GeneratedDateTimeColumn get dateChanged =>
      _dateChanged ??= _constructDateChanged();
  GeneratedDateTimeColumn _constructDateChanged() {
    return GeneratedDateTimeColumn(
      'date_changed',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateAddedMeta = const VerificationMeta('dateAdded');
  GeneratedDateTimeColumn _dateAdded;
  @override
  GeneratedDateTimeColumn get dateAdded => _dateAdded ??= _constructDateAdded();
  GeneratedDateTimeColumn _constructDateAdded() {
    return GeneratedDateTimeColumn(
      'date_added',
      $tableName,
      true,
    );
  }

  final VerificationMeta _layerIdMeta = const VerificationMeta('layerId');
  GeneratedIntColumn _layerId;
  @override
  GeneratedIntColumn get layerId => _layerId ??= _constructLayerId();
  GeneratedIntColumn _constructLayerId() {
    return GeneratedIntColumn(
      'layer_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _previousLayerIdMeta =
      const VerificationMeta('previousLayerId');
  GeneratedIntColumn _previousLayerId;
  @override
  GeneratedIntColumn get previousLayerId =>
      _previousLayerId ??= _constructPreviousLayerId();
  GeneratedIntColumn _constructPreviousLayerId() {
    return GeneratedIntColumn(
      'previous_layer_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _taskIsImportantMeta =
      const VerificationMeta('taskIsImportant');
  GeneratedBoolColumn _taskIsImportant;
  @override
  GeneratedBoolColumn get taskIsImportant =>
      _taskIsImportant ??= _constructTaskIsImportant();
  GeneratedBoolColumn _constructTaskIsImportant() {
    return GeneratedBoolColumn('task_is_important', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _taskTypeMeta = const VerificationMeta('taskType');
  GeneratedIntColumn _taskType;
  @override
  GeneratedIntColumn get taskType => _taskType ??= _constructTaskType();
  GeneratedIntColumn _constructTaskType() {
    return GeneratedIntColumn(
      'task_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  GeneratedBoolColumn _isCompleted;
  @override
  GeneratedBoolColumn get isCompleted =>
      _isCompleted ??= _constructIsCompleted();
  GeneratedBoolColumn _constructIsCompleted() {
    return GeneratedBoolColumn('is_completed', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _dateCompletedMeta =
      const VerificationMeta('dateCompleted');
  GeneratedDateTimeColumn _dateCompleted;
  @override
  GeneratedDateTimeColumn get dateCompleted =>
      _dateCompleted ??= _constructDateCompleted();
  GeneratedDateTimeColumn _constructDateCompleted() {
    return GeneratedDateTimeColumn(
      'date_completed',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        dateChanged,
        dateAdded,
        layerId,
        previousLayerId,
        description,
        taskIsImportant,
        taskType,
        isCompleted,
        dateCompleted
      ];
  @override
  $FutureTasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'future_tasks';
  @override
  final String actualTableName = 'future_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<FutureTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date_changed')) {
      context.handle(
          _dateChangedMeta,
          dateChanged.isAcceptableOrUnknown(
              data['date_changed'], _dateChangedMeta));
    }
    if (data.containsKey('date_added')) {
      context.handle(_dateAddedMeta,
          dateAdded.isAcceptableOrUnknown(data['date_added'], _dateAddedMeta));
    }
    if (data.containsKey('layer_id')) {
      context.handle(_layerIdMeta,
          layerId.isAcceptableOrUnknown(data['layer_id'], _layerIdMeta));
    }
    if (data.containsKey('previous_layer_id')) {
      context.handle(
          _previousLayerIdMeta,
          previousLayerId.isAcceptableOrUnknown(
              data['previous_layer_id'], _previousLayerIdMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('task_is_important')) {
      context.handle(
          _taskIsImportantMeta,
          taskIsImportant.isAcceptableOrUnknown(
              data['task_is_important'], _taskIsImportantMeta));
    }
    if (data.containsKey('task_type')) {
      context.handle(_taskTypeMeta,
          taskType.isAcceptableOrUnknown(data['task_type'], _taskTypeMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed'], _isCompletedMeta));
    }
    if (data.containsKey('date_completed')) {
      context.handle(
          _dateCompletedMeta,
          dateCompleted.isAcceptableOrUnknown(
              data['date_completed'], _dateCompletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FutureTask map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FutureTask.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FutureTasksTable createAlias(String alias) {
    return $FutureTasksTable(_db, alias);
  }
}

class MonthlyTask extends DataClass implements Insertable<MonthlyTask> {
  final int id;
  final DateTime dateChanged;
  final DateTime dateAdded;
  final int layerId;
  final int previousLayerId;
  final String description;
  final bool taskIsImportant;
  final int taskType;
  final bool isCompleted;
  final DateTime dateCompleted;
  MonthlyTask(
      {@required this.id,
      this.dateChanged,
      this.dateAdded,
      this.layerId,
      this.previousLayerId,
      this.description,
      @required this.taskIsImportant,
      this.taskType,
      @required this.isCompleted,
      this.dateCompleted});
  factory MonthlyTask.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return MonthlyTask(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      dateChanged: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_changed']),
      dateAdded: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_added']),
      layerId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}layer_id']),
      previousLayerId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}previous_layer_id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      taskIsImportant: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_is_important']),
      taskType:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}task_type']),
      isCompleted: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_completed']),
      dateCompleted: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_completed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || dateChanged != null) {
      map['date_changed'] = Variable<DateTime>(dateChanged);
    }
    if (!nullToAbsent || dateAdded != null) {
      map['date_added'] = Variable<DateTime>(dateAdded);
    }
    if (!nullToAbsent || layerId != null) {
      map['layer_id'] = Variable<int>(layerId);
    }
    if (!nullToAbsent || previousLayerId != null) {
      map['previous_layer_id'] = Variable<int>(previousLayerId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || taskIsImportant != null) {
      map['task_is_important'] = Variable<bool>(taskIsImportant);
    }
    if (!nullToAbsent || taskType != null) {
      map['task_type'] = Variable<int>(taskType);
    }
    if (!nullToAbsent || isCompleted != null) {
      map['is_completed'] = Variable<bool>(isCompleted);
    }
    if (!nullToAbsent || dateCompleted != null) {
      map['date_completed'] = Variable<DateTime>(dateCompleted);
    }
    return map;
  }

  MonthlyTasksCompanion toCompanion(bool nullToAbsent) {
    return MonthlyTasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      dateChanged: dateChanged == null && nullToAbsent
          ? const Value.absent()
          : Value(dateChanged),
      dateAdded: dateAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(dateAdded),
      layerId: layerId == null && nullToAbsent
          ? const Value.absent()
          : Value(layerId),
      previousLayerId: previousLayerId == null && nullToAbsent
          ? const Value.absent()
          : Value(previousLayerId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      taskIsImportant: taskIsImportant == null && nullToAbsent
          ? const Value.absent()
          : Value(taskIsImportant),
      taskType: taskType == null && nullToAbsent
          ? const Value.absent()
          : Value(taskType),
      isCompleted: isCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isCompleted),
      dateCompleted: dateCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(dateCompleted),
    );
  }

  factory MonthlyTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MonthlyTask(
      id: serializer.fromJson<int>(json['id']),
      dateChanged: serializer.fromJson<DateTime>(json['dateChanged']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      layerId: serializer.fromJson<int>(json['layerId']),
      previousLayerId: serializer.fromJson<int>(json['previousLayerId']),
      description: serializer.fromJson<String>(json['description']),
      taskIsImportant: serializer.fromJson<bool>(json['taskIsImportant']),
      taskType: serializer.fromJson<int>(json['taskType']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      dateCompleted: serializer.fromJson<DateTime>(json['dateCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateChanged': serializer.toJson<DateTime>(dateChanged),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'layerId': serializer.toJson<int>(layerId),
      'previousLayerId': serializer.toJson<int>(previousLayerId),
      'description': serializer.toJson<String>(description),
      'taskIsImportant': serializer.toJson<bool>(taskIsImportant),
      'taskType': serializer.toJson<int>(taskType),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'dateCompleted': serializer.toJson<DateTime>(dateCompleted),
    };
  }

  MonthlyTask copyWith(
          {int id,
          DateTime dateChanged,
          DateTime dateAdded,
          int layerId,
          int previousLayerId,
          String description,
          bool taskIsImportant,
          int taskType,
          bool isCompleted,
          DateTime dateCompleted}) =>
      MonthlyTask(
        id: id ?? this.id,
        dateChanged: dateChanged ?? this.dateChanged,
        dateAdded: dateAdded ?? this.dateAdded,
        layerId: layerId ?? this.layerId,
        previousLayerId: previousLayerId ?? this.previousLayerId,
        description: description ?? this.description,
        taskIsImportant: taskIsImportant ?? this.taskIsImportant,
        taskType: taskType ?? this.taskType,
        isCompleted: isCompleted ?? this.isCompleted,
        dateCompleted: dateCompleted ?? this.dateCompleted,
      );
  @override
  String toString() {
    return (StringBuffer('MonthlyTask(')
          ..write('id: $id, ')
          ..write('dateChanged: $dateChanged, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('layerId: $layerId, ')
          ..write('previousLayerId: $previousLayerId, ')
          ..write('description: $description, ')
          ..write('taskIsImportant: $taskIsImportant, ')
          ..write('taskType: $taskType, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dateCompleted: $dateCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          dateChanged.hashCode,
          $mrjc(
              dateAdded.hashCode,
              $mrjc(
                  layerId.hashCode,
                  $mrjc(
                      previousLayerId.hashCode,
                      $mrjc(
                          description.hashCode,
                          $mrjc(
                              taskIsImportant.hashCode,
                              $mrjc(
                                  taskType.hashCode,
                                  $mrjc(isCompleted.hashCode,
                                      dateCompleted.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MonthlyTask &&
          other.id == this.id &&
          other.dateChanged == this.dateChanged &&
          other.dateAdded == this.dateAdded &&
          other.layerId == this.layerId &&
          other.previousLayerId == this.previousLayerId &&
          other.description == this.description &&
          other.taskIsImportant == this.taskIsImportant &&
          other.taskType == this.taskType &&
          other.isCompleted == this.isCompleted &&
          other.dateCompleted == this.dateCompleted);
}

class MonthlyTasksCompanion extends UpdateCompanion<MonthlyTask> {
  final Value<int> id;
  final Value<DateTime> dateChanged;
  final Value<DateTime> dateAdded;
  final Value<int> layerId;
  final Value<int> previousLayerId;
  final Value<String> description;
  final Value<bool> taskIsImportant;
  final Value<int> taskType;
  final Value<bool> isCompleted;
  final Value<DateTime> dateCompleted;
  const MonthlyTasksCompanion({
    this.id = const Value.absent(),
    this.dateChanged = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.layerId = const Value.absent(),
    this.previousLayerId = const Value.absent(),
    this.description = const Value.absent(),
    this.taskIsImportant = const Value.absent(),
    this.taskType = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dateCompleted = const Value.absent(),
  });
  MonthlyTasksCompanion.insert({
    this.id = const Value.absent(),
    this.dateChanged = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.layerId = const Value.absent(),
    this.previousLayerId = const Value.absent(),
    this.description = const Value.absent(),
    this.taskIsImportant = const Value.absent(),
    this.taskType = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dateCompleted = const Value.absent(),
  });
  static Insertable<MonthlyTask> custom({
    Expression<int> id,
    Expression<DateTime> dateChanged,
    Expression<DateTime> dateAdded,
    Expression<int> layerId,
    Expression<int> previousLayerId,
    Expression<String> description,
    Expression<bool> taskIsImportant,
    Expression<int> taskType,
    Expression<bool> isCompleted,
    Expression<DateTime> dateCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateChanged != null) 'date_changed': dateChanged,
      if (dateAdded != null) 'date_added': dateAdded,
      if (layerId != null) 'layer_id': layerId,
      if (previousLayerId != null) 'previous_layer_id': previousLayerId,
      if (description != null) 'description': description,
      if (taskIsImportant != null) 'task_is_important': taskIsImportant,
      if (taskType != null) 'task_type': taskType,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (dateCompleted != null) 'date_completed': dateCompleted,
    });
  }

  MonthlyTasksCompanion copyWith(
      {Value<int> id,
      Value<DateTime> dateChanged,
      Value<DateTime> dateAdded,
      Value<int> layerId,
      Value<int> previousLayerId,
      Value<String> description,
      Value<bool> taskIsImportant,
      Value<int> taskType,
      Value<bool> isCompleted,
      Value<DateTime> dateCompleted}) {
    return MonthlyTasksCompanion(
      id: id ?? this.id,
      dateChanged: dateChanged ?? this.dateChanged,
      dateAdded: dateAdded ?? this.dateAdded,
      layerId: layerId ?? this.layerId,
      previousLayerId: previousLayerId ?? this.previousLayerId,
      description: description ?? this.description,
      taskIsImportant: taskIsImportant ?? this.taskIsImportant,
      taskType: taskType ?? this.taskType,
      isCompleted: isCompleted ?? this.isCompleted,
      dateCompleted: dateCompleted ?? this.dateCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateChanged.present) {
      map['date_changed'] = Variable<DateTime>(dateChanged.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (layerId.present) {
      map['layer_id'] = Variable<int>(layerId.value);
    }
    if (previousLayerId.present) {
      map['previous_layer_id'] = Variable<int>(previousLayerId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (taskIsImportant.present) {
      map['task_is_important'] = Variable<bool>(taskIsImportant.value);
    }
    if (taskType.present) {
      map['task_type'] = Variable<int>(taskType.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (dateCompleted.present) {
      map['date_completed'] = Variable<DateTime>(dateCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MonthlyTasksCompanion(')
          ..write('id: $id, ')
          ..write('dateChanged: $dateChanged, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('layerId: $layerId, ')
          ..write('previousLayerId: $previousLayerId, ')
          ..write('description: $description, ')
          ..write('taskIsImportant: $taskIsImportant, ')
          ..write('taskType: $taskType, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dateCompleted: $dateCompleted')
          ..write(')'))
        .toString();
  }
}

class $MonthlyTasksTable extends MonthlyTasks
    with TableInfo<$MonthlyTasksTable, MonthlyTask> {
  final GeneratedDatabase _db;
  final String _alias;
  $MonthlyTasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateChangedMeta =
      const VerificationMeta('dateChanged');
  GeneratedDateTimeColumn _dateChanged;
  @override
  GeneratedDateTimeColumn get dateChanged =>
      _dateChanged ??= _constructDateChanged();
  GeneratedDateTimeColumn _constructDateChanged() {
    return GeneratedDateTimeColumn(
      'date_changed',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateAddedMeta = const VerificationMeta('dateAdded');
  GeneratedDateTimeColumn _dateAdded;
  @override
  GeneratedDateTimeColumn get dateAdded => _dateAdded ??= _constructDateAdded();
  GeneratedDateTimeColumn _constructDateAdded() {
    return GeneratedDateTimeColumn(
      'date_added',
      $tableName,
      true,
    );
  }

  final VerificationMeta _layerIdMeta = const VerificationMeta('layerId');
  GeneratedIntColumn _layerId;
  @override
  GeneratedIntColumn get layerId => _layerId ??= _constructLayerId();
  GeneratedIntColumn _constructLayerId() {
    return GeneratedIntColumn(
      'layer_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _previousLayerIdMeta =
      const VerificationMeta('previousLayerId');
  GeneratedIntColumn _previousLayerId;
  @override
  GeneratedIntColumn get previousLayerId =>
      _previousLayerId ??= _constructPreviousLayerId();
  GeneratedIntColumn _constructPreviousLayerId() {
    return GeneratedIntColumn(
      'previous_layer_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _taskIsImportantMeta =
      const VerificationMeta('taskIsImportant');
  GeneratedBoolColumn _taskIsImportant;
  @override
  GeneratedBoolColumn get taskIsImportant =>
      _taskIsImportant ??= _constructTaskIsImportant();
  GeneratedBoolColumn _constructTaskIsImportant() {
    return GeneratedBoolColumn('task_is_important', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _taskTypeMeta = const VerificationMeta('taskType');
  GeneratedIntColumn _taskType;
  @override
  GeneratedIntColumn get taskType => _taskType ??= _constructTaskType();
  GeneratedIntColumn _constructTaskType() {
    return GeneratedIntColumn(
      'task_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  GeneratedBoolColumn _isCompleted;
  @override
  GeneratedBoolColumn get isCompleted =>
      _isCompleted ??= _constructIsCompleted();
  GeneratedBoolColumn _constructIsCompleted() {
    return GeneratedBoolColumn('is_completed', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _dateCompletedMeta =
      const VerificationMeta('dateCompleted');
  GeneratedDateTimeColumn _dateCompleted;
  @override
  GeneratedDateTimeColumn get dateCompleted =>
      _dateCompleted ??= _constructDateCompleted();
  GeneratedDateTimeColumn _constructDateCompleted() {
    return GeneratedDateTimeColumn(
      'date_completed',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        dateChanged,
        dateAdded,
        layerId,
        previousLayerId,
        description,
        taskIsImportant,
        taskType,
        isCompleted,
        dateCompleted
      ];
  @override
  $MonthlyTasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'monthly_tasks';
  @override
  final String actualTableName = 'monthly_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<MonthlyTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date_changed')) {
      context.handle(
          _dateChangedMeta,
          dateChanged.isAcceptableOrUnknown(
              data['date_changed'], _dateChangedMeta));
    }
    if (data.containsKey('date_added')) {
      context.handle(_dateAddedMeta,
          dateAdded.isAcceptableOrUnknown(data['date_added'], _dateAddedMeta));
    }
    if (data.containsKey('layer_id')) {
      context.handle(_layerIdMeta,
          layerId.isAcceptableOrUnknown(data['layer_id'], _layerIdMeta));
    }
    if (data.containsKey('previous_layer_id')) {
      context.handle(
          _previousLayerIdMeta,
          previousLayerId.isAcceptableOrUnknown(
              data['previous_layer_id'], _previousLayerIdMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('task_is_important')) {
      context.handle(
          _taskIsImportantMeta,
          taskIsImportant.isAcceptableOrUnknown(
              data['task_is_important'], _taskIsImportantMeta));
    }
    if (data.containsKey('task_type')) {
      context.handle(_taskTypeMeta,
          taskType.isAcceptableOrUnknown(data['task_type'], _taskTypeMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed'], _isCompletedMeta));
    }
    if (data.containsKey('date_completed')) {
      context.handle(
          _dateCompletedMeta,
          dateCompleted.isAcceptableOrUnknown(
              data['date_completed'], _dateCompletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MonthlyTask map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MonthlyTask.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MonthlyTasksTable createAlias(String alias) {
    return $MonthlyTasksTable(_db, alias);
  }
}

class Habit extends DataClass implements Insertable<Habit> {
  final int id;
  final String description;
  final bool isVisible;
  Habit({@required this.id, this.description, @required this.isVisible});
  factory Habit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Habit(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      isVisible: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_visible']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || isVisible != null) {
      map['is_visible'] = Variable<bool>(isVisible);
    }
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isVisible: isVisible == null && nullToAbsent
          ? const Value.absent()
          : Value(isVisible),
    );
  }

  factory Habit.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      isVisible: serializer.fromJson<bool>(json['isVisible']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'isVisible': serializer.toJson<bool>(isVisible),
    };
  }

  Habit copyWith({int id, String description, bool isVisible}) => Habit(
        id: id ?? this.id,
        description: description ?? this.description,
        isVisible: isVisible ?? this.isVisible,
      );
  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('isVisible: $isVisible')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(description.hashCode, isVisible.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.description == this.description &&
          other.isVisible == this.isVisible);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<String> description;
  final Value<bool> isVisible;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.isVisible = const Value.absent(),
  });
  HabitsCompanion.insert({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.isVisible = const Value.absent(),
  });
  static Insertable<Habit> custom({
    Expression<int> id,
    Expression<String> description,
    Expression<bool> isVisible,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (isVisible != null) 'is_visible': isVisible,
    });
  }

  HabitsCompanion copyWith(
      {Value<int> id, Value<String> description, Value<bool> isVisible}) {
    return HabitsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      isVisible: isVisible ?? this.isVisible,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isVisible.present) {
      map['is_visible'] = Variable<bool>(isVisible.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('isVisible: $isVisible')
          ..write(')'))
        .toString();
  }
}

class $HabitsTable extends Habits with TableInfo<$HabitsTable, Habit> {
  final GeneratedDatabase _db;
  final String _alias;
  $HabitsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isVisibleMeta = const VerificationMeta('isVisible');
  GeneratedBoolColumn _isVisible;
  @override
  GeneratedBoolColumn get isVisible => _isVisible ??= _constructIsVisible();
  GeneratedBoolColumn _constructIsVisible() {
    return GeneratedBoolColumn('is_visible', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, description, isVisible];
  @override
  $HabitsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'habits';
  @override
  final String actualTableName = 'habits';
  @override
  VerificationContext validateIntegrity(Insertable<Habit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('is_visible')) {
      context.handle(_isVisibleMeta,
          isVisible.isAcceptableOrUnknown(data['is_visible'], _isVisibleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Habit.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(_db, alias);
  }
}

class Tracker extends DataClass implements Insertable<Tracker> {
  final int id;
  final int habitId;
  final DateTime habitDate;
  final bool isCompleted;
  Tracker(
      {@required this.id,
      this.habitId,
      this.habitDate,
      @required this.isCompleted});
  factory Tracker.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Tracker(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      habitId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}habit_id']),
      habitDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}habit_date']),
      isCompleted: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_completed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || habitId != null) {
      map['habit_id'] = Variable<int>(habitId);
    }
    if (!nullToAbsent || habitDate != null) {
      map['habit_date'] = Variable<DateTime>(habitDate);
    }
    if (!nullToAbsent || isCompleted != null) {
      map['is_completed'] = Variable<bool>(isCompleted);
    }
    return map;
  }

  TrackersCompanion toCompanion(bool nullToAbsent) {
    return TrackersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      habitId: habitId == null && nullToAbsent
          ? const Value.absent()
          : Value(habitId),
      habitDate: habitDate == null && nullToAbsent
          ? const Value.absent()
          : Value(habitDate),
      isCompleted: isCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isCompleted),
    );
  }

  factory Tracker.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Tracker(
      id: serializer.fromJson<int>(json['id']),
      habitId: serializer.fromJson<int>(json['habitId']),
      habitDate: serializer.fromJson<DateTime>(json['habitDate']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitId': serializer.toJson<int>(habitId),
      'habitDate': serializer.toJson<DateTime>(habitDate),
      'isCompleted': serializer.toJson<bool>(isCompleted),
    };
  }

  Tracker copyWith(
          {int id, int habitId, DateTime habitDate, bool isCompleted}) =>
      Tracker(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        habitDate: habitDate ?? this.habitDate,
        isCompleted: isCompleted ?? this.isCompleted,
      );
  @override
  String toString() {
    return (StringBuffer('Tracker(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('habitDate: $habitDate, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          habitId.hashCode, $mrjc(habitDate.hashCode, isCompleted.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Tracker &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.habitDate == this.habitDate &&
          other.isCompleted == this.isCompleted);
}

class TrackersCompanion extends UpdateCompanion<Tracker> {
  final Value<int> id;
  final Value<int> habitId;
  final Value<DateTime> habitDate;
  final Value<bool> isCompleted;
  const TrackersCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.habitDate = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  TrackersCompanion.insert({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.habitDate = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  static Insertable<Tracker> custom({
    Expression<int> id,
    Expression<int> habitId,
    Expression<DateTime> habitDate,
    Expression<bool> isCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (habitDate != null) 'habit_date': habitDate,
      if (isCompleted != null) 'is_completed': isCompleted,
    });
  }

  TrackersCompanion copyWith(
      {Value<int> id,
      Value<int> habitId,
      Value<DateTime> habitDate,
      Value<bool> isCompleted}) {
    return TrackersCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      habitDate: habitDate ?? this.habitDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<int>(habitId.value);
    }
    if (habitDate.present) {
      map['habit_date'] = Variable<DateTime>(habitDate.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackersCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('habitDate: $habitDate, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }
}

class $TrackersTable extends Trackers with TableInfo<$TrackersTable, Tracker> {
  final GeneratedDatabase _db;
  final String _alias;
  $TrackersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _habitIdMeta = const VerificationMeta('habitId');
  GeneratedIntColumn _habitId;
  @override
  GeneratedIntColumn get habitId => _habitId ??= _constructHabitId();
  GeneratedIntColumn _constructHabitId() {
    return GeneratedIntColumn(
      'habit_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _habitDateMeta = const VerificationMeta('habitDate');
  GeneratedDateTimeColumn _habitDate;
  @override
  GeneratedDateTimeColumn get habitDate => _habitDate ??= _constructHabitDate();
  GeneratedDateTimeColumn _constructHabitDate() {
    return GeneratedDateTimeColumn(
      'habit_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  GeneratedBoolColumn _isCompleted;
  @override
  GeneratedBoolColumn get isCompleted =>
      _isCompleted ??= _constructIsCompleted();
  GeneratedBoolColumn _constructIsCompleted() {
    return GeneratedBoolColumn('is_completed', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, habitId, habitDate, isCompleted];
  @override
  $TrackersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'trackers';
  @override
  final String actualTableName = 'trackers';
  @override
  VerificationContext validateIntegrity(Insertable<Tracker> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('habit_id')) {
      context.handle(_habitIdMeta,
          habitId.isAcceptableOrUnknown(data['habit_id'], _habitIdMeta));
    }
    if (data.containsKey('habit_date')) {
      context.handle(_habitDateMeta,
          habitDate.isAcceptableOrUnknown(data['habit_date'], _habitDateMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed'], _isCompletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tracker map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Tracker.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TrackersTable createAlias(String alias) {
    return $TrackersTable(_db, alias);
  }
}

class CurrentTask extends DataClass implements Insertable<CurrentTask> {
  final int id;
  final DateTime dateAdded;
  final DateTime dateChanged;
  final int layerId;
  final int previousLayerId;
  final String description;
  final bool taskIsImportant;
  final int taskType;
  final bool isCompleted;
  final DateTime dateCompleted;
  CurrentTask(
      {@required this.id,
      this.dateAdded,
      this.dateChanged,
      this.layerId,
      this.previousLayerId,
      this.description,
      @required this.taskIsImportant,
      this.taskType,
      @required this.isCompleted,
      this.dateCompleted});
  factory CurrentTask.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return CurrentTask(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      dateAdded: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_added']),
      dateChanged: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_changed']),
      layerId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}layer_id']),
      previousLayerId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}previous_layer_id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      taskIsImportant: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}task_is_important']),
      taskType:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}task_type']),
      isCompleted: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_completed']),
      dateCompleted: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_completed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || dateAdded != null) {
      map['date_added'] = Variable<DateTime>(dateAdded);
    }
    if (!nullToAbsent || dateChanged != null) {
      map['date_changed'] = Variable<DateTime>(dateChanged);
    }
    if (!nullToAbsent || layerId != null) {
      map['layer_id'] = Variable<int>(layerId);
    }
    if (!nullToAbsent || previousLayerId != null) {
      map['previous_layer_id'] = Variable<int>(previousLayerId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || taskIsImportant != null) {
      map['task_is_important'] = Variable<bool>(taskIsImportant);
    }
    if (!nullToAbsent || taskType != null) {
      map['task_type'] = Variable<int>(taskType);
    }
    if (!nullToAbsent || isCompleted != null) {
      map['is_completed'] = Variable<bool>(isCompleted);
    }
    if (!nullToAbsent || dateCompleted != null) {
      map['date_completed'] = Variable<DateTime>(dateCompleted);
    }
    return map;
  }

  CurrentTasksCompanion toCompanion(bool nullToAbsent) {
    return CurrentTasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      dateAdded: dateAdded == null && nullToAbsent
          ? const Value.absent()
          : Value(dateAdded),
      dateChanged: dateChanged == null && nullToAbsent
          ? const Value.absent()
          : Value(dateChanged),
      layerId: layerId == null && nullToAbsent
          ? const Value.absent()
          : Value(layerId),
      previousLayerId: previousLayerId == null && nullToAbsent
          ? const Value.absent()
          : Value(previousLayerId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      taskIsImportant: taskIsImportant == null && nullToAbsent
          ? const Value.absent()
          : Value(taskIsImportant),
      taskType: taskType == null && nullToAbsent
          ? const Value.absent()
          : Value(taskType),
      isCompleted: isCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isCompleted),
      dateCompleted: dateCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(dateCompleted),
    );
  }

  factory CurrentTask.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CurrentTask(
      id: serializer.fromJson<int>(json['id']),
      dateAdded: serializer.fromJson<DateTime>(json['dateAdded']),
      dateChanged: serializer.fromJson<DateTime>(json['dateChanged']),
      layerId: serializer.fromJson<int>(json['layerId']),
      previousLayerId: serializer.fromJson<int>(json['previousLayerId']),
      description: serializer.fromJson<String>(json['description']),
      taskIsImportant: serializer.fromJson<bool>(json['taskIsImportant']),
      taskType: serializer.fromJson<int>(json['taskType']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      dateCompleted: serializer.fromJson<DateTime>(json['dateCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateAdded': serializer.toJson<DateTime>(dateAdded),
      'dateChanged': serializer.toJson<DateTime>(dateChanged),
      'layerId': serializer.toJson<int>(layerId),
      'previousLayerId': serializer.toJson<int>(previousLayerId),
      'description': serializer.toJson<String>(description),
      'taskIsImportant': serializer.toJson<bool>(taskIsImportant),
      'taskType': serializer.toJson<int>(taskType),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'dateCompleted': serializer.toJson<DateTime>(dateCompleted),
    };
  }

  CurrentTask copyWith(
          {int id,
          DateTime dateAdded,
          DateTime dateChanged,
          int layerId,
          int previousLayerId,
          String description,
          bool taskIsImportant,
          int taskType,
          bool isCompleted,
          DateTime dateCompleted}) =>
      CurrentTask(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        dateChanged: dateChanged ?? this.dateChanged,
        layerId: layerId ?? this.layerId,
        previousLayerId: previousLayerId ?? this.previousLayerId,
        description: description ?? this.description,
        taskIsImportant: taskIsImportant ?? this.taskIsImportant,
        taskType: taskType ?? this.taskType,
        isCompleted: isCompleted ?? this.isCompleted,
        dateCompleted: dateCompleted ?? this.dateCompleted,
      );
  @override
  String toString() {
    return (StringBuffer('CurrentTask(')
          ..write('id: $id, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('dateChanged: $dateChanged, ')
          ..write('layerId: $layerId, ')
          ..write('previousLayerId: $previousLayerId, ')
          ..write('description: $description, ')
          ..write('taskIsImportant: $taskIsImportant, ')
          ..write('taskType: $taskType, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dateCompleted: $dateCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          dateAdded.hashCode,
          $mrjc(
              dateChanged.hashCode,
              $mrjc(
                  layerId.hashCode,
                  $mrjc(
                      previousLayerId.hashCode,
                      $mrjc(
                          description.hashCode,
                          $mrjc(
                              taskIsImportant.hashCode,
                              $mrjc(
                                  taskType.hashCode,
                                  $mrjc(isCompleted.hashCode,
                                      dateCompleted.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CurrentTask &&
          other.id == this.id &&
          other.dateAdded == this.dateAdded &&
          other.dateChanged == this.dateChanged &&
          other.layerId == this.layerId &&
          other.previousLayerId == this.previousLayerId &&
          other.description == this.description &&
          other.taskIsImportant == this.taskIsImportant &&
          other.taskType == this.taskType &&
          other.isCompleted == this.isCompleted &&
          other.dateCompleted == this.dateCompleted);
}

class CurrentTasksCompanion extends UpdateCompanion<CurrentTask> {
  final Value<int> id;
  final Value<DateTime> dateAdded;
  final Value<DateTime> dateChanged;
  final Value<int> layerId;
  final Value<int> previousLayerId;
  final Value<String> description;
  final Value<bool> taskIsImportant;
  final Value<int> taskType;
  final Value<bool> isCompleted;
  final Value<DateTime> dateCompleted;
  const CurrentTasksCompanion({
    this.id = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.dateChanged = const Value.absent(),
    this.layerId = const Value.absent(),
    this.previousLayerId = const Value.absent(),
    this.description = const Value.absent(),
    this.taskIsImportant = const Value.absent(),
    this.taskType = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dateCompleted = const Value.absent(),
  });
  CurrentTasksCompanion.insert({
    this.id = const Value.absent(),
    this.dateAdded = const Value.absent(),
    this.dateChanged = const Value.absent(),
    this.layerId = const Value.absent(),
    this.previousLayerId = const Value.absent(),
    this.description = const Value.absent(),
    this.taskIsImportant = const Value.absent(),
    this.taskType = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dateCompleted = const Value.absent(),
  });
  static Insertable<CurrentTask> custom({
    Expression<int> id,
    Expression<DateTime> dateAdded,
    Expression<DateTime> dateChanged,
    Expression<int> layerId,
    Expression<int> previousLayerId,
    Expression<String> description,
    Expression<bool> taskIsImportant,
    Expression<int> taskType,
    Expression<bool> isCompleted,
    Expression<DateTime> dateCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateAdded != null) 'date_added': dateAdded,
      if (dateChanged != null) 'date_changed': dateChanged,
      if (layerId != null) 'layer_id': layerId,
      if (previousLayerId != null) 'previous_layer_id': previousLayerId,
      if (description != null) 'description': description,
      if (taskIsImportant != null) 'task_is_important': taskIsImportant,
      if (taskType != null) 'task_type': taskType,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (dateCompleted != null) 'date_completed': dateCompleted,
    });
  }

  CurrentTasksCompanion copyWith(
      {Value<int> id,
      Value<DateTime> dateAdded,
      Value<DateTime> dateChanged,
      Value<int> layerId,
      Value<int> previousLayerId,
      Value<String> description,
      Value<bool> taskIsImportant,
      Value<int> taskType,
      Value<bool> isCompleted,
      Value<DateTime> dateCompleted}) {
    return CurrentTasksCompanion(
      id: id ?? this.id,
      dateAdded: dateAdded ?? this.dateAdded,
      dateChanged: dateChanged ?? this.dateChanged,
      layerId: layerId ?? this.layerId,
      previousLayerId: previousLayerId ?? this.previousLayerId,
      description: description ?? this.description,
      taskIsImportant: taskIsImportant ?? this.taskIsImportant,
      taskType: taskType ?? this.taskType,
      isCompleted: isCompleted ?? this.isCompleted,
      dateCompleted: dateCompleted ?? this.dateCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateAdded.present) {
      map['date_added'] = Variable<DateTime>(dateAdded.value);
    }
    if (dateChanged.present) {
      map['date_changed'] = Variable<DateTime>(dateChanged.value);
    }
    if (layerId.present) {
      map['layer_id'] = Variable<int>(layerId.value);
    }
    if (previousLayerId.present) {
      map['previous_layer_id'] = Variable<int>(previousLayerId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (taskIsImportant.present) {
      map['task_is_important'] = Variable<bool>(taskIsImportant.value);
    }
    if (taskType.present) {
      map['task_type'] = Variable<int>(taskType.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (dateCompleted.present) {
      map['date_completed'] = Variable<DateTime>(dateCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrentTasksCompanion(')
          ..write('id: $id, ')
          ..write('dateAdded: $dateAdded, ')
          ..write('dateChanged: $dateChanged, ')
          ..write('layerId: $layerId, ')
          ..write('previousLayerId: $previousLayerId, ')
          ..write('description: $description, ')
          ..write('taskIsImportant: $taskIsImportant, ')
          ..write('taskType: $taskType, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dateCompleted: $dateCompleted')
          ..write(')'))
        .toString();
  }
}

class $CurrentTasksTable extends CurrentTasks
    with TableInfo<$CurrentTasksTable, CurrentTask> {
  final GeneratedDatabase _db;
  final String _alias;
  $CurrentTasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateAddedMeta = const VerificationMeta('dateAdded');
  GeneratedDateTimeColumn _dateAdded;
  @override
  GeneratedDateTimeColumn get dateAdded => _dateAdded ??= _constructDateAdded();
  GeneratedDateTimeColumn _constructDateAdded() {
    return GeneratedDateTimeColumn(
      'date_added',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dateChangedMeta =
      const VerificationMeta('dateChanged');
  GeneratedDateTimeColumn _dateChanged;
  @override
  GeneratedDateTimeColumn get dateChanged =>
      _dateChanged ??= _constructDateChanged();
  GeneratedDateTimeColumn _constructDateChanged() {
    return GeneratedDateTimeColumn(
      'date_changed',
      $tableName,
      true,
    );
  }

  final VerificationMeta _layerIdMeta = const VerificationMeta('layerId');
  GeneratedIntColumn _layerId;
  @override
  GeneratedIntColumn get layerId => _layerId ??= _constructLayerId();
  GeneratedIntColumn _constructLayerId() {
    return GeneratedIntColumn(
      'layer_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _previousLayerIdMeta =
      const VerificationMeta('previousLayerId');
  GeneratedIntColumn _previousLayerId;
  @override
  GeneratedIntColumn get previousLayerId =>
      _previousLayerId ??= _constructPreviousLayerId();
  GeneratedIntColumn _constructPreviousLayerId() {
    return GeneratedIntColumn(
      'previous_layer_id',
      $tableName,
      true,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
    );
  }

  final VerificationMeta _taskIsImportantMeta =
      const VerificationMeta('taskIsImportant');
  GeneratedBoolColumn _taskIsImportant;
  @override
  GeneratedBoolColumn get taskIsImportant =>
      _taskIsImportant ??= _constructTaskIsImportant();
  GeneratedBoolColumn _constructTaskIsImportant() {
    return GeneratedBoolColumn('task_is_important', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _taskTypeMeta = const VerificationMeta('taskType');
  GeneratedIntColumn _taskType;
  @override
  GeneratedIntColumn get taskType => _taskType ??= _constructTaskType();
  GeneratedIntColumn _constructTaskType() {
    return GeneratedIntColumn(
      'task_type',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  GeneratedBoolColumn _isCompleted;
  @override
  GeneratedBoolColumn get isCompleted =>
      _isCompleted ??= _constructIsCompleted();
  GeneratedBoolColumn _constructIsCompleted() {
    return GeneratedBoolColumn('is_completed', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _dateCompletedMeta =
      const VerificationMeta('dateCompleted');
  GeneratedDateTimeColumn _dateCompleted;
  @override
  GeneratedDateTimeColumn get dateCompleted =>
      _dateCompleted ??= _constructDateCompleted();
  GeneratedDateTimeColumn _constructDateCompleted() {
    return GeneratedDateTimeColumn(
      'date_completed',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        dateAdded,
        dateChanged,
        layerId,
        previousLayerId,
        description,
        taskIsImportant,
        taskType,
        isCompleted,
        dateCompleted
      ];
  @override
  $CurrentTasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'current_tasks';
  @override
  final String actualTableName = 'current_tasks';
  @override
  VerificationContext validateIntegrity(Insertable<CurrentTask> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date_added')) {
      context.handle(_dateAddedMeta,
          dateAdded.isAcceptableOrUnknown(data['date_added'], _dateAddedMeta));
    }
    if (data.containsKey('date_changed')) {
      context.handle(
          _dateChangedMeta,
          dateChanged.isAcceptableOrUnknown(
              data['date_changed'], _dateChangedMeta));
    }
    if (data.containsKey('layer_id')) {
      context.handle(_layerIdMeta,
          layerId.isAcceptableOrUnknown(data['layer_id'], _layerIdMeta));
    }
    if (data.containsKey('previous_layer_id')) {
      context.handle(
          _previousLayerIdMeta,
          previousLayerId.isAcceptableOrUnknown(
              data['previous_layer_id'], _previousLayerIdMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('task_is_important')) {
      context.handle(
          _taskIsImportantMeta,
          taskIsImportant.isAcceptableOrUnknown(
              data['task_is_important'], _taskIsImportantMeta));
    }
    if (data.containsKey('task_type')) {
      context.handle(_taskTypeMeta,
          taskType.isAcceptableOrUnknown(data['task_type'], _taskTypeMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed'], _isCompletedMeta));
    }
    if (data.containsKey('date_completed')) {
      context.handle(
          _dateCompletedMeta,
          dateCompleted.isAcceptableOrUnknown(
              data['date_completed'], _dateCompletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurrentTask map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CurrentTask.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CurrentTasksTable createAlias(String alias) {
    return $CurrentTasksTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $NotesTable _notes;
  $NotesTable get notes => _notes ??= $NotesTable(this);
  $FutureTasksTable _futureTasks;
  $FutureTasksTable get futureTasks => _futureTasks ??= $FutureTasksTable(this);
  $MonthlyTasksTable _monthlyTasks;
  $MonthlyTasksTable get monthlyTasks =>
      _monthlyTasks ??= $MonthlyTasksTable(this);
  $HabitsTable _habits;
  $HabitsTable get habits => _habits ??= $HabitsTable(this);
  $TrackersTable _trackers;
  $TrackersTable get trackers => _trackers ??= $TrackersTable(this);
  $CurrentTasksTable _currentTasks;
  $CurrentTasksTable get currentTasks =>
      _currentTasks ??= $CurrentTasksTable(this);
  NotesDao _notesDao;
  NotesDao get notesDao => _notesDao ??= NotesDao(this as AppDatabase);
  FutureTasksDao _futureTasksDao;
  FutureTasksDao get futureTasksDao =>
      _futureTasksDao ??= FutureTasksDao(this as AppDatabase);
  MonthlyTasksDao _monthlyTasksDao;
  MonthlyTasksDao get monthlyTasksDao =>
      _monthlyTasksDao ??= MonthlyTasksDao(this as AppDatabase);
  CurrentTasksDao _currentTasksDao;
  CurrentTasksDao get currentTasksDao =>
      _currentTasksDao ??= CurrentTasksDao(this as AppDatabase);
  HabitsDao _habitsDao;
  HabitsDao get habitsDao => _habitsDao ??= HabitsDao(this as AppDatabase);
  TrackersDao _trackersDao;
  TrackersDao get trackersDao =>
      _trackersDao ??= TrackersDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [notes, futureTasks, monthlyTasks, habits, trackers, currentTasks];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$NotesDaoMixin on DatabaseAccessor<AppDatabase> {
  $NotesTable get notes => attachedDatabase.notes;
}
mixin _$FutureTasksDaoMixin on DatabaseAccessor<AppDatabase> {
  $FutureTasksTable get futureTasks => attachedDatabase.futureTasks;
}
mixin _$MonthlyTasksDaoMixin on DatabaseAccessor<AppDatabase> {
  $MonthlyTasksTable get monthlyTasks => attachedDatabase.monthlyTasks;
}
mixin _$CurrentTasksDaoMixin on DatabaseAccessor<AppDatabase> {
  $CurrentTasksTable get currentTasks => attachedDatabase.currentTasks;
}
mixin _$HabitsDaoMixin on DatabaseAccessor<AppDatabase> {
  $HabitsTable get habits => attachedDatabase.habits;
}
mixin _$TrackersDaoMixin on DatabaseAccessor<AppDatabase> {
  $TrackersTable get trackers => attachedDatabase.trackers;
}
