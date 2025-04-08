class User {
  final String username;
  final String email;
  final String password;
  final DateTime createAt;
  final DateTime updatedAt;
  String? pfp;
  String? bio;
  String? id;

  User(
    this.password,
    this.createAt,
    this.updatedAt, {
    required this.id,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['password'],
      DateTime.parse(json['createAt']),
      DateTime.parse(json['updatedAt']),
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'createAt': createAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'pfp': pfp,
      'bio': bio,
    };
  }
}
