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
    var coursesJson = json['courses'] as List;
    List<Course> coursesList = coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();

    return ClassRoom(
      division: json['division'],
      courses: coursesList,
      level: json['level'],
      name: json['name'],
      id: json['id'],
    );
  }
}
