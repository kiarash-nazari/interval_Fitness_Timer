import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/my_program/domain/use_case/get_programs_usecase.dart';
import 'package:interval_timer/screens/my_program/domain/use_case/save_program_usecase.dart';
import 'package:interval_timer/screens/my_program/interface/bloc/cubit/get_programs_status.dart';
import 'package:interval_timer/screens/my_program/interface/bloc/cubit/save_program_status.dart';

part 'my_programs_state.dart';

class MyProgramsCubit extends Cubit<MyProgramsState> {
  SaveProgramUsecase saveProgramUsecase;
  GetProgramsUsecase getProgramsUsecase;
  MyProgramsCubit(this.saveProgramUsecase, this.getProgramsUsecase)
      : super(MyProgramsState(
            getProgramsStatus: GetProgramInitial(),
            saveProgramStatus: SaveProgramInitial()));

  getPrograms() async {
    emit(state.copyWith(newGetProgramsStatust: GetProgramLoading()));

    DataState dataState = await getProgramsUsecase.call("");

    if (dataState is DataSucsess) {
      emit(state.copyWith(
          newGetProgramsStatust: GetProgramComplited(dataState.data)));
    }
    if (dataState is DataFailed) {
      emit(state.copyWith(
          newGetProgramsStatust: GetProgramError(dataState.error)));
    }
  }

  saveProgram(String programName) async {
    emit(state.copyWith(newSaveProgramStatus: SaveProgramLoading()));

    DataState dataState = await saveProgramUsecase.call(programName);

    if (dataState is DataSucsess) {
      emit(state.copyWith(
          newSaveProgramStatus: SaveProgramComplited(dataState.data)));
    }
    if (dataState is DataFailed) {
      emit(state.copyWith(
          newSaveProgramStatus: SaveProgramError(dataState.error)));
    }
  }
}
