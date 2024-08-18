class Course {
  final String status;
  final String professor;
  final String icon;
  final String module;
  final int id;

  Course({
    required this.status,
    required this.professor,
    required this.icon,
    required this.module,
    required this.id,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      status: json['status'],
      professor: json['professor'],
      icon: json['icon'],
      module: json['module'],
      id: json['id'],
    );
  }

  toJSON() {
    return {
     'status': status,
      'professor': professor,
      'icon': icon,
     'module': module,
      'id': id,
    };
  }

}
