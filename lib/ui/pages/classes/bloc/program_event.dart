part of 'program_bloc.dart';

sealed class ProgramEvent extends Equatable {
  const ProgramEvent();
}

class LoadProgramByDate extends ProgramEvent {
  final DateTime date;

  const LoadProgramByDate(this.date);

  @override
  List<Object> get props => [date];
}
