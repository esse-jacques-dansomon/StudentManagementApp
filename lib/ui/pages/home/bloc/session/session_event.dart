part of 'session_bloc.dart';

sealed class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object?> get props => [];
}

// ClassRoomTodaySessions
class GetClassRoomTodaySessions extends SessionEvent {
  final int classRoomId;

  const GetClassRoomTodaySessions({required this.classRoomId});

  @override
  List<Object> get props => [classRoomId];
}
