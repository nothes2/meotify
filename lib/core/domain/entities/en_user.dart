class User {
  final String? username;
  final String? email;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? pfp;
  final String? bio;
  final String? id;

  User({
    this.username,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.pfp,
    this.bio,
    this.id,
  });

  bool checkNull() {
    return username == null &&
        email == null &&
        password == null &&
        createdAt == null &&
        updatedAt == null &&
        pfp == null &&
        bio == null &&
        id == null;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      pfp: json['pfp'] as String?,
      bio: json['bio'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'pfp': pfp,
      'bio': bio,
      '_id': id,
    };
  }
}
