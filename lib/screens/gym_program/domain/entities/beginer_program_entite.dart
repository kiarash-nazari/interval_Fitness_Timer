import 'package:equatable/equatable.dart';
import 'package:interval_timer/screens/gym_program/data/models/beginer_program_model.dart';

 class BeginerProgramEntity extends Equatable {
  var name;
  var frequency;
  var rest;
  final List<TrainingDay>? days;

  BeginerProgramEntity({this.name, this.frequency, this.rest, this.days});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
