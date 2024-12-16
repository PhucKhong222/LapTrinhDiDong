class Note {
  final int? id;
  final String title;
  final String content;
  final String createdAt;
  final String username; // Thêm thông tin username của người tạo note

  Note({
    this.id,
    required this.title,
    required this.content,
    String? createdAt,
    required this.username,
  }) : createdAt = createdAt ?? DateTime.now().toIso8601String();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt,
      'username': username,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: map['createdAt'],
      username: map['username'],
    );
  }
}

class User {
  final String username;
  final String password;
  final String fullname;
  final DateTime dateOfBirth;

  User({
    required this.username,
    required this.password,
    required this.fullname,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'fullname': fullname,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      password: map['password'],
      fullname: map['fullname'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }
}
