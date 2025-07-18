import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/locator.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/res/prompts.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';
import 'package:interval_timer/screens/gym_program/interface/cubit/beginer_program_status.dart';
import 'package:interval_timer/screens/gym_program/interface/cubit/cubit_program_cubit.dart';
import 'package:interval_timer/screens/gym_program/interface/widgets/my_steper.dart';
import 'package:interval_timer/screens/register/interface/widgets/register_button.dart';
import 'package:interval_timer/widgets/gym_program.dart';

class ProgramInterface extends StatefulWidget {
  const ProgramInterface({super.key});

  @override
  State<ProgramInterface> createState() => _ProgramInterfaceState();
}

class _ProgramInterfaceState extends State<ProgramInterface> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bodyFatController = TextEditingController();
  final TextEditingController _healthIssueController = TextEditingController();
  bool _isMoved = false;
  int currentStep = 0;

  // final ChatGPTService _chatGPTService = ChatGPTService();
  // String _response = '';

  // void _sendMessage() async {
  //   final message = _controller.text;
  //   if (message.isEmpty) return;

  //   try {
  //     final response = await _chatGPTService.sendMessage(message);
  //     setState(() {
  //       _response = json.encode(response);
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _response = 'Error: $e';
  //     });
  //   }
  // }

  void _togglePosition() {
    setState(() {
      _isMoved = !_isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        children: [
          // Widgets and data behind the animated container
          Center(
            child: BlocBuilder<CubitProgram, CubitProgramState>(
              builder: (context, state) {
                if (state.beginerProgramStatus is BeginerProgramComplited) {
                  final BeginerProgramComplited beginerProgramComplited =
                      state.beginerProgramStatus as BeginerProgramComplited;
                  final BeginerProgramEntity beginerProgramEntity =
                      beginerProgramComplited.beginerProgramEntity;
                  return GymProgram(program: beginerProgramEntity);
                }
                return Container(
                  height: 400,
                  width: 400,
                  color: Colors.red,
                );
              },
            ),
          ),
          BlocConsumer<CubitProgram, CubitProgramState>(
            listener: (context, state) {},
            builder: (context, state) {
              var programCubit = BlocProvider.of<CubitProgram>(context);
              return Stack(children: [
                AnimatedPositioned(
                  top: BlocProvider.of<CubitProgram>(context).isMoved
                      ? -size.height
                      : 0,
                  left: 0,
                  right: 0,
                  bottom: BlocProvider.of<CubitProgram>(context).isMoved
                      ? size.height
                      : 0,
                  duration: const Duration(
                      milliseconds: 500), // Adjust the duration as needed
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // AnimateLevel(
                            //   level: "0 - 3 Months in a row",
                            //   imageAdress: "assets/png/diet.png",
                            //   gradientColor: AppColors.grBeginnerLevel,
                            //   onTap: () {
                            //     // programCubit.loadBeginer(
                            //     //     prompt: Prompts.beginer);
                            //     showDialog(
                            //       context: context,
                            //       builder: (context) {
                            //         return const SingleChildScrollView(
                            //           child: MyOwnSteper(),
                            //         );
                            //       },
                            //     );
                            //   },
                            // ),

                            AnimateLevel(
                                level: "Get a GYM plan",
                                imgWidget: Image.asset(
                                  height: size.height / 3,
                                  width: size.width / 2.5,
                                  "assets/png/pro-level.png",
                                ),
                                gradientColor: AppColors.grProLevel,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const SingleChildScrollView(
                                        child: MyOwnSteper(),
                                      );
                                    },
                                  );
                                }),
                            AnimateLevel(
                              level: "Get a Diet plan",
                              imgWidget: SizedBox(
                                height: size.height / 3, // Increase height
                                width: size.width / 2.5,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 60, 0, 60),
                                  child: SvgPicture.asset(
                                    "assets/png/diet.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              gradientColor: AppColors.grMidLevel,
                              onTap: () {
                                _togglePosition();
                              },
                            ),
                          ],
                        ),
                        48.heightBox,
                        RegisterButton(
                            buttontext: "My Programs",
                            onTap: () {
                              Navigator.pushNamed(context, "/myProgramsScreen");
                            }),
                      ],
                    ),
                  ),
                ),
                if (state.beginerProgramStatus is BeginerProgramLoading)
                  const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: AppColors.mainblue,
                  )),
              ]);
            },
          ),
        ],
      ),
    );
  }
}

