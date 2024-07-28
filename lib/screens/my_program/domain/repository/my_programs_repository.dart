import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';
import 'package:interval_timer/screens/my_program/domain/entiti/my_programs_Entity.dart';

abstract class MyProgramsRepository {
  Future<DataState<MyProgramsEntity>> saveProgramToDB(String programName);
  Future<DataState<List<BeginerProgramEntity>>> getProgramFromDB();
}
