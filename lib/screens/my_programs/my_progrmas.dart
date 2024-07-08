import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/locator.dart';
import 'package:interval_timer/screens/gym_program/interface/cubit/cubit_program_cubit.dart';
import 'package:interval_timer/screens/my_programs/cubit/cubit_my_program_cubit.dart';
import 'package:interval_timer/widgets/gym_program.dart';

class MyPrograms extends StatelessWidget {
  const MyPrograms({super.key});

  @override
  Widget build(BuildContext context) {
    var myProgramCubit = BlocProvider.of<CubitMyProgramCubit>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CubitMyProgramCubit(),
        ),
        BlocProvider(
          create: (context) => locator<CubitProgram>(),
        ),
      ],
      child: Scaffold(
        body: Center(
          child: BlocBuilder<CubitMyProgramCubit, CubitMyProgramState>(
            builder: (context, state) {
              if (state is StartSendProgram) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        myProgramCubit.sendProgramToUi();
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                      ),
                    ),
                    // GymProgram(program: state.program),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