class AnimateLevel extends StatefulWidget {
  final String level;
  final List<Color> gradientColor;
  final VoidCallback onTap;
  final Widget imgWidget;

  const AnimateLevel({
    super.key,
    required this.imgWidget,
    required this.level,
    required this.gradientColor,
    required this.onTap,
  });

  @override
  AnimateLevelState createState() => AnimateLevelState();
}

class AnimateLevelState extends State<AnimateLevel> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    widget.onTap();
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        transform: Matrix4.translationValues(0, _isPressed ? 10 : 0, 0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: widget.gradientColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.01),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.heightBox,
                SizedBox(
                  width: size.width * 0.3,
                  child: Text(
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    widget.level,
                    textAlign: TextAlign.center,
                  ),
                ),
                widget.imgWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}





// var ss = 


// I'm going to send a prompt like this how can I handle the data and use json

// """

// you are a Pro coach.
// I'll give you a list of exercises with their weight and reps. and I want you calculate their BRU 1RM and give me back a program for increase my power not 
// for hypertrophy.

// Squats: Back Squat, Front Squat, Overhead Squat, Bulgarian Split Squat, Jump Squat, Box Squat.
// Deadlifts: Conventional Deadlift, Romanian Deadlift, Sumo Deadlift, Snatch-Grip Deadlift, Trap Bar Deadlift.
// Bench Press: Barbell Bench Press, Incline Bench Press, Decline Bench Press, Close-Grip Bench Press.
// Overhead Press: Barbell Overhead Press, Dumbbell Overhead Press, Seated Overhead Press, Push Press.
// Pull-Ups: Overhand Pull-Up, Underhand Pull-Up, Close-Grip Pull-Up.
// Rows: Barbell Row, Bent-over Row, T-Bar Row, Seated Cable Row, Pendlay Row.

// Explosive Movements:

// Power Cleans: Power Clean, Hang Clean.
// Snatch: Snatch , Hang Snatch, Power Snatch.
// Box Jumps: Standard Box Jumps, Lateral Box Jumps, Step-Up Box Jumps.
// Medicine Ball Throws: Medicine Ball Throws Chest Pass,Medicine Ball Overhead Throw,Medicine Ball Side Throws.


// Compound Exercises:
// Squats: Goblet Squat, Front Squat, Back Squat, Bulgarian Split Squat, Jump Squat, Box Squat, Zercher Squat.
// Deadlifts: Romanian Deadlift, Trap Bar Deadlift, Sumo Deadlift.
// Bench Press: Dumbbell Bench Press, Incline Dumbbell Bench Press, Decline Dumbbell Bench Press.
// Overhead Press: Dumbbell Overhead Press, Arnold Press,
// Pull-Ups: Assisted Pull-Ups, Underhand Pull-Up.
// Rows: Bent-Over Row, Dumbbell Row, Seated Cable Row.

// Isolation Exercises:

// Legs: Leg Press, Leg Extensions, Hamstring Curls,Standing Calf Raises, Glute Bridges.
// Chest: Dumbbell Flys,Decline Bench Dumbbell Flys, Common Cable Chest Flys, High to Low Cable Chest Flys, incline_cable_chest_flys.
// Shoulders: Lateral Raises, Front Raises, Rear Delt Flys.
// Back: Face Pulls, Lat Pulldowns, Pullover.
// Biceps: Barbell Bicep Curl, Dumbbell Bicep Curl, Hammer Curl, Concentration Curl, Preacher Curl, Cable Drag Curl.
// Triceps: Overhead Triceps Extension, Cable Pushdowns, Close-Grip Bench Press, Tricep Kickbacks.
// Beginner Exercises:

// Bodyweight Exercises:

