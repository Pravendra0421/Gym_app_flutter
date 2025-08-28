import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/excludeLoud_data.dart';
class ExcludeLoudScreen extends GetView<OnboardingController>{
  const ExcludeLoudScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('exclude loud'),
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
            const Text("If at home, should we exclude loud exercises?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            const Text("Some exercises such as jumping jacks might disturb your neighbour or household members. you can change it in future?",
            style: TextStyle(color: Colors.grey),),
            const SizedBox(height: 40,),
            Obx(() {
              return Column(
                children: excludeLoudOptions.map((bodyType) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SelectionBox(
                      title: bodyType.title,
                      height: 80,
                      isSelected: controller.onboarding.value.excludeloud == bodyType.id,
                      onTap: () => controller.submitExcludeLoud(bodyType.id),
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