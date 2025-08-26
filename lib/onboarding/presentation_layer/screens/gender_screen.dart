import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
class GenderScreen extends GetView<OnboardingController>{
  const GenderScreen({super.key});
  @override
  Widget build(BuildContext context){
    Get.put(OnboardingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gender"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),

      body: SafeArea(child:
      Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          const Text(
            "Welcome to Fitify.",
            style: TextStyle(
              fontSize: 22,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8,),
          const Text(
            "What's your gender",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 50,),
          Obx(()=>Column(
            children: [
              SelectionBox(
                  title: 'Male',
                  imagePath: 'assets/images/male.png',
                  isSelected: controller.onboarding.value.gender == 'Male',
                  onTap: ()=>controller.selectGender('Male'))
            ],
          )),
          const SizedBox(height: 16,),
          Obx(()=>Column(children: [
            SelectionBox(
                title: 'Female',
                imagePath: 'assets/images/female.png',
                isSelected: controller.onboarding.value.gender == 'Female', onTap: ()=>controller.selectGender('Female'))
          ],)),
          const SizedBox(height: 16,),
          Obx(()=>Column(
            children: [
              SelectionBox(title: 'Other', isSelected: controller.onboarding.value.gender == 'Other', onTap: ()=>controller.selectGender('Other'))
            ],
          )),
          const Spacer(),
          Center(
            child: Column(
              children: [
                const Text("Already have an account?",
                style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8,),
                ElevatedButton(
                  onPressed: () {
                    // Add your login navigation logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    // minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text('Log In', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,)
        ],
      ),
      ),
      ),
    );
  }

}