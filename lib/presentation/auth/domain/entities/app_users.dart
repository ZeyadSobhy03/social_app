class AppUsers {
  final String id;
  final String name;
  final String email;


  AppUsers({required this.id, required this.name, required this.email});

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }

  factory AppUsers.fromJson(Map<String, dynamic> json) {
    return AppUsers(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
