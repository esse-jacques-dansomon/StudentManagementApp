import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/course.model.dart';
import '../../data/repositories/course.repo.dart';

part 'course_event.dart';

part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<GetClassroomCoursesEvent>(_onGetClassroomCourses);
    on<GetClassroomCoursesByStatusEvent>(_onGetClassroomCoursesByStatusEvent);
    on<GetCourseByIdEvent>(_onGetCourseById);
  }

  Future<void> _onGetClassroomCourses(
      GetClassroomCoursesEvent event, Emitter<CourseState> emit) async {
    emit(ClassroomCoursesLoading());
    try {
      final courses =
          await courseRepository.getClassRoomCourses(event.classroomId);
      print(courses.length);
      emit(ClassroomCoursesLoaded(courses));
    } catch (error) {
      emit(ClassroomCoursesError(error.toString()));
    }
  }

  Future<void> _onGetClassroomCoursesByStatusEvent(
      GetClassroomCoursesByStatusEvent event, Emitter<CourseState> emit) async {
    emit(ClassroomCoursesByStatusLoading());
    try {
      final courses = await courseRepository.getClassroomCoursesByStatus(
          event.classroomId, event.status);
      print(courses.length);
      emit(ClassroomCoursesByStatusLoaded(courses));
    } catch (error) {
      emit(ClassroomCoursesByStatusError(error.toString()));
    }
  }

  Future<void> _onGetCourseById(
      GetCourseByIdEvent event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      final course = await courseRepository.getCourseById(event.courseId);
      emit(CourseByIdLoaded(course));
    } catch (error) {
      emit(CourseByIdError(error.toString()));
    }
  }
}
