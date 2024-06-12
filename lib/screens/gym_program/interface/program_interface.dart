import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/gym_program/cubit/cubit_program_cubit.dart';

class ProgramInterface extends StatefulWidget {
  const ProgramInterface({super.key});

  @override
  State<ProgramInterface> createState() => _ProgramInterfaceState();
}

class _ProgramInterfaceState extends State<ProgramInterface> {
  bool _isMoved = false;

  void _togglePosition() {
    setState(() {
      _isMoved = !_isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => CubitProgram(),
      child: Scaffold(
        body: Stack(
          children: [
            // Widgets and data behind the animated container
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Data behind the container",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
                // Add more widgets here
              ],
            ),
            BlocBuilder<CubitProgram, CubitProgramState>(
              builder: (context, state) {
                var programCubit = BlocProvider.of<CubitProgram>(context);
                return AnimatedPositioned(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimateLevel(
                          level: "0 - 3 Months in a row",
                          imageAdress: "assets/png/Beginers-levels.png",
                          gradientColor: AppColors.grBeginnerLevel,
                          onTap: _togglePosition,
                        ),
                        AnimateLevel(
                          level: "3 - 6 Months in a row",
                          imageAdress: "assets/png/mid-levels.png",
                          gradientColor: AppColors.grMidLevel,
                          onTap: () {
                            programCubit.togglePosition();
                          },
                        ),
                        AnimateLevel(
                          level: "More than 6 Months in a row",
                          imageAdress: "assets/png/pro-level.png",
                          gradientColor: AppColors.grProLevel,
                          onTap: _togglePosition,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AnimateLevel extends StatelessWidget {
  final String level;
  final String imageAdress;
  final List<Color> gradientColor;
  final VoidCallback onTap;

  const AnimateLevel({
    super.key,
    required this.level,
    required this.imageAdress,
    required this.gradientColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColor),
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
              SizedBox(
                width: size.width * 0.3,
                child: Text(
                  level,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: size.width * 0.3,
                height: size.width * 0.5,
                child: Image.asset(
                  imageAdress,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
