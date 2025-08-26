import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
class TallScreen extends GetView<OnboardingController>{
  const TallScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Height'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        "How Tall are you?",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 100),
                      Obx(() => Column(
                        children: [
                          _buildHeightInput(),
                          const SizedBox(height: 40),
                          _buildUnitToggle(),
                        ],
                      )),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.submitHeight();
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
  Widget _buildUnitToggle() {
    return Center(
      child: Container(
        width: 220,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25), // Fully rounded
        ),
        child: Obx(
              () => Stack(
            children: [
              // This is the animated black background that slides
              AnimatedAlign(
                alignment: controller.isCm.value
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Container(
                  width: 110, // Half the width of the parent
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              // These are the text buttons on top of the background
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.toggleHeightUnit(true),
                      child: Container(
                        color: Colors.transparent, // Makes the whole area tappable
                        alignment: Alignment.center,
                        child: Text(
                          "cm",
                          style: TextStyle(
                            color: controller.isCm.value
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
                      onTap: () => controller.toggleHeightUnit(false),
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          "ft & in",
                          style: TextStyle(
                            color: !controller.isCm.value
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
  Widget _buildHeightInput() {
    if (controller.isCm.value) {
      // Show one field for CM
      return TextField(
        controller: controller.heightCmController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        autofocus: true,
        style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: "173",
          border: InputBorder.none,
        ),
      );
    } else {
      // Show two fields for FT and IN
      return Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.heightFeetController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              autofocus: true,
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "5",
                labelText: "ft",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: controller.heightInchesController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "9",
                labelText: "in",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }
  }
}