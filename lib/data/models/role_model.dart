
class Role {
  String name;
  int id;

  Role({
    required this.name,
    required this.id,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    name: json["name"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
  };
}