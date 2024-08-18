import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/data/repositories/course.repo.dart';

import 'package:school_managment/data/models/course.details.model.dart';

part 'course_details_event.dart';

part 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  final CourseRepository courseRepository ;
  CourseDetailsBloc({required this.courseRepository}) : super(CourseDetailsInitial()) {
    on<GetCourseDetails>(_getCourseDetails);
  }

  void _getCourseDetails(
      GetCourseDetails event, Emitter<CourseDetailsState> emit) async {
      emit(CourseDetailsLoading());
      try {
        final courseDetails = await courseRepository.getCourseById(event.courseId);
        emit(CourseDetailsLoaded(courseDetails));
      }
      catch (e) {
        emit(CourseDetailsError(e.toString()));
      }
  }
}
