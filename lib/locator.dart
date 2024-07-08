import 'package:get_it/get_it.dart';
import 'package:interval_timer/screens/gym_program/data/data_sources/remote/gpt_api_call.dart';
import 'package:interval_timer/screens/gym_program/data/repository/gym_program_repositoryimpl.dart';
import 'package:interval_timer/screens/gym_program/domain/repository/gym_program_repository.dart';
import 'package:interval_timer/screens/gym_program/domain/use_case/get_beginer_program_use_case.dart';
import 'package:interval_timer/screens/gym_program/interface/cubit/cubit_program_cubit.dart';

GetIt locator = GetIt.instance;

setUp() {
  locator.registerSingleton<GptApiCall>(GptApiCall());

  /// repositories
  locator.registerSingleton<GymProgramRepository>(
      GymProgramRepositoryimpl(locator()));

  /// use_cases
  locator.registerSingleton<GetBeginerProgramUseCase>(
      GetBeginerProgramUseCase(locator()));

  /// Cubit
  locator.registerSingleton<CubitProgram>(CubitProgram(locator()));
}
