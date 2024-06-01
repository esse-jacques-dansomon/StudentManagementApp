import 'dart:convert';

import 'package:school_managment/data/models/course.model.dart';

import '../datasource/AppHttpClient.dart';

class CourseRepository {
  final AppHttpClient httpClient;
  CourseRepository({
    required this.httpClient,
  });


  Future<Course> getCourseById(int id) async {
    final response = await httpClient.get('/courses/$id');
    return Course.fromJson(response.body as Map<String, dynamic>);
  }

  Future<List<Course>> getClassRoomCourses(int id) async {
    final response = await httpClient.get('/courses/classroom/$id');
    final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
    return data.map((json) => Course.fromJson(json as Map<String, dynamic>)).toList();

  }

  Future<List<Course>> getClassroomCoursesByStatus(int id, String status) async {
    final response = await httpClient.get('/courses/classroom/$id/status/$status');
    final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
    return data.map((json) => Course.fromJson(json as Map<String, dynamic>)).toList();
  }



}