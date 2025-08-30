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
  String? idealWeight;
  String? sleepTime;
  String? GetupTime;
  String? wakeupTime;
  String? feelStressed;
  List<String>? motivate;
  List<String>? workOutPlace;
  String? excludeloud;
  String?eventcomingup;
  String?eventTime;
  String?commitTime;
  int? LengthWorkout;
  String? profileName;
  String? planPace;
  List<String>? trainingDays;
  bool? remainders;
  String? hearAbout;

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
    this.lifeStyle,
    this.idealWeight,
    this.sleepTime,
    this.GetupTime,
    this.wakeupTime,
    this.feelStressed,
    this.motivate,
    this.workOutPlace,
    this.excludeloud,
    this.eventcomingup,
    this.eventTime,
    this.commitTime,
    this.LengthWorkout,
    this.profileName,
    this.planPace,
    this.trainingDays,
    this.remainders,
    this.hearAbout,
  });
  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'age': age,
      'height': height,
      'currentWeight': currentWeight,
      'bmiStatus': bmiStatus,
      'goal': goal,
      'bodyType': bodyType,
      'targetWeight': targetWeight,
      'dreamBodyShape': dreamBodyShape,
      'focusOn': focusOn,
      'workoutExperiance': workoutExperiance,
      'fitness': fitness,
      'self_assessed_activity': self_assessed_activity,
      'knee': knee,
      'squat_reps': squat_reps,
      'pushups_reps': pushups_reps,
      'crunches_reps': crunches_reps,
      'plank_reps': plank_reps,
      'walk_daily': walk_daily,
      'badHabit': badHabit,
      'lifeStyle': lifeStyle,
      'idealWeight': idealWeight,
      'sleepTime': sleepTime,
      'GetupTime': GetupTime,
      'wakeupTime': wakeupTime,
      'feelStressed': feelStressed,
      'motivate': motivate,
      'workOutPlace': workOutPlace,
      'excludeloud': excludeloud,
      'eventcomingup': eventcomingup,
      'eventTime': eventTime,
      'commitTime': commitTime,
      'LengthWorkout': LengthWorkout,
      'profileName': profileName,
      'planPace': planPace,
      'trainingDays': trainingDays,
      'remainders': remainders,
      'hearAbout': hearAbout,
    };
  }
}