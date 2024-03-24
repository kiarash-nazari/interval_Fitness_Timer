import 'package:flutter/material.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/interval_screen/cubit/timers_cubit.dart';
import 'package:interval_timer/utils/players/cubit/players_cubit.dart';
import 'package:interval_timer/widgets/my_carousel.dart';
import 'package:interval_timer/widgets/my_circular_percent.dart';
import 'package:interval_timer/widgets/my_inputs.dart';
import 'package:interval_timer/widgets/player_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntervalScreen extends StatelessWidget {
  const IntervalScreen(
      {super.key,
      required this.repsController,
      required this.activitiController,
      required this.restController});

  final TextEditingController repsController;
  final TextEditingController activitiController;
  final TextEditingController restController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgInterval,
        body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [
            Colors.black,
            Colors.black,
            Color.fromARGB(198, 0, 204, 255),
            Color.fromARGB(187, 218, 30, 5),
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.black,
          ])),
          height: size.height,
          width: double.infinity,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<TimersCubit>(
                create: (context) => TimersCubit(),
              ),
              BlocProvider<PlayersCubit>(create: (context) => PlayersCubit()),
            ],
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  24.heightBox,
                  MyCircularPercent(size: size),
                  24.heightBox,
                  MyInputs(
                      size: size,
                      repsController: repsController,
                      activitiController: activitiController,
                      restController: restController),
                  8.heightBox,
                  PlayerController(
                      size: size,
                      activitiController: activitiController,
                      restController: restController,
                      repsController: repsController),
                  32.heightBox,
                  MyCarousel(size: size),
                  75.heightBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
