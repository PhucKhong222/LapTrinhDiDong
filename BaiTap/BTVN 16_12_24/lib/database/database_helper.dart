import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/note_model.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._();

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'notes_app.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    // Tạo bảng users
    await db.execute('''
      CREATE TABLE users (
        username TEXT PRIMARY KEY,
        password TEXT NOT NULL,
        fullname TEXT NOT NULL,
        dateOfBirth TEXT NOT NULL
      )
    ''');

    // Tạo bảng notes với foreign key tham chiếu đến username
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        username TEXT NOT NULL,
        FOREIGN KEY (username) REFERENCES users (username)
      )
    ''');
  }

  // Hỗ trợ nâng cấp database
  Future<void> _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Thêm các migration nếu cần
      await db.execute('''
        ALTER TABLE notes ADD COLUMN username TEXT
      ''');
    }
  }

  // Quản lý người dùng
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap(), 
      conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<User?> authenticateUser(String username, String password) async {
    final db = await database;
    final result = await db.query(
      'users', 
      where: 'username = ? AND password = ?', 
      whereArgs: [username, password],
    );
    
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }

  Future<bool> isUsernameTaken(String username) async {
    final db = await database;
    final result = await db.query(
      'users', 
      where: 'username = ?', 
      whereArgs: [username],
    );
    
    return result.isNotEmpty;
  }

  // Thêm ghi chú với username
  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert('notes', note.toMap());
  }

  // Lấy danh sách ghi chú của một người dùng
  Future<List<Note>> getNotesByUsername(String username) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notes', 
      where: 'username = ?', 
      whereArgs: [username],
      orderBy: 'createdAt DESC',
    );
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  // Xóa ghi chú
  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
