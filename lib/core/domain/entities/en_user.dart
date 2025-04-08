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
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'pfp': pfp,
      'bio': bio,
      '_id': id,
    };
  }
}
