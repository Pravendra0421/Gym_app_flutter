import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/Motivate_data.dart';

class MotivateScreen extends GetView<OnboardingController> {
  const MotivateScreen({super.key});

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
                "What motivates you the most?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: MotivateOptions.length,
                    itemBuilder: (context, index) {
                      final bodyType = MotivateOptions[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Obx(
                              () => SelectionBox(
                            title: bodyType.title,
                            height: 80,
                            isSelected: controller.motivateModel.value.motivate!
                                .contains(bodyType.id),
                            onTap: () =>
                                controller.toggleMotivate(bodyType.id),
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
                    controller.submitMotivate();
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
