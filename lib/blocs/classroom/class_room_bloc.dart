import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/data/repositories/classrom.repo.dart';
import '../../data/models/classroom.model.dart';

part 'class_room_event.dart';
part 'class_room_state.dart';

class ClassRoomBloc extends Bloc<ClassRoomEvent, ClassRoomState> {
  final ClassRoomRepository classRoomRepository;
  ClassRoomBloc({required this.classRoomRepository}) : super(ClassRoomInitial()) {
    on<GetClassRoomEvent>((event, emit) async {
      emit(ClassRoomLoading());
      try {
        final classroom = await classRoomRepository.getClassRoom(event.id);
        emit(ClassRoomLoaded( classRoom: classroom));
      }catch (e) {
        emit(ClassRoomError(message: e.toString()));
      }finally  {

      }
    });
  }
}
