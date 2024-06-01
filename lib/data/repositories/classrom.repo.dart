import 'dart:convert';

import '../datasource/AppHttpClient.dart';
import '../models/classroom.model.dart';

class ClassRoomRepository {
  final AppHttpClient httpClient;
  ClassRoomRepository({
    required this.httpClient,
  });

  Future<List<ClassRoom>> getClassRooms() async {
    final response = await httpClient.get('/classrooms');

    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        return data.map((json) => ClassRoom.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Failed to load classrooms');
      }
    } catch (e) {
      print(e);
      throw e; // Or handle it in a way appropriate to your application
    }
  }

  Future<ClassRoom> getClassRoom(int id) async {
    final response = await httpClient.get('/classrooms/$id');
    return ClassRoom.fromJson(response.body as Map<String, dynamic>);
  }

}