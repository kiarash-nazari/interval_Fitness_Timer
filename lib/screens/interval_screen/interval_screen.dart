import 'package:flutter/material.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/interval_screen/cubit/timers_cubit.dart';
import 'package:interval_timer/utils/downloads/cubit/downloads_cubit.dart';
import 'package:interval_timer/utils/players/cubit/players_cubit.dart';
import 'package:interval_timer/widgets/my_carousel.dart';
import 'package:interval_timer/widgets/my_circular_percent.dart';
import 'package:interval_timer/widgets/my_inputs.dart';
import 'package:interval_timer/widgets/player_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntervalScreen extends StatelessWidget {
  IntervalScreen({super.key});
  final TextEditingController _activitiController = TextEditingController();
  final TextEditingController _restController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgInterval,
        body: SizedBox(
          height: size.height,
          width: double.infinity,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<TimersCubit>(
                create: (context) => TimersCubit(),
              ),
              BlocProvider<PlayersCubit>(create: (context) => PlayersCubit()),
              BlocProvider<DownloadsCubit>(
                  create: (context) => DownloadsCubit()),
            ],
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  50.heightBox,
                  MyCircularPercent(size: size),
                  MyInputs(
                      size: size,
                      repsController: _repsController,
                      activitiController: _activitiController,
                      restController: _restController),
                  PlayerController(
                      size: size,
                      activitiController: _activitiController,
                      restController: _restController,
                      repsController: _repsController),
                  50.heightBox,
                  MyCarousel(size: size)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
