import 'package:school_managment/data/models/student.model.dart';
import 'package:school_managment/data/models/user_model.dart';


class AuthResponse {
  final String accessToken;
  final String tokenType;
  final User? user;
  final Student? student;

  AuthResponse({
    required this.accessToken,
    required this.tokenType,
    this.user,
    this.student,
  });

  AuthResponse copyWith({
    String? accessToken,
    String? tokenType,
    User? user,
    Student? student,
  }) =>
      AuthResponse(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        user: user ?? this.user,
        student: student ?? this.student,
      );

  factory AuthResponse.fromJson(dynamic json) => AuthResponse(
      accessToken: json["accessToken"],
      tokenType: json["tokenType"],
      user: json["user"] != null ? User.fromJson(json["user"]) : null,
      student: json["student"] != null ? Student.fromJson(json["student"]) : null
  )
  ;

  factory AuthResponse.fromJson2(dynamic json) => AuthResponse(
      accessToken: json["accessToken"],
      tokenType: json["tokenType"],
      user: json["user"] != null ? User.fromJson(json["user"]) : null,
      student: json["student"] != null ? Student.fromJson(json["student"]) : null
  )
  ;

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "tokenType": tokenType,
        "student": student?.toJson(),
        //"user": user != null? user?.toJson() : "",
      };
}
