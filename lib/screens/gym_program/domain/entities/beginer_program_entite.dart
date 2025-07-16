import 'package:equatable/equatable.dart';
import 'package:interval_timer/screens/gym_program/data/models/beginer_program_model.dart';

class BeginerProgramEntity extends Equatable {
  var description;
  var warning;
  var name;
  var frequency;
  var rest;
  final List<TrainingDay>? days;

  BeginerProgramEntity(
      {this.name, this.frequency, this.rest, this.days, this.description,this.warning});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
