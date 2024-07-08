import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/res/prompts.dart';
import 'package:interval_timer/screens/gym_program/data/data_sources/remote/gpt_api_call.dart';
import 'package:interval_timer/screens/gym_program/data/models/beginer_program_model.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';
import 'package:interval_timer/screens/gym_program/domain/repository/gym_program_repository.dart';

class GymProgramRepositoryimpl extends GymProgramRepository {
  GptApiCall gptApiCall;
  GymProgramRepositoryimpl(this.gptApiCall);

  @override
  Future<DataState<BeginerProgramEntity>> fetchBeginerProgram(
      String prompt) async {
    try {
      Map<String, dynamic>? myData = await gptApiCall.beginers(Prompts.beginer);

      BeginerProgramEntity beginerProgramEntity =
          BeginerProgramModel.fromJson(myData!);

      return DataSucsess(beginerProgramEntity);
    } catch (e) {
      // fetchBeginerProgram("");
      return DataFailed(e.toString());
    }
  }
}
