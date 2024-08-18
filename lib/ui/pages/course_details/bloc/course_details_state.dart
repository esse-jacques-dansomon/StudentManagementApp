part of 'course_details_bloc.dart';

@immutable
sealed class CourseDetailsState {}

final class CourseDetailsInitial extends CourseDetailsState {}

final class CourseDetailsLoading extends CourseDetailsState {
  @override
  String toString() => 'CourseDetailsLoading';
}

final class CourseDetailsLoaded extends CourseDetailsState {
  final CourseDetails courseDetails;

  CourseDetailsLoaded(this.courseDetails);

  @override
  String toString() => 'CourseDetailsLoaded { courseDetails: $courseDetails }';
}

final class CourseDetailsError extends CourseDetailsState {
  final String message;

  CourseDetailsError(this.message);

  @override
  String toString() => 'CourseDetailsError { message: $message }';
}
