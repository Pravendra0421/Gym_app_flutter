import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/FeelWakeUp_data.dart';
class feelWakeUpScreen extends GetView<OnboardingController>{
  const feelWakeUpScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('wakeup'),
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
            const Text("How do you usually feel after you wake up?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40,),
            Obx(() {
              return Column(
                children: FeelWakeUpOptions.map((bodyType) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SelectionBox(
                      title: bodyType.title,
                      height: 80,
                      isSelected: controller.onboarding.value.wakeupTime == bodyType.id,
                      onTap: () => controller.submitWakeup(bodyType.id),
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