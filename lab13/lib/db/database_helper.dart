import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/note.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('notes_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT NOT NULL,
        created_at TEXT NOT NULL
      )
    ''');
  }

  /// Додавання нової нотатки в БД
  Future<Note> insertNote(Note note) async {
    final db = await instance.database;
    final id = await db.insert('notes', note.toMap());
    return Note(
      id: id,
      text: note.text,
      createdAt: note.createdAt,
    );
  }

  /// Отримання всіх нотаток за принципом LIFO (остання додана — перша в списку)
  Future<List<Note>> getAllNotesLifo() async {
    final db = await instance.database;
    final result = await db.query(
      'notes',
      orderBy: 'id DESC',
    );
    return result.map((json) => Note.fromMap(json)).toList();
  }
}
