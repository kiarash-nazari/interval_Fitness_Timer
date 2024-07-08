import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/res/use_case.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';
import 'package:interval_timer/screens/gym_program/domain/repository/gym_program_repository.dart';

class GetBeginerProgramUseCase
    extends UseCase<DataState<BeginerProgramEntity>, String> {
  final GymProgramRepository gymProgramRepository;
  GetBeginerProgramUseCase(this.gymProgramRepository);

  @override
  Future<DataState<BeginerProgramEntity>> call(String prompt) {
    return gymProgramRepository.fetchBeginerProgram(prompt);
  }
}
