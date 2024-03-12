import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/screens/interval_screen/interval_screen.dart';
import 'package:interval_timer/screens/main_screen/cubit/main_cubit.dart';
import 'package:interval_timer/screens/train_screen/train_screen.dart';
import 'package:interval_timer/screens/vip_screen/vip_screen.dart';
import 'package:interval_timer/widgets/glassmorphism.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainWindow extends StatelessWidget {
  MainWindow({super.key});
  final TextEditingController _activitiController = TextEditingController();
  final TextEditingController _restController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int indexOfStack = 0;
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: BlocProvider(
      create: (context) => MainCubit(),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: BlocConsumer<MainCubit, MainState>(
              listener: (context, state) {
                if (state is NavIndex) {}
              },
              builder: (context, state) {
                return IndexedStack(
                  index: state is NavIndex ? state.index : 0,
                  children: [
                    IntervalScreen(
                      repsController: _repsController,
                      activitiController: _activitiController,
                      restController: _restController,
                    ),
                    TrainScreen(
                      repsController: _repsController,
                      activitiController: _activitiController,
                      restController: _restController,
                    ),
                    const VipScreen()
                  ],
                );
              },
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                height: size.height * 0.1,
                child: Glassmorphism(
                    borderColor: Colors.white.withOpacity(.2),
                    blur: 0.3,
                    opacity: 0.17,
                    radius: 0,
                    bgColor: Colors.white,
                    child: BlocBuilder<MainCubit, MainState>(
                      builder: (context, state) {
                        if (state is NavIndex) {
                          indexOfStack = state.index;
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    padding: const EdgeInsets.all(15),
                                    onPressed: () {
                                      BlocProvider.of<MainCubit>(context)
                                          .changeIndex(0);
                                    },
                                    icon: Icon(MdiIcons.runFast),
                                    color: indexOfStack == 0
                                        ? AppColors.mainblue
                                        : Colors.white,
                                  ),
                                  IconButton(
                                    padding: const EdgeInsets.all(15),
                                    onPressed: () {
                                      BlocProvider.of<MainCubit>(context)
                                          .changeIndex(1);
                                    },
                                    icon: Icon(MdiIcons.dumbbell),
                                    color: indexOfStack == 1
                                        ? AppColors.mainRed
                                        : Colors.white.withAlpha(70),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      BlocProvider.of<MainCubit>(context)
                                          .changeIndex(2);
                                    },
                                    highlightColor: Colors.amber,
                                    child: Container(
                                        width: 40,
                                        // height: 30,
                                        decoration: BoxDecoration(
                                          color: indexOfStack == 2
                                              ? Colors.amber
                                              : Colors.amber.withOpacity(.5),
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  left: Radius.circular(50)),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              12, 20, 0, 20),
                                          child: Text("""VIP"""),
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    )),
              ))
        ],
      ),
    ));
  }
}
