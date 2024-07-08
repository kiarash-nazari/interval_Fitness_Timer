part of 'cubit_program_cubit.dart';

class CubitProgramState {
  BeginerProgramStatus beginerProgramStatus;
  CubitProgramState({required this.beginerProgramStatus});

  CubitProgramState copyWith({BeginerProgramStatus? newBeginerProgramStatus}) {
    return CubitProgramState(
        beginerProgramStatus: newBeginerProgramStatus ?? beginerProgramStatus);
  }
}








// sealed class CubitProgramState extends Equatable {
//   const CubitProgramState();

//   @override
//   List<Object> get props => [];
// }

// final class CubitProgramInitial extends CubitProgramState {}

// final class MoveThePosition extends CubitProgramState {
//   final bool isMoved;
//   const MoveThePosition({required this.isMoved});
//   @override
//   List<Object> get props => [isMoved];
// }

// final class TraningResponseFromGpt extends CubitProgramState {
//   final TrainingProgram program;
//   const TraningResponseFromGpt({required this.program});
//   @override
//   List<Object> get props => [program];
// }

// final class CubitProgramError extends CubitProgramState {
//   final String message;
//   const CubitProgramError({required this.message});
//   @override
//   List<Object> get props => [message];
// }

// final class Loading extends CubitProgramState {
//   const Loading();
//   @override
//   List<Object> get props => [];
// }
