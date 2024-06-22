import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';
import 'package:interval_timer/screens/gym_program/models/training_program.dart';

part 'cubit_program_state.dart';

class CubitProgram extends Cubit<CubitProgramState> {
  CubitProgram() : super(CubitProgramInitial()) {
    Timer(const Duration(seconds: 1), () {
      emit(CubitProgramInitial());
    });
  }

  bool isMoved = false;
  int retryCount = 0;
  final int maxRetries =
      3; // Limit the number of retries to prevent infinite loops

  Future<void> togglePosition() async {
    try {
      emit(const Loading());
      final completion =
          await OpenAI.instance.chat.create(model: "gpt-3.5-turbo", messages: [
        OpenAIChatCompletionChoiceMessageModel(content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
              "You are a Pro Gym trainer.")
        ], role: OpenAIChatMessageRole.system),
        OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.user,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(
                  """you are a Pro coach.

I need a Gym beginner Program my training experience is 2 weeks in a row.

list of training that you are allowed to use nothing else =>
[
Aerobics and cardio,

Back Squat, Front Squat, Overhead Squat, Bulgarian Split Squat, Jump Squat, Box Squat.
Conventional Deadlift, Romanian Deadlift, Sumo Deadlift, Snatch-Grip Deadlift, Trap Bar Deadlift.
Barbell Bench Press, Incline Bench Press, Decline Bench Press, Close-Grip Bench Press.
Barbell Overhead Press, Dumbbell Overhead Press, Seated Overhead Press, Push.
Overhand Pull-Up, Underhand Pull-Up, Close-Grip Pull-Up.
Barbell Row, Bent-over Row, T-Bar Row, Seated Cable Row, Pendlay Row.
Power Clean, Hang Clean. Snatch: Snatch, Hang Snatch, Power Snatch.
Standard Box Jumps, Lateral Box Jumps, Step-Up Box Jumps.
Medicine Ball Throws Chest Pass, Medicine Ball Overhead Throw, Medicine Ball Side Throws.
Goblet Squat, Front Squat, Back Squat, Bulgarian Split Squat, Jump Squat, Box Squat, Zercher
Squat.
Romanian Deadlift, Trap Bar Deadlift, Sumo Deadlift.
Dumbbell Bench Press, Incline Dumbbell Bench Press, Decline Dumbbell Bench Press
Dumbbell Overhead Press, Arnold Press.
Assisted Pull-Ups, Underhand Pull-Up.
Bent-Over Row, Dumbbell Row, Seated Cable Row.
Leg Press, Leg Extensions, Hamstring Curls, Standing Calf Raises, Glute Bridges.
Dumbbell Flys, Decline Bench Dumbbell Flys, Common Cable Chest Flys, High to Low Cable
Chest Flys, incline_cable_chest_flys
Lateral Raises, Front Raises, Rear Delt Flys
Face Pulls, Lat Pulldowns, Pullover.
Barbell Bicep Curl, Dumbbell Bicep Curl, Hammer Curl, Concentration Curl, Preacher Curl, Cable Drag
Curl.
Overhead Triceps Extension, Cable Pushdowns, Close-Grip Bench Press, Tricep Kickbacks.
Bodyweight Squats, Wall Sit.
Bodyweight Forward Lunges, Bodyweight Backward Lunges, Bodyweight Side Lunges.
Standard Push-Ups, Wall Push-Ups, Incline Push-Ups, Knee Push-Ups.
Assisted Pull-Ups.
Standard Plank, Forearm Plank, Side Plank.
Standard Crunches.
Bent-Over Row.
].

Do not give a program with less exercise and sets.
I wanna write me all 7 days program with rest days nothing less than 7 days.

please give the program as a JSON like this, this JSON is only an example where you can change the number of trainings, sets, names, rest, frequency and ... : =>
{
"program":
{
"description": "warnings and description for beginers and how better to start and use your program", 
"name": "Power Training Program or any suitable names",
"frequency": "... workouts per week",
"rest":" ... minutes between sets",
days: [
{
"day": Day 1: Upper Body & Core, or ...,
exercises: [
{
name: Bench Press,
maxSets: 5,
sets :[

{"set 1": " Reps: 6"},
{"set 2": " Reps: 4"},
{"set 3": " Reps: 3"},
{"set 4": " Reps: 2"},
{"set 5": " Reps: 2"},

]

},
"day": "Day ...: Aerobics and cardio",
"exercises": [
{
"name": "Cardio",
"maxSets": 1,
"set 1": " minute",
},"day": "Day ...: Rest",
"exercises": [
{
"name": "Rest",
"maxSets": ,
"set 1": "",
},
}.

and in this case, you have to very very be careful to don't miss any parameters or don't add any extra parameters, please please in choosing the name if you can double-check to not give me any name different from the names that I provided you in the above exercises list don't miss even one-word letter or space or - or _ or ....
5. At the end and very important, don't write me any extra description, like You're absolutely right! ..., I understood ... or any other description. I want only a pure JSON Nothing else, no confirmation, no descriptions, etc., just a JSON. even don't answer me polite things like thank you and ... .
6. Don't give me a program with less day trainings our less exervises and I want at least 4 exercises each day except cardio and rest days.
""")
            ])
      ]);

      if (completion.choices.isNotEmpty &&
          completion.choices[0].message.content != null) {
        final jsonString = completion.choices[0].message.content![0].text!;
        final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

        if (jsonMap['program'] == null) {
          print(jsonMap);
          throw Exception("Invalid JSON structure: 'program' key is missing");
        }

        print(jsonMap);

        final program = TrainingProgram.fromJson(jsonMap);
        print("Program name: ${program.name}");

        emit(MoveThePosition(isMoved: isMoved));
        emit(TraningResponseFromGpt(program: program));
        isMoved = !isMoved;
        retryCount = 0; // Reset retry count on success
      } else {
        throw Exception("Invalid response from OpenAI API");
      }
    } catch (e) {
      print("Error: $e");
      if (retryCount < maxRetries) {
        retryCount++;
        await Future.delayed(
            Duration(seconds: 2)); // Adding delay between retries
        await togglePosition(); // Retry the request
      } else {
        emit(CubitProgramError(message: e.toString()));
      }
    }
  }
}
