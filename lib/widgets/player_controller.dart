import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/screens/interval_screen/cubit/timers_cubit.dart';
import 'package:interval_timer/utils/players/cubit/players_cubit.dart';
import 'package:interval_timer/widgets/glassmorphism.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlayerController extends StatelessWidget {
  const PlayerController({
    super.key,
    required this.size,
    required TextEditingController activitiController,
    required TextEditingController restController,
    required TextEditingController repsController,
  })  : _activitiController = activitiController,
        _restController = restController,
        _repsController = repsController;

  final Size size;
  final TextEditingController _activitiController;
  final TextEditingController _restController;
  final TextEditingController _repsController;

  @override
  Widget build(BuildContext context) {
    return Glassmorphism(
      blur: .30,
      opacity: 0.17,
      radius: 30,
      child: SizedBox(
        width: size.width / 1.3,
        height: 70,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocConsumer<TimersCubit, TimersState>(
            listener: (BuildContext context, TimersState state) {
              if (state is ThreeSecondsBeforeStop) {
                BlocProvider.of<PlayersCubit>(context)
                    .startActiviti("assets/audio/Stop.m4a");
              }
              if (state is ThreeSecondsBeforeStart) {
                BlocProvider.of<PlayersCubit>(context)
                    .startActiviti("assets/audio/Star.wav");
              }
            },
            builder: (context, state) {
              if (state is EndOfProgressing || state is StartActivitiAudio) {
                return IconButton(
                  onPressed: () async {
                    BlocProvider.of<PlayersCubit>(context)
                        .startActiviti("assets/audio/Star.wav");
                    BlocProvider.of<PlayersCubit>(context).startMusic(
                        audioLink:
                            "https://luxafarin.com/wp-content/uploads/2024/02/mix1.mp3");
                    await Future.delayed(const Duration(seconds: 3));

                    BlocProvider.of<TimersCubit>(context).startActiviti(
                        activi: _activitiController.text,
                        rest: _restController.text);
                    BlocProvider.of<TimersCubit>(context)
                        .getLoops(_repsController.text);
                  },
                  icon: Icon(
                    MdiIcons.play,
                    size: 50,
                    color: Colors.amber,
                  ),
                );
              }
              if (state is PauseInActiviti) {
                return IconButton(
                  onPressed: () async {
                    BlocProvider.of<PlayersCubit>(context)
                        .startActiviti("assets/audio/Star.wav");
                    BlocProvider.of<PlayersCubit>(context).resumeMusic();
                    await Future.delayed(const Duration(seconds: 3));

                    BlocProvider.of<TimersCubit>(context).startActiviti(
                        activi: _activitiController.text,
                        rest: _restController.text);
                  },
                  icon: Icon(
                    MdiIcons.play,
                    size: 50,
                    color: Colors.amber,
                  ),
                );
              }
              if (state is PauseInRest) {
                return IconButton(
                  onPressed: () async {
                    BlocProvider.of<PlayersCubit>(context).resumeMusic();

                    BlocProvider.of<TimersCubit>(context).startRest(
                        activi: _activitiController.text,
                        rest: _restController.text);
                  },
                  icon: Icon(
                    MdiIcons.play,
                    size: 50,
                    color: Colors.amber,
                  ),
                );
              }
              return IconButton(
                onPressed: () {
                  BlocProvider.of<TimersCubit>(context).pause();
                  BlocProvider.of<PlayersCubit>(context).pauseMusic();
                },
                icon: Icon(
                  MdiIcons.pause,
                  size: 50,
                  color: Colors.amber,
                ),
              );
            },
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              MdiIcons.stop,
              size: 50,
              color: Colors.amber,
            ),
          ),
        ]),
      ),
    );
  }
}
