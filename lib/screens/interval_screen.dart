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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                options: CarouselOptions(),
                items: [
                  Container(
                    width: size.width / 2,
                    color: AppColors.mainblue,
                    child: Text("data"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
