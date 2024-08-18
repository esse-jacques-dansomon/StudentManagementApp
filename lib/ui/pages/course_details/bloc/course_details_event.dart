part of 'course_details_bloc.dart';

@immutable
sealed class CourseDetailsEvent {}

class GetCourseDetails extends CourseDetailsEvent {
  final int courseId;

  GetCourseDetails(this.courseId);

  List<Object> get props => [courseId];
}