// Squats: Bodyweight Squats, Wall Sit.
// Lunges:Bodyweight Forward Lunges, Bodyweight Backward Lunges, Bodyweight Side Lunges.
// Push-Ups: Standard Push-Ups, Wall Push-Ups, Incline Push-Ups, Knee Push-Ups.
// Pull-Ups: Assisted Pull-Ups.
// Plank: Standard Plank, Forearm Plank,Side Plank.
// Crunches: Standard Crunches.

// Exercises:

// Dumbbell Rows: Bent-Over Row,.
// ].

// 2. I know Brzycki formula is estimated and not accurate so don't mention it.
// 3. Do not give a program with less exercise and sets.


// 4. please give the program as a json like this: =>

// {
//   "program": {
//     "name": "Power Training Program",
//     "frequency": "3 workouts per week",
//     "rest": "2-3 minutes between sets",
//     "days": [
//       {
//         "day": "Day 1: Upper Body & Core",
//         "exercises": [
//           {
//             "name": "Bench Press",
//             "sets": 5,
//             "reps": 5,
//             "weight": 107
//           },
// 	.
// 	.
// 	.

// }

// and in this case you have to very very be careful to don't miss any parameters or don't add any extra parameters, and please please in choosing the name if you ccan do double check to don't give me any name different with the names that I provide you at the above exercises list don't miss even one word letter.

// 5. At the end and very important,

// 	don't write me any extra description, like "You're absolutely right! ... ,I understood ... or any else description.
// 	I want only a pure json Nothing else, no confirmation no descriptions or etc. jus a json.
// 	even don't answer me polite things like thank you and ... .
// thank you dear coach.



// """










//  " you are a Pro coach. I'll give you a list of exercises with their weight and reps. and I want you calculate their BRU 1RM and give me back a program for increase my power not for hypertrophy. Squats: Back Squat, Front Squat, Overhead Squat, Bulgarian Split Squat, Jump Squat, Box Squat. Deadlifts: Conventional Deadlift, Romanian Deadlift, Sumo Deadlift, Snatch-Grip Deadlift, Trap Bar Deadlift. Bench Press: Barbell Bench Press, Incline Bench Press, Decline Bench Press, Close-Grip Bench Press. Overhead Press: Barbell Overhead Press, Dumbbell Overhead Press, Seated Overhead Press, Push Press. Pull-Ups: Overhand Pull-Up, Underhand Pull-Up, Close-Grip Pull-Up. Rows: Barbell Row, Bent-over Row, T-Bar Row, Seated Cable Row, Pendlay Row. Explosive Movements: Power Cleans: Power Clean, Hang Clean. Snatch: Snatch , Hang Snatch, Power Snatch. Box Jumps: Standard Box Jumps, Lateral Box Jumps, Step-Up Box Jumps. Medicine Ball Throws: Medicine Ball Throws Chest Pass,Medicine Ball Overhead Throw,Medicine Ball Side Throws. Compound Exercises: Squats: Goblet Squat, Front Squat, Back Squat, Bulgarian Split Squat, Jump Squat, Box Squat, Zercher Squat. Deadlifts: Romanian Deadlift, Trap Bar Deadlift, Sumo Deadlift. Bench Press: Dumbbell Bench Press, Incline Dumbbell Bench Press, Decline Dumbbell Bench Press. Overhead Press: Dumbbell Overhead Press, Arnold Press, Pull-Ups: Assisted Pull-Ups, Underhand Pull-Up. Rows: Bent-Over Row, Dumbbell Row, Seated Cable Row. Isolation Exercises: Legs: Leg Press, Leg Extensions, Hamstring Curls,Standing Calf Raises, Glute Bridges. Chest: Dumbbell Flys,Decline Bench Dumbbell Flys, Common Cable Chest Flys, High to Low Cable Chest Flys, incline_cable_chest_flys. Shoulders: Lateral Raises, Front Raises, Rear Delt Flys. Back: Face Pulls, Lat Pulldowns, Pullover. Biceps: Barbell Bicep Curl, Dumbbell Bicep Curl, Hammer Curl, Concentration Curl, Preacher Curl, Cable Drag Curl. Triceps: Overhead Triceps Extension, Cable Pushdowns, Close-Grip Bench Press, Tricep Kickbacks. Beginner Exercises: Bodyweight Exercises: Squats: Bodyweight Squats, Wall Sit. Lunges:Bodyweight Forward Lunges, Bodyweight Backward Lunges, Bodyweight Side Lunges. Push-Ups: Standard Push-Ups, Wall Push-Ups, Incline Push-Ups, Knee Push-Ups. Pull-Ups: Assisted Pull-Ups. Plank: Standard Plank, Forearm Plank,Side Plank. Crunches: Standard Crunches. Exercises: Dumbbell Rows: Bent-Over Row,. ]. 2. I know Brzycki formula is estimated and not accurate so don't mention it. 3. Do not give a program with less exercise and sets. 4. please give the program as a json like this: => { program: { name: Power Training Program, frequency: 3 workouts per week, rest: 2-3 minutes between sets, days: [ { day: Day 1: Upper Body & Core,exercises: [ { name: Bench Press, sets: 5, reps: 5, weight: 107 }, } and in this case you have to very very be careful to don't miss any parameters or don't add any extra parameters, and please please in choosing the name if you ccan do double check to don't give me any name different with the names that I provide you at the above exercises list don't miss even one word letter. 5. At the end and very important, don't write me any extra description, like You're absolutely right! ... ,I understood ... or any else description. I want only a pure json Nothing else, no confirmation no descriptions or etc. jus a json. even don't answer me polite things like thank you and ... . thank you dear coach."




// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:interval_timer/components/extentions.dart';
// import 'package:interval_timer/locator.dart';
// import 'package:interval_timer/res/colors.dart';
// import 'package:interval_timer/res/prompts.dart';
// import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';
// import 'package:interval_timer/screens/gym_program/interface/cubit/beginer_program_status.dart';
// import 'package:interval_timer/screens/gym_program/interface/cubit/cubit_program_cubit.dart';
// import 'package:interval_timer/screens/gym_program/interface/widgets/my_steper.dart';
// import 'package:interval_timer/screens/register/interface/widgets/register_button.dart';
// import 'package:interval_timer/widgets/gym_program.dart';

// class ProgramInterface extends StatefulWidget {
//   const ProgramInterface({super.key});

//   @override
//   State<ProgramInterface> createState() => _ProgramInterfaceState();
// }

// class _ProgramInterfaceState extends State<ProgramInterface> {
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _heightController = TextEditingController();
//   final TextEditingController _weightController = TextEditingController();
//   final TextEditingController _bodyFatController = TextEditingController();
//   final TextEditingController _healthIssueController = TextEditingController();
//   bool _isMoved = false;
//   int currentStep = 0;

// import 'package:google_generative_ai/google_generative_ai.dart';

//   final apiKey = "AIzaSyAay3OVcaxOQTffeOrP1NYInNKaZdDe0TU";
//   String _response = '';

//   void _sendMessage() async {
//     final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//     final prompt = Prompts.beginer;
//     final content = [Content.text(prompt)];
//     final response = await model.generateContent(content);
//     setState(() {
//       _response = response.text;
//     });
//   }

  // void _togglePosition() {
//     setState(() {
//       _isMoved = !_isMoved;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.sizeOf(context);

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Widgets and data behind the animated container
//           Center(
//             child: BlocBuilder<CubitProgram, CubitProgramState>(
//               builder: (context, state) {
//                 if (state.beginerProgramStatus is BeginerProgramComplited) {
//                   final BeginerProgramComplited beginerProgramComplited =
//                       state.beginerProgramStatus as BeginerProgramComplited;
//                   final BeginerProgramEntity beginerProgramEntity =
//                       beginerProgramComplited.beginerProgramEntity;
//                   return GymProgram(program: beginerProgramEntity);
//                 }
//                 return Container(
//                   height: 400,
//                   width: 400,
//                   color: Colors.red,
//                 );
//               },
//             ),
//           ),
//           BlocConsumer<CubitProgram, CubitProgramState>(
//             listener: (context, state) {},
//             builder: (context, state) {
//               var programCubit = BlocProvider.of<CubitProgram>(context);
//               return Stack(children: [
//                 AnimatedPositioned(
//                   top: BlocProvider.of<CubitProgram>(context).isMoved
//                       ? -size.height
//                       : 0,
//                   left: 0,
//                   right: 0,
//                   bottom: BlocProvider.of<CubitProgram>(context).isMoved
//                       ? size.height
//                       : 0,
//                   duration: const Duration(
//                       milliseconds: 500), // Adjust the duration as needed
//                   child: Container(
//                     width: double.infinity,
//                     height: double.infinity,
//                     color: Colors.white,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             // AnimateLevel(
//                             //   level: "0 - 3 Months in a row",
//                             //   imageAdress: "assets/png/diet.png",
//                             //   gradientColor: AppColors.grBeginnerLevel,
//                             //   onTap: () {
//                             //     // programCubit.loadBeginer(
//                             //     //     prompt: Prompts.beginer);
//                             _sendMessage();
//                             //     showDialog(
//                             //       context: context,
//                             //       builder: (context) {
//                             //         return const SingleChildScrollView(
//                             //           child: MyOwnSteper(),
//                             //         );
//                             //       },
//                             //     );
//                             //   },
//                             // ),

