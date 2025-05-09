import 'package:competition_project/models/installment_model.dart';
import 'package:competition_project/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  final String userTable = 'users';
  final String installmentTable = 'installments';
  Database? _database;

  Future<Database> getDataBase() async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'database.db');
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        Batch batch = db.batch();
        batch.execute('''
CREATE TABLE $userTable(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  email TEXT,
  salary INT,
  bank INT
)
''');
        batch.execute('''
CREATE TABLE $installmentTable(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  amount INTEGER,
  date TEXT,
  notes TEXT
)
''');
        await batch.commit();
      },
    );
  }

  Future<void> insertUser(UserModel user) async {
    final db = await getDataBase();
    await db.insert(userTable, user.toMap());
  }

  Future<List<UserModel>> getUsers() async {
    final db = await getDataBase();
    final data = await db.query(userTable);
    return data.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<void> updateUser(UserModel user) async {
    final db = await getDataBase();
    await db.update(userTable, user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<int> deleteUser(int id) async {
    final db = await getDataBase();
    return db.delete(userTable, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> insertInstallment(InstallmentModel installment) async {
    final db = await getDataBase();
    await db.insert(installmentTable, installment.toMap());
  }

  Future<List<InstallmentModel>> getInstallments() async {
    final db = await getDataBase();
    final data = await db.query(installmentTable);
    return data.map((e) => InstallmentModel.fromMap(e)).toList();
  }

  Future<int> deleteInstallment(int id) async {
    final db = await getDataBase();
    return db.delete(installmentTable, where: 'id = ?', whereArgs: [id]);
  }
}