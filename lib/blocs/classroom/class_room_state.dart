part of 'class_room_bloc.dart';

sealed class ClassRoomState extends Equatable {
  const ClassRoomState();
}

final class ClassRoomInitial extends ClassRoomState {
  @override
  List<Object> get props => [];
}

class ClassRoomLoading extends ClassRoomState {
  @override
  List<Object> get props => [];
}

class ClassRoomLoaded extends ClassRoomState {
  final ClassRoom classRoom;

  const ClassRoomLoaded({required this.classRoom});

  @override
  List<Object> get props => [classRoom];
}

class ClassRoomError extends ClassRoomState {
  final String message;

  const ClassRoomError({required this.message});

  @override
  List<Object> get props => [message];
}