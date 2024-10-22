import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'performance_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Tabla de Supervisores
    await db.execute('''
      CREATE TABLE supervisors(
        idSupervisor INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT
      )
    ''');

    // Tabla de Productos
    await db.execute('''
      CREATE TABLE products(
        idProduct INTEGER PRIMARY KEY AUTOINCREMENT,
        nameProduct TEXT
      )
    ''');

    // Tabla de Actividades
    await db.execute('''
      CREATE TABLE activities(
        idActivity INTEGER PRIMARY KEY AUTOINCREMENT,
        nameActivity TEXT
      )
    ''');

    // Tabla de Registro de tallos y horas
    await db.execute('''
      CREATE TABLE stems_hour_registers(
        idRegister INTEGER PRIMARY KEY AUTOINCREMENT,
        idActivity INTEGER,
        idSupervisor INTEGER,
        registerDate TEXT,
        stems INTEGER,
        hours INTEGER,
        observation TEXT,
        idProduct TEXT,
        FOREIGN KEY (idActivity) REFERENCES activities(idActivity),
        FOREIGN KEY (idSupervisor) REFERENCES supervisors(idSupervisor),
        FOREIGN KEY (idProduct) REFERENCES products(idProduct)
      )
    ''');
  }
}
