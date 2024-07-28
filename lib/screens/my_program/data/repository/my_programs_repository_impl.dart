import 'dart:convert';

import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/gym_program/data/models/beginer_program_model.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';
import 'package:interval_timer/screens/my_program/data/source/local/programs_dao.dart';
import 'package:interval_timer/screens/my_program/domain/entiti/my_programs_Entity.dart';
import 'package:interval_timer/screens/my_program/domain/repository/my_programs_repository.dart';

class MyProgramsRepositoryImpl extends MyProgramsRepository {
  MyProgramsDao programsDao;
  MyProgramsRepositoryImpl(this.programsDao);

  @override
  Future<DataState<List<BeginerProgramEntity>>> getProgramFromDB() async {
    try {
      List<MyProgramsEntity> myPrograms = await programsDao.getAllPrograms();
      print(
          "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSm${myPrograms.first.programName}");

      List<BeginerProgramEntity> dbBeginerProgramEntity = [];

      myPrograms.forEach((element) {
        // Assuming programName is the JSON string stored in the database
        Map<String, dynamic> programData = jsonDecode(element.programName);
        BeginerProgramModel programModel =
            BeginerProgramModel.fromJson(programData);
        dbBeginerProgramEntity.add(programModel);
      });

      return DataSucsess(dbBeginerProgramEntity);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<MyProgramsEntity>> saveProgramToDB(
      String programName) async {
    try {
      MyProgramsEntity myProgramsEntity =
          MyProgramsEntity(programName: programName);
      await programsDao.insertProgram(myProgramsEntity);
      print("suuuuuuuuuuuuuuuuuuuuuuuuuuuuuu$myProgramsEntity");
      return DataSucsess(myProgramsEntity);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
