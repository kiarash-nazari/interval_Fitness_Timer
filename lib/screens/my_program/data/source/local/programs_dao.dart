import 'package:floor/floor.dart';

import 'package:interval_timer/screens/my_program/domain/entiti/my_programs_Entity.dart';

@dao
abstract class MyProgramsDao {
  @Query('SELECT * FROM MyProgramsEntity')
  Future<List<MyProgramsEntity>> getAllPrograms();

  @insert
  Future<void> insertProgram(MyProgramsEntity program);
}
