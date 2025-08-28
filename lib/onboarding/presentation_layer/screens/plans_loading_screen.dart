import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/TestinomialScroll.dart';
import '../../component/ExerciseScroll.dart';
class PlanLoading extends GetView<OnboardingController>{
  const PlanLoading ({super.key});
  @override
  Widget build (BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.startLoadingProcess();
    });
    return Scaffold(
      body: SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            Obx(
                ()=>SizedBox(
                  width: 150,
                  height: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                        value: controller.progress.value,
                        strokeWidth: 10,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                      ),
                      Center(
                        child: Text(
                          '${(controller.progress.value * 100).toInt()}%',
                          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            const SizedBox(height: 24,),
            Obx(
                ()=>Text(
                  controller.topMessage.value,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                )
            ),
            const SizedBox(height: 34,),
            Obx(
                ()=>Text(controller.midMessage.value,
                style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.blueAccent),
                )
            ),
            const Spacer(),
            // TestinomialScroll(),
            ExerciseScroll(),
            const SizedBox(height: 20),

          ],
        ),
      ),
      )),
    );
  }
}