import 'package:school_managment/data/models/role_model.dart';

class User {
  String email;
  List<Role> roles;
  int id;

  User({
    required this.email,
    required this.roles,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
    "id": id,
  };
}
