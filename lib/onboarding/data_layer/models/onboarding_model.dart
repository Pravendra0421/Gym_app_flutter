import 'dart:ffi';

class OnboardingModel{
  String? gender;
  int? age;
  double? height;
  double?currentWeight;
  String? bmiStatus;
  String? goal;
  String? bodyType;
  double? targetWeight;
  String? dreamBodyShape;
  List<String>? focusOn;
  String? workoutExperiance;
  String? fitness;
  String? self_assessed_activity;
  bool? knee;
  String?  squat_reps;
  String? pushups_reps;
  String? crunches_reps;
  String? plank_reps;
  String? walk_daily;
  List<String>? badHabit;
  String? lifeStyle;
  OnboardingModel({
    this.gender,
    this.age,
    this.height,
    this.currentWeight,
    this.bmiStatus,
    this.goal,
    this.bodyType,
    this.targetWeight,
    this.dreamBodyShape,
    this.focusOn,
    this.workoutExperiance,
    this.fitness,
    this.self_assessed_activity,
    this.knee,
    this.squat_reps,
    this.pushups_reps,
    this.crunches_reps,
    this.plank_reps,
    this.walk_daily,
    this.badHabit,
    this.lifeStyle
  });
}