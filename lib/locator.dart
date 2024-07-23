import 'package:get_it/get_it.dart';
import 'package:interval_timer/screens/gym_program/data/data_sources/remote/gpt_api_call.dart';
import 'package:interval_timer/screens/gym_program/data/repository/gym_program_repositoryimpl.dart';
import 'package:interval_timer/screens/gym_program/domain/repository/gym_program_repository.dart';
import 'package:interval_timer/screens/gym_program/domain/use_case/get_beginer_program_use_case.dart';
import 'package:interval_timer/screens/gym_program/interface/cubit/cubit_program_cubit.dart';
import 'package:interval_timer/screens/my_program/data/repository/my_programs_repository_impl.dart';
import 'package:interval_timer/screens/my_program/data/source/local/database.dart';
import 'package:interval_timer/screens/my_program/data/source/local/programs_dao.dart';
import 'package:interval_timer/screens/my_program/domain/use_case/get_programs_usecase.dart';
import 'package:interval_timer/screens/my_program/domain/use_case/save_program_usecase.dart';
import 'package:interval_timer/screens/my_program/domain/repository/my_programs_repository.dart';
import 'package:interval_timer/screens/my_program/interface/bloc/cubit/my_programs_cubit.dart';

GetIt locator = GetIt.instance;

Future<void> setUp() async {
  // Register API calls
  locator.registerSingleton<GptApiCall>(GptApiCall());

  // Register local database
  final dataBase =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(dataBase);

  // Register DAOs
  locator.registerSingleton<MyProgramsDao>(dataBase.programsDao);
  // Register use cases
  locator.registerSingleton<MyProgramsRepository>(
      MyProgramsRepositoryImpl(locator()));
  // Register repositories
  locator.registerSingleton<SaveProgramUsecase>(SaveProgramUsecase(locator()));
  locator.registerSingleton<GymProgramRepository>(
      GymProgramRepositoryimpl(locator(), locator()));
  locator.registerSingleton<GetBeginerProgramUseCase>(
      GetBeginerProgramUseCase(locator()));
  locator.registerSingleton<GetProgramsUsecase>(GetProgramsUsecase(locator()));

  // Register Cubits
  locator.registerSingleton<MyProgramsCubit>(
      MyProgramsCubit(locator(), locator()));
  locator.registerSingleton<CubitProgram>(CubitProgram(locator()));
}
