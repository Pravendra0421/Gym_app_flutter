import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/workout_experiance_data.dart';
class WorkoutScreen extends GetView<OnboardingController>{
  const WorkoutScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('experiance'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(child:
      Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8,),
          const Text("Any previous workout experiance?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40,),
          Obx(() {
            return Column(
              children: workoutoptions.map((bodyType) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SelectionBox(
                    title: bodyType.title,
                    height: 80,
                    isSelected: controller.onboarding.value.workoutExperiance == bodyType.id,
                    onTap: () => controller.submitWorkoutExperiance(bodyType.id),
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
      )
      ),
    );
  }

}