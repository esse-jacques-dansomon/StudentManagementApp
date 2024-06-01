part of 'course_bloc.dart';

// sealed class CourseState extends Equatable {
//   const CourseState();
// }

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}


final class CourseInitial extends CourseState {
}

class CourseLoading extends CourseState {
}

class ClassroomCoursesLoading extends CourseState {
}

class ClassroomCoursesByStatusLoading extends CourseState {
}

class CourseByIdLoading extends CourseState {
}

class ClassroomCoursesLoaded extends CourseState {
  final List<Course> courses;

  const ClassroomCoursesLoaded(this.courses);

  @override
  List<Object> get props => [courses];
}

class ClassroomCoursesByStatusLoaded extends CourseState {
  final List<Course> courses;

  const ClassroomCoursesByStatusLoaded(this.courses);

  @override
  List<Object> get props => [courses];
}

class CourseByIdLoaded extends CourseState {
  final Course course;

  const CourseByIdLoaded(this.course);

  @override
  List<Object> get props => [course];
}

class CourseError extends CourseState {
  final String message;

  const CourseError(this.message);

  @override
  List<Object> get props => [message];
}

class ClassroomCoursesError extends CourseState {
  final String message;

  const ClassroomCoursesError(this.message);

  @override
  List<Object> get props => [message];
}

class ClassroomCoursesByStatusError extends CourseState {
  final String message;

  const ClassroomCoursesByStatusError(this.message);

  @override
  List<Object> get props => [message];
}

class CourseByIdError extends CourseState {
  final String message;

  const CourseByIdError(this.message);

  @override
  List<Object> get props => [message];
}
