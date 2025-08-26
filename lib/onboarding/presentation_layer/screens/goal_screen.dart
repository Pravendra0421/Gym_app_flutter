import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
class GoalScreen extends GetView<OnboardingController>{
  const GoalScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Goal"),
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
            const Text(
              "What's your goal",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 80,),
            Obx(()=>Column(
              children: [
                SelectionBox(
                    title: 'Gain muscle',
                    imagePath: controller.onboarding.value.gender == "Male"
                    ?'assets/images/male.png':'assets/images/female.png'
                    ,
                    isSelected: controller.onboarding.value.goal == 'Gain',
                    onTap: ()=>controller.selectGoal('Gain'))
              ],
            )),
            const SizedBox(height: 16,),
            Obx(()=>Column(children: [
              SelectionBox(
                  title: 'Lose weight',
                  imagePath: controller.onboarding.value.gender == 'Male'
                  ?'assets/images/male_lose.png':'assets/images/female.png',
                  isSelected: controller.onboarding.value.goal == 'Lose', onTap: ()=>controller.selectGoal('Lose'))
            ],)),
            const SizedBox(height: 16,),
          ],
        ),
      ),
      ),
    );
  }
}