import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../component/selection.dart';
import 'data/hear_about_survey_data.dart';

class AboutHear extends GetView<OnboardingController> {
  const AboutHear({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
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
                "How did you hear about us?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              // Expanded will make the list take all available space and become scrollable
              Expanded(
                // Obx has been removed from here
                child: Scrollbar(
                  child: ListView.builder(
                    itemCount: hereAboutOptions.length,
                    itemBuilder: (context, index) {
                      final bodyType = hereAboutOptions[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        // THE FIX IS HERE: Obx now only wraps the SelectionBox
                        child: Obx(
                              () => SelectionBox(
                            title: bodyType.title,
                            height: 80,
                            isSelected: controller.onboarding.value.hearAbout ==
                                bodyType.id,
                            onTap: () =>
                                controller.submitHearAbout(bodyType.id),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // This button is now outside the scrollable area
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // You might want a separate submit function that doesn't navigate immediately
                    // For now, tapping an option navigates.
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("Continue"),
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
