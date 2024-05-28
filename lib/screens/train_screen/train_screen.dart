// import 'package:flutter/material.dart';
// import 'package:interval_timer/res/colors.dart';
// import 'package:interval_timer/widgets/exercises_boxes.dart';

// class TrainScreen extends StatelessWidget {
//   const TrainScreen(
//       {super.key,
//       required this.repsController,
//       required this.activitiController,
//       required this.restController});
//   final TextEditingController repsController;
//   final TextEditingController activitiController;
//   final TextEditingController restController;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.sizeOf(context);

//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: RadialGradient(
//               colors: AppColors.grBackgroundTraining,
//             ),
//           ),
//           height: size.height,
//           width: double.infinity,
//           child: Center(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               padding: const EdgeInsets.all(20),
//               physics: const BouncingScrollPhysics(),
//               child: ExercisesBoxes(
//                   size: size,
//                   repsController: repsController,
//                   activitiController: activitiController,
//                   restController: restController),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
