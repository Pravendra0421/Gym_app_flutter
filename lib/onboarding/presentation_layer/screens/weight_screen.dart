import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
class WeightScreen extends GetView<OnboardingController>{
  const WeightScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          // Use a Column with Expanded to push the button to the bottom
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // This Expanded section will contain all the scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      const Text(
                        "What's your weight?",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 80),
                      Obx(() => Column(
                        children: [
                          _buildWeightInput(),
                          const SizedBox(height: 40),
                          _buildUnitToggle(),
                          const SizedBox(height: 20),
                          _buildBmiDisplay(),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
              // This button is outside the scrollable area and will stick to the bottom
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.submitWeight();
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

  Widget _buildUnitToggle() {
    return Center(
      child: Container(
        width: 220,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Obx(
              () => Stack(
            children: [
              AnimatedAlign(
                alignment: controller.isKg.value
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Container(
                  width: 110,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.toggleWeightUnit(true),
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          "kg",
                          style: TextStyle(
                            color: controller.isKg.value
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.toggleWeightUnit(false),
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          "lbs",
                          style: TextStyle(
                            color: !controller.isKg.value
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightInput() {
    return TextField(
      controller: controller.isKg.value
          ? controller.weightKgController
          : controller.weightLbsController,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      textAlign: TextAlign.center,
      autofocus: true,
      style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: controller.isKg.value ? "75" : "165",
        border: InputBorder.none,
      ),
    );
  }
  Widget _buildBmiDisplay() {
    return Obx(() {
      // Only show the widget if BMI has been calculated
      if (controller.bmi.value > 0) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "Your BMI of: ${controller.bmi.value.toStringAsFixed(1)} is considered ${controller.bmiStatus.value.toString()}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
        );
      } else {
        // Return an empty widget if BMI is 0 or not calculated
        return SizedBox.shrink();
      }
    });
  }
}