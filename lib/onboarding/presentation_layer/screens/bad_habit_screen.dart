import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/badHabit_data.dart';

class BadHabitScreen extends GetView<OnboardingController> {
  const BadHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bad Habits'),
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
                "Any bad habits?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: badTypes.length,
                    itemBuilder: (context, index) {
                      final bodyType = badTypes[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Obx(
                              () => SelectionBox(
                            title: bodyType.title,
                            height: 80,
                            isSelected: controller.badHabitmodel.value.badHabit!
                                .contains(bodyType.id),
                            onTap: () =>
                                controller.togglebadHabit(bodyType.id),
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
                    controller.submitBadhabit();
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
