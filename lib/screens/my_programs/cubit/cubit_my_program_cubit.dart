import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interval_timer/screens/gym_program/models/training_program.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';

part 'cubit_my_program_state.dart';

class CubitMyProgramCubit extends Cubit<CubitMyProgramState> {
  CubitMyProgramCubit() : super(CubitMyProgramInitial()) {
    sendProgramToUi();
  }

  Future<void> sendProgramToUi() async {
    Map<String, dynamic>? jsonFromSharedPrefrence =
        SharedPreferencesManager().getMap("beginerProgram");
    var program = TrainingProgram.fromJson(jsonFromSharedPrefrence);
    emit(StartSendProgram(program));
  }
}