//                             AnimateLevel(
//                                 level: "Get a GYM plan",
//                                 imgWidget: Image.asset(
//                                   height: size.height / 3,
//                                   width: size.width / 2.5,
//                                   "assets/png/pro-level.png",
//                                 ),
//                                 gradientColor: AppColors.grProLevel,
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                       return const SingleChildScrollView(
//                                         child: MyOwnSteper(),
//                                       );
//                                     },
//                                   );
//                                 }),
//                             AnimateLevel(
//                               level: "Get a Diet plan",
//                               imgWidget: SizedBox(
//                                 height: size.height / 3, // Increase height
//                                 width: size.width / 2.5,
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.fromLTRB(0, 60, 0, 60),
//                                   child: SvgPicture.asset(
//                                     "assets/png/diet.svg",
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                               gradientColor: AppColors.grMidLevel,
//                               onTap: () {
//                                 _togglePosition();
//                               },
//                             ),
//                           ],
//                         ),
//                         48.heightBox,
//                         RegisterButton(
//                             buttontext: "My Programs",
//                             onTap: () {
//                               Navigator.pushNamed(context, "/myProgramsScreen");
//                             }),
//                       ],
//                     ),
//                   ),
//                 ),
//                 if (state.beginerProgramStatus is BeginerProgramLoading)
//                   const Center(
//                       child: CircularProgressIndicator(
//                     backgroundColor: AppColors.mainblue,
//                   )),
//               ]);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimateLevel extends StatefulWidget {
//   final String level;
//   final List<Color> gradientColor;
//   final VoidCallback onTap;
//   final Widget imgWidget;

//   const AnimateLevel({
//     super.key,
//     required this.imgWidget,
//     required this.level,
//     required this.gradientColor,
//     required this.onTap,
//   });

//   @override
//   AnimateLevelState createState() => AnimateLevelState();
// }

// class AnimateLevelState extends State<AnimateLevel> {
//   bool _isPressed = false;

//   void _handleTapDown(TapDownDetails details) {
//     setState(() {
//       _isPressed = true;
//     });
//   }

//   void _handleTapUp(TapUpDetails details) {
//     setState(() {
//       _isPressed = false;
//     });
//     widget.onTap();
//   }

//   void _handleTapCancel() {
//     setState(() {
//       _isPressed = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTapDown: _handleTapDown,
//       onTapUp: _handleTapUp,
//       onTapCancel: _handleTapCancel,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 50),
//         transform: Matrix4.translationValues(0, _isPressed ? 10 : 0, 0),
//         child: DecoratedBox(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: widget.gradientColor),
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.3),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: const Offset(0, 10),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(size.width * 0.01),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 10.heightBox,
//                 SizedBox(
//                   width: size.width * 0.3,
//                   child: Text(
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                     widget.level,
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 widget.imgWidget,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }





// var ss = 


// I'm going to send a prompt like this how can I handle the data and use json

// """

// you are a Pro coach.
// I'll give you a list of exercises with their weight and reps. and I want you calculate their BRU 1RM and give me back a program for increase my power not 
// for hypertrophy.

