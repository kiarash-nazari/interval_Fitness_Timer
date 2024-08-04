import 'package:bloc/bloc.dart';
import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/gym_program/domain/use_case/get_beginer_program_use_case.dart';
import 'package:interval_timer/screens/gym_program/interface/cubit/beginer_program_status.dart';

part 'cubit_program_state.dart';

class CubitProgram extends Cubit<CubitProgramState> {
  // final MyProgramsCubit myProgramsCubit;
  final GetBeginerProgramUseCase getBeginerProgramUseCase;
  bool isMoved = false;

  CubitProgram(this.getBeginerProgramUseCase)
      : super(CubitProgramState(beginerProgramStatus: BeginerProgramInital())) {
    // ignore: unused_element
  }

  Future<void> loadBeginer({required String prompt}) async {
    emit(
      state.copyWith(newBeginerProgramStatus: BeginerProgramLoading()),
    );

    DataState dataState = await getBeginerProgramUseCase(prompt);

    if (dataState is DataSucsess) {
      // print("jjjjjjjjjjjjjjjjjjjjjjadid sahih");
      // myProgramsCubit.saveProgramUsecase(dataState.data);

      emit(state.copyWith(
          newBeginerProgramStatus: MoveThePosition(isMoved: isMoved)));
      emit(state.copyWith(
          newBeginerProgramStatus: BeginerProgramComplited(dataState.data)));
      isMoved = !isMoved;
    }

    if (dataState is DataFailed) {
      // print("jjjjjjjjjjjjjjjjjjjjjjadid false");
      // print(dataState.error);
      if (dataState.error ==
          "ClientException with SocketException: Failed host lookup: 'api.openai.com' (OS Error: No address associated with hostname, errno = 7), uri=https://api.openai.com/v1/chat/completions") {
        emit(state.copyWith(newBeginerProgramStatus: BeginerConnectionError()));
        return;
      }
      emit(state.copyWith(
          newBeginerProgramStatus: BeginerProgramError(dataState.error)));
      loadBeginer(prompt: prompt);
    }
  }

  void steper(int newStep) {
    emit(state.copyWith(
        newBeginerProgramStatus: MySteper(currentStep: newStep)));
  }
}
