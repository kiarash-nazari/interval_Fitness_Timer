import 'package:floor/floor.dart';
import 'package:interval_timer/screens/my_program/domain/entites/my_programs_entity.dart';

@dao
abstract class MyProgramsDao {
  @Query('SELECT * FROM MyProgramsEntity')
  Future<List<MyProgramsEntity>> getAllPrograms();

  @insert
  Future<void> insertProgram(MyProgramsEntity program);
}
