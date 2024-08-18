import 'package:school_managment/utils/string_extension.dart';

import 'classroom.model.dart';

class Student {
  String firstName;
  String lastName ;
  String registrationNumber;
  String email;
  int id;
  String address;
  ClassRoom classRoom;

  Student({
    required this.firstName,
    required this.lastName,
    required this.registrationNumber,
    required this.email,
    required this.id,
    required this.address,
    required this.classRoom,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      firstName: json['firstName'],
      lastName: json['lastName'],
      registrationNumber: json['registrationNumber'],
      email: json['email'],
      id: json['id'],
      address: json['address'],
      classRoom: ClassRoom.fromJson(json['classRoom']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'registrationNumber': registrationNumber,
      'email': email,
      'id': id,
      'address': address,
      'classRoom': classRoom.toJson(),
    };
  }

  String fullName() {
    return "${firstName.toTitleCase()} ${lastName.toCapitalized()}";
  }

}