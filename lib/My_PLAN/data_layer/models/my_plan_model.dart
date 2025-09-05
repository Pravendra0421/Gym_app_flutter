import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
List<FitnessCategory> fitnessCategoryFromJson(String str) => List<FitnessCategory>.from(json.decode(str).map((x) => FitnessCategory.fromJson(x)));
List<WorkoutPlan> workoutPlanFromJson(String str) => List<WorkoutPlan>.from(json.decode(str).map((x)=>WorkoutPlan.fromJson(x)));

class FitnessCategory {
  final String id;
  final String name;
  final String description;
  // We will fetch plans separately when the user taps on a category
  RxList<WorkoutPlan> plans; // Use RxList to make it observable

  FitnessCategory({
    required this.id,
    required this.name,
    required this.description,
    List<WorkoutPlan>? plans, // Make it optional
  }) : plans = (plans ?? []).obs; // Initialize with an empty observable list

  factory FitnessCategory.fromJson(Map<String, dynamic> json) => FitnessCategory(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );
}
class WorkoutPlan{
  final String id;
  final String name;
  final int cardio;
  final int strength;
  final int durationInWeeks;
  final String fitnessCategoryId;
  final List<String> willAchieve;
  final List<String> howAchieve;
  WorkoutPlan({
    required this.id,
    required this.name,
    required this.cardio,
    required this.strength,
    required this.durationInWeeks,
    required this.fitnessCategoryId,
    required this.willAchieve,
    required this.howAchieve,
  });
  factory WorkoutPlan.fromJson(Map<String,dynamic> json) => WorkoutPlan(
    id: json["id"],
    name: json["name"],
    cardio: json["cardio"],
    strength: json["Strength"],
    durationInWeeks: json["durationInWeeks"],
    fitnessCategoryId: json["fitnessCategoryId"],
    willAchieve: List<String>.from(json["willAchieve"].map((x) => x as String)),
    howAchieve: List<String>.from(json["howAchieve"].map((x) => x as String)),
  );
}