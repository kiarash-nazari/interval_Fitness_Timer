part of 'cubit_my_program_cubit.dart';

sealed class CubitMyProgramState extends Equatable {
  const CubitMyProgramState();

  @override
  List<Object> get props => [];
}

final class CubitMyProgramInitial extends CubitMyProgramState {
  @override
  List<Object> get props => [];
}

final class StartSendProgram extends CubitMyProgramState {
  final TrainingProgram program;
  const StartSendProgram(this.program);

  @override
  List<Object> get props => [program];
}
