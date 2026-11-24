class Note {
  final int? id;
  final String text;
  final String createdAt;

  Note({
    this.id,
    required this.text,
    required this.createdAt,
  });

  /// Перетворення об'єкта Note у Map для збереження в SQLite
  Map<String, Object?> toMap() {
    final map = <String, Object?>{
      'text': text,
      'created_at': createdAt,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  /// Створення об'єкта Note із рядка таблиці SQLite
  factory Note.fromMap(Map<String, Object?> map) {
    return Note(
      id: map['id'] as int?,
      text: map['text'] as String,
      createdAt: map['created_at'] as String,
    );
  }
}
