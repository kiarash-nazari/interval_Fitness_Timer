import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/interval_screen/cubit/timers_cubit.dart';
import 'package:interval_timer/utils/players/cubit/players_cubit.dart';
import 'package:interval_timer/widgets/glassmorphism.dart';
import 'package:interval_timer/widgets/inputs.dart';
import 'package:interval_timer/widgets/my_circular_percent_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
              BlocProvider<PlayersCubit>(create: (context) => PlayersCubit())
            ],
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  50.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BlocConsumer<TimersCubit, TimersState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          if (state is StartOfActiviti) {
                            return MyCircularPercentIndicator(
                                size: size,
                                gradient: AppColors.grActiviti,
                                percent: state.calculatedActiviti,
                                count: state.centerDigit);
                          } else {
                            return MyCircularPercentIndicator(
                                size: size,
                                gradient: AppColors.grActiviti,
                                percent: 0,
                                count: 0);
                          }
                        },
                      ),
                      BlocBuilder<TimersCubit, TimersState>(
                        builder: (context, state) {
                          if (state is StartOfRest) {
                            return MyCircularPercentIndicator(
                                size: size,
                                gradient: AppColors.grRest,
                                percent: state.calculatedRest,
                                count: state.centerDigit);
                          }
                          return MyCircularPercentIndicator(
                              size: size,
                              gradient: AppColors.grRest,
                              percent: 0,
                              count: 0);
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Inputs(
                        size: size,
                        radius: 30,
                        focusedBorderColor: AppColors.mainblue,
                        lableTextColor: AppColors.mainblue,
                        prefixIconColor: AppColors.mainblue,
                        helperText: "How many reps",
                        lableText: "-> Loop",
                        suffixText: "rep",
                        hintText: "loop",
                        textColor: AppColors.mainblue,
                        icon: MdiIcons.autorenew,
                        controller: _repsController,
                      ),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Inputs(
                            size: size,
                            radius: 5,
                            focusedBorderColor: AppColors.mainRed,
                            lableTextColor: AppColors.mainRed,
                            prefixIconColor: AppColors.mainRed,
                            helperText: "Activiti in second",
                            lableText: "Activiti",
                            suffixText: "sec",
                            hintText: "activiti",
                            textColor: AppColors.mainRed,
                            icon: MdiIcons.fire,
                            controller: _activitiController,
                          ),
                          Inputs(
                            size: size,
                            radius: 5,
                            focusedBorderColor: AppColors.mainblue,
                            lableTextColor: AppColors.mainblue,
                            prefixIconColor: AppColors.mainblue,
                            helperText: "Rest in second",
                            lableText: "Rest",
                            suffixText: "sec",
                            hintText: "rest",
                            textColor: AppColors.mainblue,
                            icon: MdiIcons.weatherWindy,
                            controller: _restController,
                          ),
                        ],
                      )
                    ],
                  ),
                  Glassmorphism(
                    blur: .30,
                    opacity: 0.17,
                    radius: 30,
                    child: SizedBox(
                      width: size.width / 1.3,
                      height: 70,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocBuilder<TimersCubit, TimersState>(
                              builder: (context, state) {
                                if (state is EndOfProgressing ||
                                    state is StartActivitiAudio) {
                                  return IconButton(
                                    onPressed: () async {
                                      BlocProvider.of<PlayersCubit>(context)
                                          .startActiviti(
                                              "assets/audio/Star.wav");
                                      await Future.delayed(
                                          const Duration(seconds: 3));

                                      BlocProvider.of<TimersCubit>(context)
                                          .startActiviti(
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
                                return IconButton(
                                  onPressed: () {
                                    BlocProvider.of<TimersCubit>(context)
                                        .pause();
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
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 185.0,
                      viewportFraction: 0.6,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.4,
                    ),
                    items: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            image: DecorationImage(
                              image: AssetImage("assets/img/ki.jpg"),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(127, 188, 186, 186),
                                blurRadius: 30.0, // soften the shadow
                                spreadRadius: 5.0, //extend the shadow
                                offset: Offset(
                                  10.0, // Move to right 10  horizontally
                                  25.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          child: Stack(
                            children: [
                              CircularPercentIndicator(
                                  linearGradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF3366FF),
                                        Color(0xFF00CCFF),
                                      ],
                                      begin: FractionalOffset(0.0, 0.0),
                                      end: FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                  radius: size.width / 15,
                                  backgroundColor: Colors.grey.shade700,
                                  lineWidth: 5,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  percent: 0.1,
                                  center: const Icon(
                                    Icons.download,
                                    color: Colors.amber,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
