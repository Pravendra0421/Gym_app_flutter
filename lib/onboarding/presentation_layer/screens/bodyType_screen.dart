import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/bodyType_data.dart';
class BodyTypeScreen extends GetView<OnboardingController> {
  const BodyTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Type"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                "What's your body type?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 80),
              Obx(() {
                final options = controller.onboarding.value.gender == 'Male'
                    ? maleBodyTypes
                    : femaleBodyTypes;
                return Column(
                  children: options.map((bodyType) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SelectionBox(
                        title: bodyType.title,
                        imagePath: bodyType.imagePath,
                        isSelected: controller.onboarding.value.bodyType == bodyType.id,
                        onTap: () => controller.selectBodyType(bodyType.id),
                      ),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}