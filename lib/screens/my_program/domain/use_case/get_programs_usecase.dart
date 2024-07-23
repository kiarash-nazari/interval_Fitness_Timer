import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/res/use_case.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';
import 'package:interval_timer/screens/my_program/domain/repository/my_programs_repository.dart';

class GetProgramsUsecase
    implements UseCase<DataState<List<BeginerProgramEntity>>, String> {
  final MyProgramsRepository _myProgramsRepository;
  GetProgramsUsecase(this._myProgramsRepository);

  @override
  Future<DataState<List<BeginerProgramEntity>>> call(String prompt) {
    // TODO: implement call
    return _myProgramsRepository.getProgramFromDB();
  }
}
