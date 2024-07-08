import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/res/gifs_url.dart';
import 'package:interval_timer/screens/gym_program/data/models/beginer_program_model.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';
import 'package:interval_timer/screens/gym_program/interface/cubit/cubit_program_cubit.dart';
import 'package:interval_timer/screens/gym_program/models/training_program.dart';
import 'package:interval_timer/screens/my_programs/cubit/cubit_my_program_cubit.dart';

class GymProgram extends StatelessWidget {
  final BeginerProgramEntity program;

  const GymProgram({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    var programCubit = BlocProvider.of<CubitProgram>(context);
    var myProgramCubit = BlocProvider.of<CubitMyProgramCubit>(context);

    return Stack(children: [
      ListView.builder(
        itemCount: program.days?.length,
        itemBuilder: (context, index) {
          var day = program.days![index];
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
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: day.exercises.length,
                      itemBuilder: (context, exerciseIndex) {
                        var exercise = day.exercises[exerciseIndex];
                        return ExpansionTile(
                            onExpansionChanged: (value) {
                              print(GifsUrl.gifs[exercise.name] ?? "");
                              print(exercise.name);
                            },
                            title: Text(exercise.name),
                            subtitle: Text('Max Sets: ${exercise.maxSets}'),
                            children: [
                              Image.network(GifsUrl.gifs[exercise.name] ?? ""),
                              Column(
                                children: exercise.sets.map((setDetail) {
                                  return ListTile(
                                    title: Text(setDetail.mySet),
                                    subtitle: Text('Reps: ${setDetail.reps}'),
                                  );
                                }).toList(),
                              )
                            ]);
                      },
                    ),
                  ],
                ),
              ),
              program.days?.length == index + 1
                  ? const SizedBox(
                      height: 100,
                    )
                  : const SizedBox()
            ],
          );
        },
      ),
      Positioned(
          bottom: 40,
          left: 8,
          right: 8,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors
                    .grBeginnerLevel, // Replace with your desired colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextButton.icon(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                overlayColor: WidgetStateColor.resolveWith(
                  (states) => AppColors.mainblue,
                ),
              ),
              onPressed: () {
                // programCubit.saveBeginer();
                // myProgramCubit.sendProgramToUi();
                Navigator.pushNamed(context, "/myProgrmaScreen");
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              label: const Text(
                "Save and Continue",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ))
    ]);
  }
}
