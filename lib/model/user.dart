class User {
  final String name;
  final String email;
  final int karma;
  final String createdAt;
  User({this.name, this.email, this.karma, this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'karma': karma,
      'createdAt': createdAt,
    };
  }
}
