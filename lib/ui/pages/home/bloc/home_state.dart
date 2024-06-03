part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
}

class HomeDataLoading extends HomeState {
}

class HomeDataLoaded extends HomeState {
  final List<Course> courses;
  final List<Course> coursesWithStatus;
  final String status;

  const HomeDataLoaded(this.courses, this.coursesWithStatus, this.status);

  @override
  List<Object> get props => [courses, coursesWithStatus, status];

}

class HomeDataError extends HomeState {
  final String message;

  const HomeDataError(this.message);

  @override
  List<Object> get props => [message];
}


