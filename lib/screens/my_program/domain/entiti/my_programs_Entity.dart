import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class MyProgramsEntity extends Equatable {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String programName;

  MyProgramsEntity({required this.programName});
  @override
  List<Object?> get props => [];
}
