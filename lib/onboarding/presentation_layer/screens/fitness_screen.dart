import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/fitness_data.dart';
class FitnessScreen extends GetView<OnboardingController>{
  const FitnessScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('fitness'),
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
            const Text("How fit are you?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40,),
            Obx(() {
              return Column(
                children: fitnessOptions.map((bodyType) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SelectionBox(
                      title: bodyType.title,
                      height: 80,
                      isSelected: controller.onboarding.value.fitness == bodyType.id,
                      onTap: () => controller.submitFitness(bodyType.id),
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