import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';

abstract class GymProgramRepository {
  Future<DataState<BeginerProgramEntity>> fetchBeginerProgram(String prompt);
}
