part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}


// LOAD THE HOME PAGE DATA
class HomeLoadData extends HomeEvent {
  final int classroomId;
  final String status;
  const HomeLoadData({required this.classroomId, required this.status});

  @override
  List<Object> get props => [classroomId, status];
}

