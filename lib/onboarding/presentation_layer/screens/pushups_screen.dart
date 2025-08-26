import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import 'data/onboarding_question_template.dart';
class PushupsScreen extends GetView<OnboardingController>{
  const PushupsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // 1. Define the data for this specific screen
    final List<OptionModel> squatOptions = [
      OptionModel(id: 'less_than_15', text: 'Less than 15'),
      OptionModel(id: '15_30', text: '15-30'),
      OptionModel(id: 'more_than_30', text: 'More than 30'),
      OptionModel(id: 'dont_know', text: "I don't know"),
    ];

    // 2. Use the template and pass the data
    return Obx(
          () => OnboardingQuestionTemplate(
        title: "How many pushups can you do?",
        subtitle: "How many can you do without a break?",
            mediaPath: controller.onboarding.value.gender == 'Male'
                ? 'assets/videos/malePushups.mp4'
                : 'assets/videos/female_pushups.mp4',
        options: squatOptions,
        selectedOptionId: controller.onboarding.value.pushups_reps,
        onOptionSelected: (selectedId) {
          controller.submitPushups(selectedId); // The function to call on tap
        },
      ),
    );
  }

}