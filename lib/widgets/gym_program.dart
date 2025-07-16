import 'package:flutter/material.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/res/gifs_url.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';

class GymProgram extends StatelessWidget {
  final BeginerProgramEntity program;

  const GymProgram({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(12.0),
                color: AppColors.mainblue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    program.description ?? "",
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: List.generate(program.days?.length ?? 0, (dayIndex) {
                  var day = program.days![dayIndex];
                  return Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                day.day,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              children: day.exercises.map((exercise) {
                                return ExpansionTile(
                                  onExpansionChanged: (value) {
                                    print(GifsUrl.gifs[
                                            exercise.name.toLowerCase()] ??
                                        "");
                                    print(GifsUrl.gifs.length);
                                    print(exercise.name.toLowerCase());
                                  },
                                  title: Text(exercise.name),
                                  subtitle:
                                      Text('Max Sets: ${exercise.maxSets}'),
                                  children: [
                                    Image.network(
                                      GifsUrl.gifs[
                                              exercise.name.toLowerCase()] ??
                                          "",
                                    ),
                                    Column(
                                      children: exercise.sets.map((setDetail) {
                                        return ListTile(
                                          title: Text(setDetail.mySet),
                                          subtitle:
                                              Text('Reps: ${setDetail.reps}'),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      // if (program.days?.length == dayIndex + 1)
                      //   const SizedBox(
                      //     height: 100,
                      //   )
                      // else
                      //   const SizedBox(),
                    ],
                  );
                }),
              ),
              Card(
                // margin: const EdgeInsets.all(8.0),
                color: AppColors.mainRed,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    program.warning ?? "",
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              100.heightBox
            ],
          ),
        ),
        // Positioned(
        //   bottom: 80,
        //   left: 8,
        //   right: 8,
        //   child: Container(
        //     height: 50,
        //     decoration: BoxDecoration(
        //       gradient: const LinearGradient(
        //         colors: AppColors.grBeginnerLevel,
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight,
        //       ),
        //       borderRadius: BorderRadius.circular(10.0),
        //     ),
        //     child: TextButton.icon(
        //       style: ButtonStyle(
        //         shape: WidgetStateProperty.all(
        //           RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(10.0),
        //           ),
        //         ),
        //         overlayColor: WidgetStateColor.resolveWith(
        //           (states) => AppColors.mainblue,
        //         ),
        //       ),
        //       onPressed: () {
        //         Navigator.pushNamed(context, "/myProgramsScreen");
        //       },
        //       icon: const Icon(
        //         Icons.arrow_forward_ios,
        //         color: Colors.black,
        //       ),
        //       label: const Text(
        //         "Save and Continue",
        //         style: TextStyle(color: Colors.black),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
