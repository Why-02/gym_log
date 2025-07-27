import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  String logTableName = "log";
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
    final databasePath = join(databaseDirPath, "main_db.db");
    final database = openDatabase(
      databasePath,
      onCreate: (db, version) {
        db.execute(
          '''
          CREATE TABLE $exerciseTableName (
            exercise_id INTEGER PRIMARY_KEY AUTO_INCREMENT,
            exercise_name TEXT NOT NULL,
          );
          CREATE TABLE $logTableName (
            log_id INTEGER PRIMARY_KEY AUTO_INCREMENT,
            FOREIGN KEY (exercise_id) REFERENCES exercises (exercise_id),
            log_date TEXT NOT NULL,
          );
          CREATE TABLE $setsTableName (
          set_id INTEGER AUTO_INCREMENT,
          FOREIGN KEY (log_id) REFERENCES log (log_id),
          number_of_reps INTEGER NOT NULL,
          weight INTEGER NOT NULL, 
          );

          '''
        );
      },
    );
    return database;
  }

  void addLog(String content) async {
    final db = await database;
    await db.insert("log", {

    });
  }

} 

