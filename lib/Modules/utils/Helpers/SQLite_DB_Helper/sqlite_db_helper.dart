import 'package:database_sql_cloudfirestore/Modules/App/Sqlite_DB_Screen/Model/Student_Model/student_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLite_Helper {
  SQLite_Helper._();

  static final SQLite_Helper sqLite_Helper = SQLite_Helper._();
  static Database? database;

  String tablename = "student";
  String id = "id";
  String name = "name";
  String course = "course";
  String grid = "grid";

  initDB() async {
    String db_path = await getDatabasesPath();
    String path = join(db_path, "student.db");

    database =
        await openDatabase(path, version: 1, onCreate: (Database db, version) {
      String query =
          "CREATE TABLE IF NOT EXISTS $tablename($id INTEGER PRIMARY KEY AUTOINCREMENT,$grid TEXT NOT NULL,$name TEXT NOT NULL,$course TEXT NOT NULL);";

      return db.execute(query);
    });
  }

  Future<int?> insertStudent({required Student data}) async {
    await initDB();

    String query = "INSERT INTO $tablename($grid,$name,$course) VALUES(?,?,?);";
    List args = [data.grid, data.name, data.course];
    int? res = await database?.rawInsert(query, args);
    return res;
  }
}
