part of 'my_programs_cubit.dart';

 class MyProgramsState extends Equatable {
 final SaveProgramStatus saveProgramStatus;
 final GetProgramsStatus getProgramsStatus;
  const MyProgramsState(
      {required this.getProgramsStatus, required this.saveProgramStatus});

  MyProgramsState copyWith(
      {SaveProgramStatus? newSaveProgramStatus,
      GetProgramsStatus? newGetProgramsStatust}) {
    return MyProgramsState(
        saveProgramStatus: newSaveProgramStatus ?? saveProgramStatus,
        getProgramsStatus: newGetProgramsStatust ?? getProgramsStatus);
  }

  @override
  List<Object> get props => [getProgramsStatus, saveProgramStatus];
}

