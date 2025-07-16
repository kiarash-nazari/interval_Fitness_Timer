import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/components/extentions.dart';
import 'package:interval_timer/res/prompts.dart';
import 'package:interval_timer/screens/gym_program/interface/cubit/cubit_program_cubit.dart';
import 'package:interval_timer/screens/register/interface/widgets/register_button.dart';

class MyOwnSteper extends StatefulWidget {
  const MyOwnSteper({super.key});

  @override
  MyOwnSteperState createState() => MyOwnSteperState();
}

class MyOwnSteperState extends State<MyOwnSteper> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _bodyFatController = TextEditingController();
  final TextEditingController _healthIssueController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  int currentStep = 0;
  String? selectedGoal; // To store the selected goal

  final FocusNode _weightFocusNode = FocusNode();
  final FocusNode _heightFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final FocusNode _dayFocusNode = FocusNode();
  final FocusNode _bodyFatFocusNode = FocusNode();
  final FocusNode _healthIssueFocusNode = FocusNode();
  final FocusNode _experienceFocusNode = FocusNode();

  @override
  void dispose() {
    _weightFocusNode.dispose();
    _heightFocusNode.dispose();
    _ageFocusNode.dispose();
    _dayFocusNode.dispose();
    _healthIssueFocusNode.dispose();
    _bodyFatFocusNode.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  void _focusPreviousField() {
    switch (currentStep) {
      case 0:
        FocusScope.of(context).requestFocus(_ageFocusNode);
        break;
      case 1:
        FocusScope.of(context).requestFocus(_dayFocusNode);
        break;
      case 2:
        FocusScope.of(context).requestFocus(_weightFocusNode);
        break;
      case 3:
        FocusScope.of(context).requestFocus(_heightFocusNode);
        break;
      case 4:
        FocusScope.of(context).requestFocus(_bodyFatFocusNode);
        break;
      case 5:
        FocusScope.of(context).unfocus();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var programCubit = BlocProvider.of<CubitProgram>(context);
    return Dialog(
        child: Center(
      child: Column(
        children: [
          Stepper(
            currentStep: currentStep,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                children: <Widget>[
                  TextButton(
                    onPressed: nextStep,
                    child: const Text('Continue'),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (currentStep > 0) {
                        setState(() {
                          currentStep--;
                        });
                        await Future.delayed(const Duration(milliseconds: 5));
                        _focusPreviousField();
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
                title: const Text("Your age"),
                content: TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                      label: const Text("""
          
          required"""),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      suffixText: "Years Old"),
                  keyboardType: TextInputType.number,
                  focusNode: _ageFocusNode,
                  autofocus: currentStep == 0,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    nextStep();
                  },
                ),
              ),
              Step(
                isActive: currentStep == 1,
                title: const Text("Your Goal"),
                content: DropdownButtonFormField<String>(
                  value: selectedGoal,
                  decoration: InputDecoration(
                    label: const Text("Select your goal"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    isDense: true, // Make the decoration more compact
                  ),
                  items: [
                    "Lose weight",
                    "Gain muscle & weight",
                    "Lose fat & gain muscle"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      enabled: true,
                      value: value,
                      child: Text(
                        value,
                        overflow: TextOverflow.fade, // Fade out the text
                        softWrap: false,
                        maxLines: 1,
                        textScaler: TextScaler.linear(.8),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedGoal = newValue;
                    });
                  },
                  focusNode: _dayFocusNode,
                  autofocus: currentStep == 1,
                  onSaved: (newValue) {
                    nextStep();
                  },
                ),
              ),
              Step(
                isActive: currentStep == 2,
                title: const Text("How many days training per week"),
                content: TextFormField(
                  controller: _dayController,
                  decoration: InputDecoration(
                      label: const Text("""
          
          required"""),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      suffixText: "Days a week"),
                  keyboardType: TextInputType.number,
                  focusNode: _dayFocusNode,
                  autofocus: currentStep == 2,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    nextStep();
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(RegExp(r'^[1-6]$')),
                  ],
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'This field is required';
                  //   } else if (int.tryParse(value) == null ||
                  //       int.parse(value) < 1 ||
                  //       int.parse(value) > 6) {
                  //     return 'Please enter a number between 1 and 6';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              Step(
                isActive: currentStep == 3,
                title: const Text("Your weight"),
                content: TextField(
                  controller: _weightController,
                  decoration: InputDecoration(
                    label: const Text("""
          
          required"""),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    suffixText: "Kg",
                  ),
                  keyboardType: TextInputType.number,
                  focusNode: _weightFocusNode,
                  autofocus: currentStep == 3,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    nextStep();
                  },
                ),
              ),
              Step(
                isActive: currentStep == 4,
                title: const Text("Your height"),
                content: TextField(
                  controller: _heightController,
                  decoration: InputDecoration(
                      label: const Text("""
          
          required"""),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      suffixText: "Centimeter"),
                  keyboardType: TextInputType.number,
                  focusNode: _heightFocusNode,
                  autofocus: currentStep == 4,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    nextStep();
                  },
                ),
              ),
              Step(
                isActive: currentStep == 5,
                title: const Text("Health issue"),
                content: TextField(
                  controller: _healthIssueController,
                  decoration: InputDecoration(
                    label: const Text("""
          
          required"""),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  focusNode: _healthIssueFocusNode,
                  autofocus: currentStep == 5,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) {
                    nextStep();
                  },
                ),
              ),
              Step(
                isActive: currentStep == 6,
                title: const Text("Your body fat"),
                content: TextField(
                  controller: _bodyFatController,
                  decoration: InputDecoration(
                    suffixText: "Percent %",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onSubmitted: (_) {
                    nextStep();
                  },
                  keyboardType: TextInputType.number,
                  focusNode: _bodyFatFocusNode,
                  autofocus: currentStep == 6,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Step(
                isActive: currentStep == 7,
                title: const Text("Your current experince in row"),
                content: TextField(
                  controller: _experienceController,
                  decoration: InputDecoration(
                    suffixText: "month",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  keyboardType: TextInputType.number,
                  focusNode: _experienceFocusNode,
                  autofocus: currentStep == 7,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Step(
                isActive: currentStep == 8,
                title: const Text("Your experience at all"),
                content: TextField(
                  controller: _experienceController,
                  decoration: InputDecoration(
                    suffixText: "month",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  keyboardType: TextInputType.number,
                  focusNode: _experienceFocusNode,
                  autofocus: currentStep == 8,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ],
            onStepTapped: (int step) {
              setState(() {
                currentStep = step;
                switch (currentStep) {
                  case 0:
                    FocusScope.of(context).requestFocus(_dayFocusNode);
                    break;
                  case 1:
                    FocusScope.of(context).requestFocus(_weightFocusNode);
                    break;
                  case 2:
                    FocusScope.of(context).requestFocus(_heightFocusNode);
                    break;
                  case 3:
                    FocusScope.of(context).requestFocus(_ageFocusNode);
                    break;
                  case 4:
                    FocusScope.of(context).requestFocus(_healthIssueFocusNode);
                    break;
                  case 5:
                    FocusScope.of(context).requestFocus(_bodyFatFocusNode);
                    break;
                  case 6:
                    FocusScope.of(context).requestFocus(_experienceFocusNode);
                    break;
                }
              });
            },
          ),
          24.heightBox,
          RegisterButton(
              buttontext: "Get The Plan",
              onTap: () {
                programCubit.loadBeginer(
                    prompt: Prompts().beginer(
                        age: _ageController.text,
                        bodyFat: _bodyFatController.text,
                        height: _heightController.text,
                        issue: _healthIssueController.text,
                        experience: _experienceController.text));
                Navigator.pop(context);
              })
        ],
      ),
    ));
  }

  void nextStep() {
    if (currentStep < 6) {
      setState(() {
        currentStep++;
        print("NNNNNNNNNNNext$currentStep");
        // _focusNextField();
      });
    }
  }
}
