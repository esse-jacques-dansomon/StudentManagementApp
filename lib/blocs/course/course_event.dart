part of 'course_bloc.dart';

sealed class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

// GET CLASSROOM COURSES
class GetClassroomCoursesEvent extends CourseEvent {
  final int classroomId;
  const GetClassroomCoursesEvent({required this.classroomId});

  @override
  List<Object> get props => [classroomId];
}


// GET CLASSROOM COURSES BY STATUS
class GetClassroomCoursesByStatusEvent extends CourseEvent {
  final int classroomId;
  final String status;
  const GetClassroomCoursesByStatusEvent(
      {required this.classroomId, required this.status});

  @override
  List<Object> get props => [classroomId, status];
}

// GET COURSE BY ID
class GetCourseByIdEvent extends CourseEvent {
  final int courseId;
  const GetCourseByIdEvent({required this.courseId});
  @override
  List<Object> get props => [courseId];
}
