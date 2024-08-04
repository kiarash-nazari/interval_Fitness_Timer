// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/screens/gym_program/interface/cubit/beginer_program_status.dart';
import 'package:interval_timer/screens/gym_program/interface/cubit/cubit_program_cubit.dart';

// Assuming your Cubit and State are already defined

class MyOwnSteper extends StatefulWidget {
  const MyOwnSteper({super.key});

  @override
  MyOwnSteperState createState() => MyOwnSteperState();
}

class MyOwnSteperState extends State<MyOwnSteper> {
  int currentStep = 0;

  final FocusNode _weightFocusNode = FocusNode();
  final FocusNode _heightFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final FocusNode _bodyFatFocusNode = FocusNode();

  @override
  void dispose() {
    _weightFocusNode.dispose();
    _heightFocusNode.dispose();
    _ageFocusNode.dispose();
    _bodyFatFocusNode.dispose();
    super.dispose();
  }

  void _focusNextField() {
    switch (currentStep) {
      case 0:
        FocusScope.of(context).requestFocus(_heightFocusNode);
        break;
      case 1:
        FocusScope.of(context).requestFocus(_ageFocusNode);
        break;
      case 2:
        FocusScope.of(context).requestFocus(_bodyFatFocusNode);
        break;
      case 3:
        FocusScope.of(context).unfocus();
        break;
    }
  }

  void _focusPreviousField() {
    switch (currentStep) {
      case 1:
        FocusScope.of(context).requestFocus(_weightFocusNode);
        break;
      case 2:
        FocusScope.of(context).requestFocus(_heightFocusNode);
        break;
      case 3:
        FocusScope.of(context).requestFocus(_ageFocusNode);
        break;
      case 0:
        FocusScope.of(context).unfocus();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<CubitProgram, CubitProgramState>(
        builder: (context, state) {
          if (state.beginerProgramStatus is MySteper) {
            final MySteper mySteper = state.beginerProgramStatus as MySteper;
            currentStep = mySteper.currentStep;
          }

          return Center(
            child: Stepper(
              type: StepperType.vertical,
              currentStep: currentStep,
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Row(
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        if (currentStep < 3) {
                          setState(() {
                            currentStep++;
                            _focusNextField();
                          });
                        }
                      },
                      child: const Text('Continue'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentStep > 0) {
                          setState(() {
                            currentStep--;
                            _focusPreviousField();
                          });
                        }
                      },
                      child: const Text('Back'),
                    ),
                  ],
                );
              },
              steps: [
                Step(
                  isActive: currentStep == 0,
                  title: const Text("Your weight"),
                  content: TextField(
                    focusNode: _weightFocusNode,
                    autofocus: currentStep == 0,
                  ),
                ),
                Step(
                  isActive: currentStep == 1,
                  title: const Text("Your height"),
                  content: TextField(
                    focusNode: _heightFocusNode,
                    autofocus: currentStep == 1,
                  ),
                ),
                Step(
                  isActive: currentStep == 2,
                  title: const Text("Your age"),
                  content: TextField(
                    focusNode: _ageFocusNode,
                    autofocus: currentStep == 2,
                  ),
                ),
                Step(
                  isActive: currentStep == 3,
                  title: const Text("Your body fat"),
                  content: TextField(
                    focusNode: _bodyFatFocusNode,
                    autofocus: currentStep == 3,
                  ),
                ),
              ],
              onStepTapped: (int step) {
                setState(() {
                  currentStep = step;
                  switch (currentStep) {
                    case 0:
                      FocusScope.of(context).requestFocus(_weightFocusNode);
                      break;
                    case 1:
                      FocusScope.of(context).requestFocus(_heightFocusNode);
                      break;
                    case 2:
                      FocusScope.of(context).requestFocus(_ageFocusNode);
                      break;
                    case 3:
                      FocusScope.of(context).requestFocus(_bodyFatFocusNode);
                      break;
                  }
                });
              },
              onStepContinue: () {
                if (currentStep < 3) {
                  setState(() {
                    currentStep++;
                    _focusNextField();
                  });
                }
              },
              onStepCancel: () {
                if (currentStep > 0) {
                  setState(() {
                    currentStep--;
                    _focusPreviousField();
                  });
                }
              },
            ),
          );
        },
      ),
    );
  }
}



// Dialog(
//                                       child: BlocBuilder<CubitProgram,
//                                           CubitProgramState>(
//                                         builder: (context, state) {
//                                           if (state.beginerProgramStatus
//                                               is MySteper) {
//                                             final MySteper mySteper =
//                                                 state.beginerProgramStatus
//                                                     as MySteper;
//                                             currentStep = mySteper.currentStep;
//                                           }
//                                           return Center(
//                                             child: Stepper(
//                                               controlsBuilder:
//                                                   (context, details) {
//                                                 return Row(
//                                                   children: <Widget>[
//                                                     TextButton(
//                                                       onPressed: () {
//                                                         if (currentStep != 3) {
//                                                           programCubit.steper(
//                                                               currentStep + 1);
//                                                         }
//                                                       },
//                                                       child: const Text(
//                                                           'Continue'),
//                                                     ),
//                                                     TextButton(
//                                                       onPressed: () {
//                                                         if (currentStep != 0) {
//                                                           programCubit.steper(
//                                                               currentStep - 1);
//                                                         }
//                                                       },
//                                                       child: const Text('Back'),
//                                                     ),
//                                                   ],
//                                                 );
//                                               },
//                                               steps: [
//                                                 Step(
//                                                   isActive: currentStep == 0,
//                                                   title:
//                                                       const Text("Your weight"),
//                                                   content: TextField(
//                                                       autofocus: true,
//                                                       textInputAction:
//                                                           TextInputAction.next,
//                                                       onSubmitted: (_) {
//                                                         programCubit.steper(
//                                                             currentStep + 1);
                                                    
//                                                       }),
//                                                 ),
//                                                 Step(
//                                                   isActive: currentStep == 1,
//                                                   title:
//                                                       const Text("Your height"),
//                                                   content: TextField(
                                             
//                                                     autofocus: true,
//                                                   ),
//                                                 ),
//                                                 Step(
//                                                   isActive: currentStep == 2,
//                                                   title: const Text("Your age"),
//                                                   content: const TextField(
//                                                       autofocus: true),
//                                                 ),
//                                                 Step(
//                                                   isActive: currentStep == 3,
//                                                   title: const Text(
//                                                       "Your body fat"),
//                                                   content: const TextField(
//                                                       autofocus: true),
//                                                 ),
//                                               ],
//                                               onStepTapped: (int newStep) {
//                                                 programCubit.steper(newStep);
//                                               },
//                                               currentStep: currentStep,
//                                               onStepContinue: () {},
//                                               onStepCancel: () {},
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     );