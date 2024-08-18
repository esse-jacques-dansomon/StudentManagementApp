import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/data/repositories/session.repo.dart';

import '../../../../../data/models/session.model.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final SessionRepository sessionRepository;
  SessionBloc({required this.sessionRepository}) : super(SessionInitial()) {
    on<GetClassRoomTodaySessions>(_getClassRoomTodaySessions);
  }

  Future<void> _getClassRoomTodaySessions(
      GetClassRoomTodaySessions event, Emitter<SessionState> emit) async {
    emit(const SessionLoading());
    try {
      final sessions =
      await sessionRepository.getTodaySessionsByClassRoom(event.classRoomId);
      emit(ClassRoomTodaySessionsLoad(sessions: sessions));
    } catch (error) {
      emit(SessionFailure( message:error.toString()));
    }
  }
}


