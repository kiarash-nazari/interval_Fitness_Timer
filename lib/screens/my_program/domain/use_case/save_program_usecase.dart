import 'package:interval_timer/res/data_state.dart';
import 'package:interval_timer/res/use_case.dart';
import 'package:interval_timer/screens/my_program/domain/entites/my_programs_entity.dart';
import 'package:interval_timer/screens/my_program/domain/repository/my_programs_repository.dart';

class SaveProgramUsecase implements UseCase<DataState<MyProgramsEntity>,String>{
  final MyProgramsRepository _myProgramsRepository;
  SaveProgramUsecase(this._myProgramsRepository);

  @override
  Future<DataState<MyProgramsEntity>> call(String prompt) {
    // TODO: implement call
    return _myProgramsRepository.saveProgramToDB(prompt);
  }

}