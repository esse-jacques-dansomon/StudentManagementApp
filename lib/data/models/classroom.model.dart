import 'course.model.dart';

class ClassRoom {
  final String division;
  final List<Course> courses;
  final String level;
  final String name;
  final int id;

  ClassRoom({
    required this.division,
    required this.courses,
    required this.level,
    required this.name,
    required this.id,
  });

  factory ClassRoom.fromJson(Map<String, dynamic> json) {
    List<Course> coursesList = [];
    if (json.containsKey("courses")) {
      var coursesJson = json['courses']  as List;
      coursesList = coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
    }

    return ClassRoom(
      division: json['division'],
      courses: coursesList,
      level: json['level'],
      name: json['name'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
    "division": division,
    "level": level,
    "name": name,
    "id": id,
  };
}


