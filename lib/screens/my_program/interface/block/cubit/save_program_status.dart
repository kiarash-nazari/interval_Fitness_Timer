import 'package:equatable/equatable.dart';
import 'package:interval_timer/screens/my_program/domain/entiti/my_programs_Entity.dart';

abstract class SaveProgramStatus extends Equatable{
}

class SaveProgramInitial extends SaveProgramStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SaveProgramLoading extends SaveProgramStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SaveProgramComplited extends SaveProgramStatus{
  final MyProgramsEntity myProgramsEntity;
  SaveProgramComplited(this.myProgramsEntity);
  @override
  // TODO: implement props
  List<Object?> get props => [myProgramsEntity];

}


class SaveProgramError extends SaveProgramStatus{
final String? message;
SaveProgramError(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}