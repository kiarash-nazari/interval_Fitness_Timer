import 'package:interval_timer/screens/gym_program/domain/entities/beginer_program_entite.dart';

class BeginerProgramModel extends BeginerProgramEntity {
  BeginerProgramModel({
    String? warning,
    String? description,
    String? name,
    String? frequency,
    var rest,
    List<TrainingDay>? days,
  }) : super(
            days: days,
            frequency: frequency,
            name: name,
            rest: rest,
            description: description,
            warning: warning);

  factory BeginerProgramModel.fromJson(Map<String, dynamic> json) {
    var program = json['program'];
    if (program == null) {
      throw Exception('Invalid JSON structure: program is null');
    }

    var daysList = program['days'] as List?;
    if (daysList == null) {
      throw Exception('Invalid JSON structure: days list is null');
    }

    List<TrainingDay> days =
        daysList.map((dayJson) => TrainingDay.fromJson(dayJson)).toList();

    return BeginerProgramModel(
      warning: program['warning'],
      description: program['description'],
      name: program['name'],
      frequency: program['frequency'],
      rest: program['rest'],
      days: days,
    );
  }
}

class TrainingDay {
  var day;
  List<Exercise> exercises;

  TrainingDay({
    required this.day,
    required this.exercises,
  });

  factory TrainingDay.fromJson(Map<String, dynamic> json) {
    var exercisesList = json['exercises'] as List?;
    if (exercisesList == null) {
      throw Exception('Invalid JSON structure: exercises list is null');
    }

    List<Exercise> exercises = exercisesList
        .map((exerciseJson) => Exercise.fromJson(exerciseJson))
        .toList();

    return TrainingDay(
      day: json['day'],
      exercises: exercises,
    );
  }
}

class Exercise {
  var name;
  var maxSets;
  List<SetDetail> sets;

  Exercise({
    required this.name,
    required this.maxSets,
    required this.sets,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    var setsList = json['sets'] as List?;
    if (setsList == null) {
      throw Exception('Invalid JSON structure: sets list is null');
    }

    List<SetDetail> sets =
        setsList.map((setJson) => SetDetail.fromJson(setJson)).toList();

    return Exercise(
      name: json['name'],
      maxSets: json['maxSets'],
      sets: sets,
    );
  }
}

class SetDetail {
  var mySet;
  var reps;

  SetDetail({
    required this.mySet,
    required this.reps,
  });

  factory SetDetail.fromJson(Map<String, dynamic> json) {
    var entry = json.entries.first;
    return SetDetail(
      mySet: entry.key,
      reps: entry.value,
    );
  }
}
