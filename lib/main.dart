import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/firebase_options.dart';
import 'package:interval_timer/locator.dart';
import 'package:interval_timer/screens/body/cubit/body_compose_cubit.dart';
import 'package:interval_timer/screens/gym_program/interface/program_interface.dart';
import 'package:interval_timer/screens/main_screen/main_screen.dart';
import 'package:interval_timer/screens/my_program/interface/block/cubit/my_programs_cubit.dart';
import 'package:interval_timer/screens/my_program/interface/screen/my_programs_screen.dart';
import 'package:interval_timer/screens/register/interface/bloc/cubit/registe_cubit.dart';
import 'package:interval_timer/screens/register/interface/screen/register_screen.dart';
import 'package:interval_timer/screens/splash/splash_screen.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setUp();
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.instance.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  OpenAI.apiKey = dotenv.env['OPENAIAPIKEY']!;
  OpenAI.requestsTimeOut = const Duration(seconds: 50);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => BodyComposeCubit()),
      BlocProvider(create: (context) => locator<MyProgramsCubit>()),
      BlocProvider(create: (context) => locator<RegisterCubit>()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => const SplashScreen(),
        "/registerScreen": (BuildContext context) => const RegisterScreen(),
        "/programScreen": (BuildContext context) => const ProgramInterface(),
        "/myProgramsScreen": (BuildContext context) => const MyProgramsScreen(),
        "/mainWindow": (BuildContext context) => MainWindow(),
      },
      // home: const ProgramInterface()
    );
  }
}
