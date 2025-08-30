import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/focusOn_data.dart';

class FocusOnScreen extends GetView<OnboardingController> {
  const FocusOnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Focus On'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          // Use a Column with Expanded to separate the list from the button
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                "What are your focus areas?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              // Expanded will make the list take all available space and become scrollable
              Expanded(
                child: Obx(() {
                  final options =
                  controller.onboarding.value.gender == 'Male' // Change is here
                      ? maleTypes
                      : femaleTypes;
                  // Use ListView.builder for a scrollable list
                  // THE FIX IS HERE: We wrap the ListView with a Scrollbar
                  return Scrollbar(
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        final bodyType = options[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: SelectionBox(
                            title: bodyType.title,
                            height: 80,
                            isSelected: controller.onboarding.value.focusOn! // Change is here
                                .contains(bodyType.id),
                            onTap: () => controller.toggleFocusOn(bodyType.id),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
              // This button is now outside the scrollable area
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.submitFocusOn();
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
