import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  String logTableName = "log_table";
  String exerciseTableName = "exercises";
  String setsTableName = "sets";

  DatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final List<String> standardWorkouts = [
      "Custom",
      "Bench Press",
      "Incline Bench Press",
      "Lateral shoulders",
    ];
    final databasePath = join(databaseDirPath, "main_db.db");
    final database = openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async{
        await db.execute(
          '''
          CREATE TABLE $exerciseTableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            exercise_name TEXT
          );
          ''');
        await db.execute(
          '''CREATE TABLE $logTableName (
            log_id INTEGER PRIMARY KEY AUTOINCREMENT,
            exercise_id INTEGER,
            log_date TEXT,
            FOREIGN KEY (exercise_id) REFERENCES $exerciseTableName(id)
          );

          ''');
        await db.execute(
          '''CREATE TABLE $setsTableName (
          set_id INTEGER PRIMARY KEY AUTOINCREMENT,
          log_id INTEGER,
          number_of_reps INTEGER ,
          weight INTEGER , 
          FOREIGN KEY (log_id) REFERENCES $logTableName (log_id) ON DELETE CASCADE
          );

          ''');
        await db.execute(
          '''CREATE TABLE profile (
          picture BLOB,
          username TEXT,
          last_name TEXT,
          height INTEGER,
          weight INTEGER,
          target_weight INTEGER
          )
          '''
        );
        for (String exercise in standardWorkouts){
          List<Map<String,Object?>> records = await db.rawQuery('''
            SELECT id from $exerciseTableName where exercise_name = "$exercise";
            ''');
            if (records.isEmpty){
              await db.insert(exerciseTableName, {
                "exercise_name":exercise
              });}
        }
      
      },
    );
    return database;
  }
  void addExercise(String exercise) async {
    final db = await database;
    List<Map<String,Object?>> records = await db.rawQuery('''
    SELECT id from $exerciseTableName where exercise_name = "$exercise";
    ''');
    if (records.isEmpty){
      await db.insert(exerciseTableName, {
        "exercise_name":exercise
      });}
  }

  Future<int> _findExerciseId(String exercise) async {
    final db = await database;
    List<Map<String,Object?>> records = await db.rawQuery('''
    SELECT id FROM $exerciseTableName WHERE exercise_name = "$exercise";
    ''');
    final exerciseId = records[0]["id"] as int;
    return exerciseId;
  }

  Future<int> _findLogId(String exercise, String date) async {
    final db = await database;
    int exerciseId = await _findExerciseId(exercise);
    List<Map<String,Object?>> records = await db.rawQuery('''
    SELECT log_id FROM $logTableName WHERE exercise_id = $exerciseId AND log_date = "$date";
    ''');
    final logId= records[0]["log_id"] as int;
    return logId;
  }

  void addLog(String exercise) async {
    final db = await database;

    final exerciseId = await _findExerciseId(exercise);

    final DateTime date = DateTime.now();
    await db.insert(logTableName, {
      "exercise_id":exerciseId,
      "log_date":"${date.day}/${date.month}/${date.year}",
    });
  }

  Future<List<Map<String, Object?>>> getLogs() async {
    final db = await database;
    List<Map<String,Object?>> records = await db.query(logTableName, columns: ["*"]);
    return records;

  }

  Future<List<Map<String,Object?>>> getLogsByDate( String date) async {
    final db = await database;
    List<Map<String,Object?>> records = await db.rawQuery('''
    SELECT * FROM $logTableName WHERE log_date = "$date";
    ''');

    return records;

  }
  void addSets(int logId, List<int> reps, List<int> weights) async {
    final db = await database;
    for (int i = 0; i < reps.length; i++)
    {
      await db.insert(setsTableName,{
        "log_id":logId,
        "number_of_reps":reps[i],
        "weight":weights[i]
      });
    }    
  
  }

  void addWorkout(String exercise, List<int> reps, List<int>weights, ) async {
    addLog(exercise);
    DateTime date = DateTime.now();
    final logId = await _findLogId(exercise, "${date.day}/${date.month}/${date.year}");
    addSets(logId, reps, weights);
    debugPrint("added workout");
  }

  void deleteLog(String date, String exercise) async {
    final db = await database;
    final logId = _findLogId(exercise, date);

    db.delete(logTableName,where: "log_id = ?",whereArgs: [logId]);
  } 



} 

