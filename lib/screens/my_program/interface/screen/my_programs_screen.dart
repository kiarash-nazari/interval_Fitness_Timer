import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';

import 'package:interval_timer/screens/my_program/interface/block/cubit/get_programs_status.dart';
import 'package:interval_timer/screens/my_program/interface/block/cubit/my_programs_cubit.dart';
import 'package:interval_timer/widgets/gym_program.dart';

class MyProgramsScreen extends StatelessWidget {
  const MyProgramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MyProgramsCubit>(context).getPrograms();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
              gradient: LinearGradient(
                colors: AppColors.grBeginnerLevel,
              ),
            ),
          ),
        ),
        body: BlocBuilder<MyProgramsCubit, MyProgramsState>(
          buildWhen: (previous, current) {
            return previous.getProgramsStatus != current.getProgramsStatus;
          },
          builder: (context, state) {
            if (state.getProgramsStatus is GetProgramLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.getProgramsStatus is GetProgramError) {
              GetProgramError getProgramError =
                  state.getProgramsStatus as GetProgramError;
              return Center(
                child: Text(getProgramError.message!),
              );
            }

            if (state.getProgramsStatus is GetProgramComplited) {
              GetProgramComplited getProgramComplited =
                  state.getProgramsStatus as GetProgramComplited;
              List<BeginerProgramEntity> programs =
                  getProgramComplited.myProgramsEntity;

              return ListView.builder(
                itemCount: programs.length,
                itemBuilder: (context, index) {
                  var program = programs[index].name;
                  return ExpansionTile(
                    title: Text(program),
                    children: [
                      Column(
                        children: [GymProgram(program: programs[index])],
                      )
                    ],
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
