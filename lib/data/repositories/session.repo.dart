import 'dart:convert';

import '../datasource/AppHttpClient.dart';
import '../models/session.model.dart';

class SessionRepository {
  final AppHttpClient httpClient;
  SessionRepository({
    required this.httpClient,
  });


  Future<List<Session>> getTodaySessionsByClassRoom(int id) async {
    final response = await httpClient.get('/sessions/classroom/$id/today');

    try{
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        return data.map((json) => Session.fromJson(json)).toList();
      } else {

        throw Exception('Failed to load sessions');
      }
    }catch ( e){
      print(e);
      return [];
    }

  }


  Future<List<Session>> getSessionsByClassRoomAndDate(int id) async {
    final response = await httpClient.get('/sessions/classroom/$id/today');
    try{
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
        return data.map((json) => Session.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load sessions');
      }
    }catch ( e){
      print(e);
      return [];
    }

  }

}