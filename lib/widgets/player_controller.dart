import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/interval_screen/cubit/timers_cubit.dart';
import 'package:interval_timer/utils/players/cubit/players_cubit.dart';
import 'package:interval_timer/widgets/glassmorphism.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:slide_to_act/slide_to_act.dart';

class PlayerController extends StatefulWidget {
  const PlayerController({
    Key? key,
    required this.size,
    required TextEditingController activitiController,
    required TextEditingController restController,
    required TextEditingController repsController,
  })  : _activitiController = activitiController,
        _restController = restController,
        _repsController = repsController,
        super(key: key);

  final Size size;
  final TextEditingController _activitiController;
  final TextEditingController _restController;
  final TextEditingController _repsController;

  @override
  PlayerControllerState createState() => PlayerControllerState();
}

class PlayerControllerState extends State<PlayerController> {
  bool _isLongPressed = false;
  double _progress = 0.0;
  late Timer _longPressTimer = Timer(Duration.zero, () {});
  late Timer? _stopTimer = Timer(Duration.zero, () {});
  bool oneTimePress = true;
  bool slideActive = false;

  void startLongPressTimerPauseMusic() {
    _longPressTimer = Timer(const Duration(milliseconds: 1000), () {
      if (_isLongPressed) {
        BlocProvider.of<TimersCubit>(context).pause();
        BlocProvider.of<PlayersCubit>(context).pauseMusic();
        oneTimePress = true;
        setState(() {
          _isLongPressed = false;
          _progress = 0.0;
        });
      }
    });
  }

  void startLongPressTimerStop() {
    _stopTimer = Timer(const Duration(milliseconds: 1000), () {
      widget._restController.text = "";
      widget._activitiController.text = "";
      widget._repsController.text = "";
      BlocProvider.of<TimersCubit>(context).stop();
      BlocProvider.of<PlayersCubit>(context).stopMusic();
      setState(() {
        _isLongPressed = false;
        _progress = 0.0;
      });
    });
  }

  void stopLongPressTimer() {
    if (_stopTimer!.isActive) {
      _stopTimer?.cancel();
    }
    if (_longPressTimer.isActive) {
      _longPressTimer.cancel();
    }
  }

