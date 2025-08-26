import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
class KneeScreen extends GetView<OnboardingController>{
  const KneeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Knee pain'),
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
          const Text("Do you suffer from knee pain?",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40,),
          Obx(()=>Column(
            children: [
              SelectionBox(
                  title: 'No',
                  height: 80,
                  isSelected: controller.onboarding.value.knee == false,
                  onTap: ()=>controller.submitKnee(false)
              )
            ],
          )),
          const SizedBox(height: 40,),
          Obx(()=>Column(
            children: [
              SelectionBox(
                  title: 'Yes',
                  height: 80,
                  isSelected: controller.onboarding.value.knee == true,
                  onTap: ()=>controller.submitKnee(true)
              )
            ],
          )),
        ],
      ),
      )
      ),
    );
  }
}