import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/workOut_place_data.dart';

class WorkOutScreen extends GetView<OnboardingController> {
  const WorkOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motivate'),
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
                "Where will you work out?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: WorkOutOptions.length,
                    itemBuilder: (context, index) {
                      final bodyType = WorkOutOptions[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Obx(
                              () => SelectionBox(
                            title: bodyType.title,
                            height: 80,
                            isSelected: controller.workoutModel.value.workOutPlace!
                                .contains(bodyType.id),
                            onTap: () =>
                                controller.toggleWorkout(bodyType.id),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.submitWorkout();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("Submit"),
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
