import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/data/repo/remix_music_data_rep.dart';
import 'package:interval_timer/data/res/remix_music_data_src.dart';
import 'package:interval_timer/screens/body/back_body.dart';
import 'package:interval_timer/screens/body/cubit/body_compose_cubit.dart';
import 'package:interval_timer/screens/body/front_body.dart';
import 'package:interval_timer/screens/splash/splash_screen.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.instance.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(BlocProvider(
    create: (context) => BodyComposeCubit(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MusicDataRepository(InternalMusicDataSrc()),
      child: const MaterialApp(home: SplashScreen()),
    );
  }
}
