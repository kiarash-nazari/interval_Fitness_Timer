import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/data/repo/remix_music_data_rep.dart';
import 'package:interval_timer/data/res/remix_music_data_src.dart';
import 'package:interval_timer/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MusicDataRepository(InternalMusicDataSrc()),
      child: const MaterialApp(home: MainWindow()),
    );
  }
}
