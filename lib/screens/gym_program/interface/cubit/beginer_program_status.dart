import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';

@immutable
abstract class BeginerProgramStatus extends Equatable {}

class BeginerProgramInital extends BeginerProgramStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BeginerProgramLoading extends BeginerProgramStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BeginerProgramComplited extends BeginerProgramStatus {
  final BeginerProgramEntity beginerProgramEntity;
  BeginerProgramComplited(this.beginerProgramEntity);

  @override
  // TODO: implement props
  List<Object?> get props => [beginerProgramEntity];
}

class BeginerProgramError extends BeginerProgramStatus {
  final String? messageError;
  BeginerProgramError(this.messageError);

  @override
  // TODO: implement props
  List<Object?> get props => [messageError];
}

class BeginerConnectionError extends BeginerProgramStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MoveThePosition extends BeginerProgramStatus {
  final bool isMoved;
  MoveThePosition({required this.isMoved});
  @override
  List<Object> get props => [isMoved];
}

class MySteper extends BeginerProgramStatus {
  final int currentStep;
  MySteper({required this.currentStep});
  @override
  List<Object> get props => [currentStep];
}
