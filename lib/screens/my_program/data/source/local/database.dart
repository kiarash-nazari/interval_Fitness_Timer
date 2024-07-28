// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:interval_timer/screens/my_program/data/source/local/programs_dao.dart';
import 'package:interval_timer/screens/my_program/domain/entiti/my_programs_Entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [MyProgramsEntity])
abstract class AppDatabase extends FloorDatabase {
  MyProgramsDao get programsDao;
}
