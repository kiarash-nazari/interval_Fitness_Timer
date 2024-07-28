import 'package:equatable/equatable.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';

abstract class GetProgramsStatus extends Equatable {}

class GetProgramInitial extends GetProgramsStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetProgramLoading extends GetProgramsStatus {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetProgramComplited extends GetProgramsStatus {
  final List<BeginerProgramEntity> myProgramsEntity;
  GetProgramComplited(this.myProgramsEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [myProgramsEntity];
}

class GetProgramError extends GetProgramsStatus {
  final String? message;
  GetProgramError(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
