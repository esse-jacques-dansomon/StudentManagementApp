import 'dart:convert';

class CourseDetails {
  final String professor;
  final List<Session> sessions;
  final String status;
  final String module;
  final int id;
  final String icon;

  CourseDetails({
    required this.professor,
    required this.sessions,
    required this.status,
    required this.module,
    required this.id,
    required this.icon,
  });

  factory CourseDetails.fromRawJson(String str) => CourseDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CourseDetails.fromJson(Map<String, dynamic> json) => CourseDetails(
    professor: json["professor"],
    // sessions: [],
    sessions: List<Session>.from(json["sessions"].map((x) => Session.fromJson(x))),
    status: json["status"],
    module: json["module"],
    id: json["id"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "professor": professor,
    "sessions": List<dynamic>.from(sessions.map((x) => x.toJson())),
    "status": status,
    "module": module,
    "id": id,
    "icon": icon,
  };
}

class Session {
  final int numberOfHours;
  final String status;
  final DateTime endTime;
  final int id;
  final DateTime startTime;
  final DateTime date;

  Session({
    required this.numberOfHours,
    required this.status,
    required this.endTime,
    required this.id,
    required this.startTime,
    required this.date,
  });

  factory Session.fromRawJson(String str) => Session.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    numberOfHours: json["numberOfHours"],
    status: json["status"],
    endTime: DateTime.parse(json["endTime"]),
    id: json["id"],
    startTime: DateTime.parse(json["startTime"]),
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "numberOfHours": numberOfHours,
    "status": status,
    "endTime": endTime.toIso8601String(),
    "id": id,
    "startTime": startTime.toIso8601String(),
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
  };

  String getDate() {
    return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}