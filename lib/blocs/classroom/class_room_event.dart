part of 'class_room_bloc.dart';

sealed class ClassRoomEvent extends Equatable {
  const ClassRoomEvent();
}


//---getClassRoomEvent
class GetClassRoomEvent extends ClassRoomEvent {
  final int id;
  const GetClassRoomEvent(this.id);
  @override
  List<Object> get props => [];
}