// Squats: Back Squat, Front Squat, Overhead Squat, Bulgarian Split Squat, Jump Squat, Box Squat.
// Deadlifts: Conventional Deadlift, Romanian Deadlift, Sumo Deadlift, Snatch-Grip Deadlift, Trap Bar Deadlift.
// Bench Press: Barbell Bench Press, Incline Bench Press, Decline Bench Press, Close-Grip Bench Press.
// Overhead Press: Barbell Overhead Press, Dumbbell Overhead Press, Seated Overhead Press, Push Press.
// Pull-Ups: Overhand Pull-Up, Underhand Pull-Up, Close-Grip Pull-Up.
// Rows: Barbell Row, Bent-over Row, T-Bar Row, Seated Cable Row, Pendlay Row.

// Explosive Movements:

// Power Cleans: Power Clean, Hang Clean.
// Snatch: Snatch , Hang Snatch, Power Snatch.
// Box Jumps: Standard Box Jumps, Lateral Box Jumps, Step-Up Box Jumps.
// Medicine Ball Throws: Medicine Ball Throws Chest Pass,Medicine Ball Overhead Throw,Medicine Ball Side Throws.


// Compound Exercises:
// Squats: Goblet Squat, Front Squat, Back Squat, Bulgarian Split Squat, Jump Squat, Box Squat, Zercher Squat.
// Deadlifts: Romanian Deadlift, Trap Bar Deadlift, Sumo Deadlift.
// Bench Press: Dumbbell Bench Press, Incline Dumbbell Bench Press, Decline Dumbbell Bench Press.
// Overhead Press: Dumbbell Overhead Press, Arnold Press,
// Pull-Ups: Assisted Pull-Ups, Underhand Pull-Up.
// Rows: Bent-Over Row, Dumbbell Row, Seated Cable Row.

// Isolation Exercises:

// Legs: Leg Press, Leg Extensions, Hamstring Curls,Standing Calf Raises, Glute Bridges.
// Chest: Dumbbell Flys,Decline Bench Dumbbell Flys, Common Cable Chest Flys, High to Low Cable Chest Flys, incline_cable_chest_flys.
// Shoulders: Lateral Raises, Front Raises, Rear Delt Flys.
// Back: Face Pulls, Lat Pulldowns, Pullover.
// Biceps: Barbell Bicep Curl, Dumbbell Bicep Curl, Hammer Curl, Concentration Curl, Preacher Curl, Cable Drag Curl.
// Triceps: Overhead Triceps Extension, Cable Pushdowns, Close-Grip Bench Press, Tricep Kickbacks.
// Beginner Exercises:

// Bodyweight Exercises:

// Squats: Bodyweight Squats, Wall Sit.
// Lunges:Bodyweight Forward Lunges, Bodyweight Backward Lunges, Bodyweight Side Lunges.
// Push-Ups: Standard Push-Ups, Wall Push-Ups, Incline Push-Ups, Knee Push-Ups.
// Pull-Ups: Assisted Pull-Ups.
// Plank: Standard Plank, Forearm Plank,Side Plank.
// Crunches: Standard Crunches.

// Exercises:

// Dumbbell Rows: Bent-Over Row,.
// ].

// 2. I know Brzycki formula is estimated and not accurate so don't mention it.
// 3. Do not give a program with less exercise and sets.


// 4. please give the program as a json like this: =>

// {
//   "program": {
//     "name": "Power Training Program",
//     "frequency": "3 workouts per week",
//     "rest": "2-3 minutes between sets",
//     "days": [
//       {
//         "day": "Day 1: Upper Body & Core",
//         "exercises": [
//           {
//             "name": "Bench Press",
//             "sets": 5,
//             "reps": 5,
//             "weight": 107
//           },
// 	.
// 	.
// 	.

// }

// and in this case you have to very very be careful to don't miss any parameters or don't add any extra parameters, and please please in choosing the name if you ccan do double check to don't give me any name different with the names that I provide you at the above exercises list don't miss even one word letter.

// 5. At the end and very important,

// 	don't write me any extra description, like "You're absolutely right! ... ,I understood ... or any else description.
// 	I want only a pure json Nothing else, no confirmation no descriptions or etc. jus a json.
// 	even don't answer me polite things like thank you and ... .
// thank you dear coach.
// """










