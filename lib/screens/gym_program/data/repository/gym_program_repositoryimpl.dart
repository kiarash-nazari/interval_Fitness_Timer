import 'dart:convert';

import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/screens/gym_program/data/data_sources/remote/gpt_api_call.dart';
import 'package:interval_timer/screens/gym_program/data/models/beginer_program_model.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';
import 'package:interval_timer/screens/gym_program/domain/repository/gym_program_repository.dart';
import 'package:interval_timer/screens/my_program/domain/use_case/save_program_usecase.dart';

// fetchBeginerProgram("");
class GymProgramRepositoryimpl extends GymProgramRepository {
  GptApiCall gptApiCall;
  SaveProgramUsecase saveProgramUsecase;
  GymProgramRepositoryimpl(this.gptApiCall, this.saveProgramUsecase);

  @override
  Future<DataState<BeginerProgramEntity>> fetchBeginerProgram(
      String prompt) async {
    try {
      Map<String, dynamic>? myData = await gptApiCall.beginers(prompt);

      BeginerProgramEntity beginerProgramEntity =
          BeginerProgramModel.fromJson(myData!);
      saveProgramUsecase.call(jsonEncode(myData));

      return DataSucsess(beginerProgramEntity);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
