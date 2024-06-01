import 'dart:convert';

import 'course.model.dart'; // For jsonDecode, jsonEncode

class Session {
  String status;
  DateTime date;
  DateTime endTime;
  DateTime startTime;
  int id;
   Course course;

  Session({
    required  this.course,
    required this.status,
    required this.date,
    required this.endTime,
    required this.startTime,
    required this.id,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session.fromMap(json);

  String toJson() => json.encode(toMap());

  factory Session.fromMap(Map<String, dynamic> json) => Session(
    course: Course.fromJson(json["course"]),
    status: json["status"],
    date: DateTime.parse(json["date"]),
    endTime: DateTime.parse(json["endTime"]),
    startTime: DateTime.parse(json["startTime"]),
    id: json["id"],
  );

  Map<String, dynamic> toMap() => {
    "course": course.toJSON(),
    "status": status,
    "date": date.toIso8601String(),
    "endTime": endTime.toIso8601String(),
    "startTime": startTime.toIso8601String(),
    "id": id,
  };
}
