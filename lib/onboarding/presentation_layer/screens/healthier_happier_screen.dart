import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class HealthierScreen extends GetView<OnboardingController> {
  const HealthierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            // 1. Change this to center all widgets horizontally
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Fitify will help you lead a healthier and happier life",
                // 2. Add this to center the text itself
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
              // Use Obx to rebuild the Stack when gender is available
              Obx(
                    () => Stack(
                  alignment: Alignment.center,
                  children: [
                    // The background circles
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.lightBlue.shade100, width: 4),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                        Border.all(color: Colors.green.shade100, width: 4),
                      ),
                    ),
                    // The main image
                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(125), // Half of the container size
                      child: Image.asset(
                        // HERE IS THE CHANGE: Check the gender
                        controller.onboarding.value.gender == 'Male'
                            ? 'assets/images/healthier_men.avif' // Your male image
                            : 'assets/images/healthier.jpg', // Your female image
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Floating Icons
                    Positioned(
                      top: 40,
                      left: 40,
                      child: _buildIcon(Icons.thumb_up),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 60,
                      child: _buildIcon(Icons.bolt),
                    ),
                    Positioned(
                      top: 80,
                      right: 40,
                      child: _buildIcon(Icons.fitness_center),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                "Let's focus on the small steps, and you'll be there in no time! we've helped millons, and want to help you too",
                textAlign: TextAlign.center, // Also center this text
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.submitHealthier();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: Text("Continue"),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget to create the floating icons
  Widget _buildIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ]),
      child: Icon(icon, color: Colors.blue, size: 24),
    );
  }
}
