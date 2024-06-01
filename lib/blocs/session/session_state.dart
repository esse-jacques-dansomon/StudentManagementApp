part of 'session_bloc.dart';

sealed class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object?> get props => [];
}

final class SessionInitial extends SessionState {
}


final class SessionLoading extends SessionState {

  const SessionLoading();
  @override
  List<Object> get props => [];

  @override
  String toString() => 'SessionLoading';
}


final class ClassRoomTodaySessionsLoad extends SessionState {
  final List<Session> sessions;

  const ClassRoomTodaySessionsLoad({required this.sessions});

  @override
  List<Object> get props => [sessions];

}

final class SessionFailure extends SessionState {
  final String message;

  const SessionFailure({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'SessionFailure';
}


