import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/data/models/course.model.dart';
import 'package:school_managment/data/repositories/course.repo.dart';

import '../../../../utils/SecureStorage.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CourseRepository courseRepository;
  final SecureStorage secureStorage;


  HomeBloc({required this.courseRepository, required this.secureStorage}) : super(HomeInitial()) {
    on<HomeLoadData>(_onHomeLoadData);
  }

  Future<void> _onHomeLoadData(
      HomeLoadData event, Emitter<HomeState> emit) async {
    emit(HomeDataLoading());
    try {
      final courses =
          await courseRepository.getClassRoomCourses(event.classroomId);
      final coursesWithStatus = await courseRepository
          .getClassroomCoursesByStatus(event.classroomId, event.status);
      emit(HomeDataLoaded(courses, coursesWithStatus, event.status));
    } catch (error) {
      emit(HomeDataError(error.toString()));
    }
  }
}
