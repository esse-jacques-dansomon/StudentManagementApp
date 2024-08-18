part of 'program_bloc.dart';

sealed class ProgramState extends Equatable {
  const ProgramState();
}

final class ProgramInitial extends ProgramState {
  @override
  List<Object> get props => [];
}

final class ProgramLoading extends ProgramState {
  @override
  List<Object> get props => [];
}

final class ProgramLoaded extends ProgramState {
  final List<Session> sessions;

  const ProgramLoaded(this.sessions);

  @override
  List<Object> get props => [sessions];
}


final class ProgramError extends ProgramState {
  final String message;

  const ProgramError(this.message);

  @override
  List<Object> get props => [message];
}