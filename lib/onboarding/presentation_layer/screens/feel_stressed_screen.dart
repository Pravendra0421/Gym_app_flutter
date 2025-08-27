import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/FeelStressed_data.dart';
class FeelStressedScreen extends GetView<OnboardingController>{
  const FeelStressedScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Streessed'),
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
            const Text("How often do you feel stressed?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40,),
            Obx(() {
              return Column(
                children: FeelStressedOptions.map((bodyType) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SelectionBox(
                      title: bodyType.title,
                      height: 80,
                      isSelected: controller.onboarding.value.feelStressed == bodyType.id,
                      onTap: () => controller.submitFeelStressed(bodyType.id),
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