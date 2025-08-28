import 'package:flutter/material.dart';
import '../controllers/onboarding_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class Trainingdays extends GetView<OnboardingController>{
  const Trainingdays({super.key});
  @override
  Widget build(BuildContext context){
    final List<String> daysOfweek = ["mon","tue","Wed","Thu","Fri","Sat","Sun"];
    final String today = DateFormat('E').format(DateTime.now());
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pick training days!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Great! Based on your data, we recommend 4 workouts per week.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              // Use a Wrap widget for a flexible grid layout
              Obx(
                    () => Wrap(
                  spacing: 12.0,
                  runSpacing: 12.0,
                  children: daysOfweek.map((day) {
                    return DayChip(
                      day: day,
                      isSelected: controller.onboarding.value.trainingDays!.contains(day),
                      isToday: day == today,
                      onTap: () => controller.toggleTrainingdays(day),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(),
              // Reminder Card
              Obx(
                    () => Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Reminders", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            Text("Build a habit and never miss your workout day!", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Switch(
                        value: controller.remainder.value,
                        onChanged: (value) => controller.toggleRemainder(value),
                        activeColor: Colors.blueAccent,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.submitTrainigDays();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent.shade400,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text("Continue"),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
class DayChip extends StatelessWidget {
  final String day;
  final bool isSelected;
  final bool isToday;
  final VoidCallback onTap;

  const DayChip({
    super.key,
    required this.day,
    required this.isSelected,
    required this.isToday,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // THE FIX IS HERE: We wrap the content in a Stack
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // This is the main container for the day chip
          Container(
            width: (MediaQuery.of(context).size.width - 48 - 24) / 3, // Responsive width
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.blueAccent : Colors.black,
                  ),
                ),
                if (isToday)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text("Today", style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
              ],
            ),
          ),
          // This is the checkmark icon, positioned on top of the container
          if (isSelected)
            Positioned(
              top: -8,
              right: -8,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.blueAccent,
                  size: 24,
                ),
              ),
            ),
        ],
      ),
    );
  }
}