//  " you are a Pro coach. I'll give you a list of exercises with their weight and reps. and I want you calculate their BRU 1RM and give me back a program for increase my power not for hypertrophy. Squats: Back Squat, Front Squat, Overhead Squat, Bulgarian Split Squat, Jump Squat, Box Squat. Deadlifts: Conventional Deadlift, Romanian Deadlift, Sumo Deadlift, Snatch-Grip Deadlift, Trap Bar Deadlift. Bench Press: Barbell Bench Press, Incline Bench Press, Decline Bench Press, Close-Grip Bench Press. Overhead Press: Barbell Overhead Press, Dumbbell Overhead Press, Seated Overhead Press, Push Press. Pull-Ups: Overhand Pull-Up, Underhand Pull-Up, Close-Grip Pull-Up. Rows: Barbell Row, Bent-over Row, T-Bar Row, Seated Cable Row, Pendlay Row. Explosive Movements: Power Cleans: Power Clean, Hang Clean. Snatch: Snatch , Hang Snatch, Power Snatch. Box Jumps: Standard Box Jumps, Lateral Box Jumps, Step-Up Box Jumps. Medicine Ball Throws: Medicine Ball Throws Chest Pass,Medicine Ball Overhead Throw,Medicine Ball Side Throws. Compound Exercises: Squats: Goblet Squat, Front Squat, Back Squat, Bulgarian Split Squat, Jump Squat, Box Squat, Zercher Squat. Deadlifts: Romanian Deadlift, Trap Bar Deadlift, Sumo Deadlift. Bench Press: Dumbbell Bench Press, Incline Dumbbell Bench Press, Decline Dumbbell Bench Press. Overhead Press: Dumbbell Overhead Press, Arnold Press, Pull-Ups: Assisted Pull-Ups, Underhand Pull-Up. Rows: Bent-Over Row, Dumbbell Row, Seated Cable Row. Isolation Exercises: Legs: Leg Press, Leg Extensions, Hamstring Curls,Standing Calf Raises, Glute Bridges. Chest: Dumbbell Flys,Decline Bench Dumbbell Flys, Common Cable Chest Flys, High to Low Cable Chest Flys, incline_cable_chest_flys. Shoulders: Lateral Raises, Front Raises, Rear Delt Flys. Back: Face Pulls, Lat Pulldowns, Pullover. Biceps: Barbell Bicep Curl, Dumbbell Bicep Curl, Hammer Curl, Concentration Curl, Preacher Curl, Cable Drag Curl. Triceps: Overhead Triceps Extension, Cable Pushdowns, Close-Grip Bench Press, Tricep Kickbacks. Beginner Exercises: Bodyweight Exercises: Squats: Bodyweight Squats, Wall Sit. Lunges:Bodyweight Forward Lunges, Bodyweight Backward Lunges, Bodyweight Side Lunges. Push-Ups: Standard Push-Ups, Wall Push-Ups, Incline Push-Ups, Knee Push-Ups. Pull-Ups: Assisted Pull-Ups. Plank: Standard Plank, Forearm Plank,Side Plank. Crunches: Standard Crunches. Exercises: Dumbbell Rows: Bent-Over Row,. ]. 2. I know Brzycki formula is estimated and not accurate so don't mention it. 3. Do not give a program with less exercise and sets. 4. please give the program as a json like this: => { program: { name: Power Training Program, frequency: 3 workouts per week, rest: 2-3 minutes between sets, days: [ { day: Day 1: Upper Body & Core,exercises: [ { name: Bench Press, sets: 5, reps: 5, weight: 107 }, } and in this case you have to very very be careful to don't miss any parameters or don't add any extra parameters, and please please in choosing the name if you ccan do double check to don't give me any name different with the names that I provide you at the above exercises list don't miss even one word letter. 5. At the end and very important, don't write me any extra description, like You're absolutely right! ... ,I understood ... or any else description. I want only a pure json Nothing else, no confirmation no descriptions or etc. jus a json. even don't answer me polite things like thank you and ... . thank you dear coach."
