enum ExerciseType { squat, deadlift, benchPress }

extension ExerciseTypeExtension on ExerciseType {
  String get name {
    switch (this) {
      case ExerciseType.squat:
        return 'Squat';
      case ExerciseType.deadlift:
        return 'Deadlift';
      case ExerciseType.benchPress:
        return 'Bench Press';
    }
  }
}