  @override
  void dispose() {
    stopLongPressTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Glassmorphism(
      borderColor: AppColors.mainblue,
      blur: 0.30,
      opacity: 0.17,
      radius: 30,
      bgColor: Colors.black,
      child: SizedBox(
        width: widget.size.width / 1.3,
        height: 70,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: decelerateEasing,
              width: _isLongPressed ? widget.size.width / 1.5 : 0,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.amber, width: 2),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocConsumer<TimersCubit, TimersState>(
                  listener: (BuildContext context, TimersState state) {
                    if (state is ThreeSecondsBeforeStop) {
                      BlocProvider.of<PlayersCubit>(context)
                          .startActivity("assets/audio/Stop.m4a");
                    }
                    if (state is ThreeSecondsBeforeStart) {
                      BlocProvider.of<PlayersCubit>(context)
                          .startActivity("assets/audio/Star.wav");
                    }
                  },
                  builder: (context, state) {
                    if (state is EndOfProgressing ||
                        state is StartActivitiAudio) {
                      return IconButton(
                        onPressed: () async {
                          if (widget._activitiController.text.isEmpty ||
                              widget._restController.text.isEmpty ||
                              widget._repsController.text.isEmpty) {
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
                              backgroundGradient: const LinearGradient(
                                  colors: AppColors.grRest),
                            ).show(context);
                          } else {
                            if (oneTimePress) {
                              oneTimePress = false;
                              setState(() {
                                slideActive = true;
                              });

                              BlocProvider.of<PlayersCubit>(context)
                                  .startActivity("assets/audio/Star.wav");

                              await Future.delayed(const Duration(seconds: 3))
                                  .then((value) {
                                BlocProvider.of<TimersCubit>(context)
                                    .startActiviti(
                                        activi: widget._activitiController.text,
                                        rest: widget._restController.text);
                                BlocProvider.of<TimersCubit>(context)
                                    .getLoops(widget._repsController.text);
                              });
                            }
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
                          setState(() {
                            slideActive = !slideActive;
                          });

                          BlocProvider.of<PlayersCubit>(context)
                              .startActivity("assets/audio/Star.wav");
                          BlocProvider.of<PlayersCubit>(context)
                              .resumeMusic("mix1");
                          await Future.delayed(const Duration(seconds: 3))
                              .then((value) {
                            BlocProvider.of<PlayersCubit>(context)
                                .resumeAlert();

                            BlocProvider.of<TimersCubit>(context).startActiviti(
                                activi: widget._activitiController.text,
                                rest: widget._restController.text);
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
                          setState(() {
                            slideActive = !slideActive;
                          });

                          BlocProvider.of<PlayersCubit>(context)
                              .resumeMusic("mix1");
                          BlocProvider.of<PlayersCubit>(context).resumeAlert();

                          BlocProvider.of<TimersCubit>(context).startRest(
                              activi: widget._activitiController.text,
                              rest: widget._restController.text);
                        },
                        icon: Icon(
                          MdiIcons.play,
                          size: 50,
                          color: Colors.amber,
                        ),
                      );
                    }
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(9),
                          topRight: Radius.circular(50)),
                      child: GestureDetector(
                        onPanDown: (s) {
                          setState(() {
                            _isLongPressed = true;
                            Future.delayed(const Duration(milliseconds: 100))
                                .then((value) {
                              setState(() {
                                _isLongPressed = false;
                                _progress = 0.0;
                              });
                            });
                          });
                        },
                        onLongPressStart: (_) {
                          setState(() {
                            _isLongPressed = true;
                          });

                          startLongPressTimerPauseMusic();
                        },
                        onLongPressCancel: () {
                          setState(() {
                            _isLongPressed = false;
                            _progress = 0.0;
                          });
                          stopLongPressTimer();
                        },
                        onLongPressEnd: (_) {
                          setState(() {
                            _isLongPressed = false;
                            _progress = 0.0;
                          });
                          stopLongPressTimer();
                        },
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            MdiIcons.pause,
                            size: 50,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(9),
                      topRight: Radius.circular(50)),
                  child: GestureDetector(
                    onPanDown: (s) {
                      setState(() {
                        _isLongPressed = true;
                        Future.delayed(const Duration(milliseconds: 100))
                            .then((value) {
                          setState(() {
                            _isLongPressed = false;
                            _progress = 0.0;
                          });
                        });
                      });
                    },
                    onLongPressCancel: () {
                      setState(() {
                        _isLongPressed = false;
                        _progress = 0.0;
                      });
                      stopLongPressTimer();
                    },
                    onLongPressStart: (details) {
                      setState(() {
                        _isLongPressed = true;
                      });

                      startLongPressTimerStop();
                    },
                    onLongPressEnd: (details) {
                      setState(() {
                        _isLongPressed = false;
                        _progress = 0.0;
                      });
                      stopLongPressTimer();
                    },
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        MdiIcons.stop,
                        size: 50,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
                visible: !slideActive,
                child: Positioned(
                  right: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amberAccent.shade400,
                        borderRadius: BorderRadius.circular(30)),
                    child: IconButton(
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            slideActive = !slideActive;
                          });
                        },
                        icon: Icon(MdiIcons.chevronTripleLeft)),
                  ),
                )),
            Visibility(
              visible: slideActive,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 4, 5, 4),
                child: SlideAction(
                  sliderButtonIcon: Icon(MdiIcons.chevronTripleRight),
                  innerColor: Colors.amberAccent.shade400,
                  outerColor: AppColors.mainblue.withOpacity(.6),
                  elevation: 0,
                  text: "     Slide to unlock",
                  textColor: Colors.black,
                  animationDuration: Duration.zero,
                  borderRadius: 31,
                  onSubmit: () {
                    setState(() {
                      slideActive = !slideActive;
                    });
                    return;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
