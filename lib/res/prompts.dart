class Prompts {
  String beginer(
      {experience = "I don't know",
      age = "I don't know",
      issue = "no health issue",
      height = "I don't know",
      bodyFat = "I don't know"}) {
    return """you are a Pro coach.

I need a Pro Gym Program.

about me:
[
my experience: $experience
my age: $age 
My height:$height
Health issue:$issue
Body Fat in percentage:$bodyFat
]

list of training that you are allowed to use nothing else =>

[
Aerobics and cardio,

Back Squat, Front Squat, Overhead Squat, Bulgarian Split Squat, Jump Squat, Box Squat.
Conventional Deadlift, Romanian Deadlift, Sumo Deadlift, Snatch-Grip Deadlift, Trap Bar Deadlift.
Barbell Bench Press, Incline Bench Press, Decline Bench Press, Close-Grip Bench Press.
Barbell Overhead Press, Dumbbell Overhead Press, Seated Overhead Press, Push Press.
Overhand Pull-Up, Underhand Pull-Up, Close-Grip Pull-Up.
Barbell Row, Bent-over Row, T-Bar Row, Seated Cable Row, Pendlay Row.
Snatch: Snatch, Hang Snatch.
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
in description write a very good description why did you choose this system for me why did you order the exercises like this? what is the goal and purpose?...

please give the program as a JSON like this, this JSON is only an example where you can change the number of trainings, sets, names, rest, frequency and ... : =>
{
  "program": {
  "description": "A description of the program why did you choose this system for me why did you order the exercises like this? what is the goal and purpose?", 
  "warning":"Caution and Warnings",
  "name": "Power Training Program or any suitable names",
  "frequency": "... workouts per week",
  "rest":" ... minutes between sets",
    "days": [
      {
        "day": "Day 1: Upper Body & Core, or ...,",
        "exercises": [
          {
            "name": "...",
            "maxSets": 3,
            "sets": [
              {"set1": "10"},
              {"set2": "8"},
              {"set3": "6"}
            ]
          },
          {
            "name": "Barbell Bench Press",
            "maxSets": 5,
            "sets": [
              {"set1": "10"},
              {"set2": "8"},
              {"set3": "6"}
              {"set3": "6"}
              {"set3": "6"}
            ]
          }
        ]
      },
      {
        "day": "Day 2: Cardio & Core, or ...,",
        "exercises": [
          {
            "name": "Aerobics And Cardio",
            "maxSets": 1,
            "sets": [
              {"set1": "20 min"},
            ]
          },
          {
            "name": "Bodyweight Forward Lunges",
            "maxSets": 5,
            "sets": [
              {"set1": "12"},
              {"set2": "10"},
              {"set3": "8"}
              {"set3": "8"}
              {"set3": "6"}
            ]
          },
          {
            "name": "Forearm Plank",
            "maxSets": 3,
            "sets": [
              {"set1": "40 seconds"},
              {"set2": "40 seconds"},
              {"set3": "40 seconds"}
            ]
          }
        ]
      },
      {
        "day": "...",
        "exercises": [
          {
            "name": "Deadlift",
            "maxSets": 3,
            "sets": [
              {"set1": "10"},
              {"set2": "8"},
              {"set3": "6"}
            ]
          },
          {
            "name": "Dumbbell Row",
            "maxSets": 3,
            "sets": [
              {"set1": "10"},
              {"set2": "8"},
              {"set3": "6"}
            ]
          }
        ]
      }
    ]
  }
}

and in this case, you have to very very be careful to don't miss any parameters or don't add any extra parameters, please please in choosing the name if you can double-check to not give me any name different from the names that I provided you in the above exercises list don't miss even one-word letter or space or - or _ or ....
5. At the end and very important, don't write me any extra description, like You're absolutely right! ..., I understood ... or any other description. I want only a pure JSON Nothing else, no confirmation, no descriptions, etc., just a JSON. even don't answer me polite things like thank you and ... .
6. Don't give me a program with less day trainings our less exervises and I want at least 4 exercises each day except cardio and rest days.
Remember again give me the exact name of the same exercises name in the list don't cut for example in "Standard Plank" don't cut the Standard word or don't add any word be cause one time you cuted Conventional Deadlift to Deadlift, don't cut Barbell or even Dumbbell like some times you give me name: Overhead Press don't do this because when you cut Barbell or Dumbbell or Seated I can't find it give the all name like: Dumbbell Overhead Press .
""";
  }
}

// Power Clean, Hang Clean.