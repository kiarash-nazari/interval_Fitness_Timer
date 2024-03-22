import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/res/colors.dart';
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
      borderColor: AppColors.mainblue,
      blur: .30,
      opacity: 0.17,
      radius: 30,
      bgColor: Colors.black,
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
                    if (_activitiController.text.isEmpty ||
                        _restController.text.isEmpty ||
                        _repsController.text.isEmpty) {
                      Flushbar(
                        icon: Icon(MdiIcons.alert, color: Colors.white),
                        margin: const EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(10),
                        blockBackgroundInteraction: false,
                        forwardAnimationCurve: Curves.easeOutBack,
                        reverseAnimationCurve: Curves.easeOutBack,
                        messageText: const Text(
                          'Please fill all fields',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        duration: const Duration(seconds: 3),
                        backgroundGradient:
                            const LinearGradient(colors: AppColors.grRest),
                      ).show(context);
                    } else {
                      BlocProvider.of<PlayersCubit>(context)
                          .startActiviti("assets/audio/Star.wav");
                      BlocProvider.of<PlayersCubit>(context).startMusicOnline(
                          audioLink:
                              "https://luxafarin.com/wp-content/uploads/2024/02/mix1.mp3");
                      await Future.delayed(const Duration(seconds: 3))
                          .then((value) {
                        BlocProvider.of<TimersCubit>(context).startActiviti(
                            activi: _activitiController.text,
                            rest: _restController.text);
                        BlocProvider.of<TimersCubit>(context)
                            .getLoops(_repsController.text);
                      });
                    }
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
                    await Future.delayed(const Duration(seconds: 3))
                        .then((value) {
                      BlocProvider.of<PlayersCubit>(context).resumeAlert();

                      BlocProvider.of<TimersCubit>(context).startActiviti(
                          activi: _activitiController.text,
                          rest: _restController.text);
                    });
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
                    BlocProvider.of<PlayersCubit>(context).resumeAlert();

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
            onPressed: () {
              _restController.text = "";
              _activitiController.text = "";
              _repsController.text = "";
              BlocProvider.of<TimersCubit>(context).stop();
              BlocProvider.of<PlayersCubit>(context).stopMusic();
            },
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
