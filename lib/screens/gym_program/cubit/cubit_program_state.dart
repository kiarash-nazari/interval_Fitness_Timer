part of 'cubit_program_cubit.dart';

sealed class CubitProgramState extends Equatable {
  const CubitProgramState();

  @override
  List<Object> get props => [];
}

final class CubitProgramInitial extends CubitProgramState {}

final class MoveThePosition extends CubitProgramState {
  final bool isMoved;
  const MoveThePosition({required this.isMoved});
  @override
  List<Object> get props => [isMoved];
}
