import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import 'data/onboarding_question_template.dart';
class PlankScreen extends GetView<OnboardingController>{
  const PlankScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 1. Define the data for this specific screen
    final List<OptionModel> squatOptions = [
      OptionModel(id: 'less_than_30', text: 'Less than 30'),
      OptionModel(id: '30_60', text: '30-60'),
      OptionModel(id: 'more_than_1', text: 'More than 1 min'),
      OptionModel(id: 'dont_know', text: "I don't know"),
    ];

    // 2. Use the template and pass the data
    return Obx(
          () => OnboardingQuestionTemplate(
        title: "How long can you hold a plank?",
        subtitle: "Choose your maximum time without resting?",
        mediaPath: controller.onboarding.value.gender == 'Male'
            ? 'assets/videos/man_squatmp4.mp4'
            : 'assets/videos/female_pushups.mp4',
        options: squatOptions,
        selectedOptionId: controller.onboarding.value.plank_reps,
        onOptionSelected: (selectedId) {
          controller.submitPlank(selectedId); // The function to call on tap
        },
      ),
    );
  }

}