import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/res/input_decoration.dart';
import 'package:interval_timer/widgets/glassmorphism.dart';
import 'package:interval_timer/widgets/inputs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class IntervalScreen extends StatelessWidget {
  const IntervalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgInterval,
        body: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              50.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularPercentIndicator(radius: 80),
                  CircularPercentIndicator(radius: 80)
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
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            MdiIcons.play,
                            size: 50,
                            color: Colors.amber,
                          ),
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
    );
  }
}
