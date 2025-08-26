import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/walkDaily_data.dart';
class WalkDailyScreen extends GetView<OnboardingController>{
  const WalkDailyScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Active'),
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
            const Text("How mush do you walk daily ?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40,),
            const Text("Think about how you usually spend your day and what you do in your free time"),
            Obx(() {
              return Column(
                children: activeOptions.map((bodyType) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SelectionBox(
                      title: bodyType.title,
                      height: 80,
                      isSelected: controller.onboarding.value.walk_daily == bodyType.id,
                      onTap: () => controller.submitWalk(bodyType.id),
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