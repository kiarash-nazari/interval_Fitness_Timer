import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/screens/body/cubit/body_compose_cubit.dart';
import 'package:interval_timer/screens/gym_program/interface/program_interface.dart';
import 'package:interval_timer/screens/splash/splash_screen.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.instance.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  OpenAI.apiKey = dotenv.env['OPENAIAPIKEY']!;
  OpenAI.requestsTimeOut = const Duration(seconds: 50);
  // OpenAI.organization = "org-JsEGrKJ9wB4w1F9mRtwvoEDX";
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => BodyComposeCubit()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ProgramInterface());
  }
}
