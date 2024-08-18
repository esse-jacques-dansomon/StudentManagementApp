import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/data/models/course.details.model.dart';
import 'package:school_managment/data/repositories/session.repo.dart';

part 'program_event.dart';
part 'program_state.dart';

class ProgramBloc extends Bloc<ProgramEvent, ProgramState> {
  final SessionRepository sessionRepository;
  ProgramBloc({required this.sessionRepository}) : super(ProgramInitial()) {
    on<LoadProgramByDate>(_loadProgramByDate);
  }

  void _loadProgramByDate(LoadProgramByDate event, Emitter<ProgramState> emit) async {
    emit(ProgramLoading());
    try {
      //List<Session> sessions = await sessionRepository.getSessionsByClassRoomAndDate(event.date);
      //emit(ProgramLoaded(sessions));
    } catch (e) {
      emit(ProgramError(e.toString()));
    }
  }
}
