import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import 'auth_botton_screen.dart';
class PlanReady extends GetView<OnboardingController> {
  const PlanReady({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ready plan"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // We use a Row to place the text and image side-by-side
                Container(
                  padding: const EdgeInsets.all(26),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2)
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Expanded will make the text column take all available space
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Weight ${controller.onboarding.value
                                  .goal} Starter for ${controller.onboarding
                                  .value.profileName ?? 'User'}",
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 24),
                            PlanInfoRow(
                              icon: Icons.track_changes,
                              title: "Goal",
                              subtitle:
                              '${controller.onboarding.value.goal} weight',
                            ),
                            const SizedBox(height: 16),
                            const PlanInfoRow(
                              icon: Icons.calendar_today,
                              title: "Duration",
                              subtitle: "5 weeks",
                            ),
                            const SizedBox(height: 16),
                            const PlanInfoRow(
                              icon: Icons.fitness_center,
                              title: "Difficulty",
                              subtitle: "Beginner",
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(width: 4),
                      // Add some space
                      // THE FIX IS HERE: The Positioned widget has been removed.
                      Image.asset(
                        'assets/images/plan_ready.png',
                        height: 180,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Bottom Cards
                const Row(
                  children: [
                    Expanded(
                      child: PlanDetailCard(
                        title: "15-25",
                        subtitle: "Minutes per workout",
                        imagePath:
                        'assets/images/gym_crunches.jpg', // Background image
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: PlanDetailCard(
                        title: "4 Workouts",
                        subtitle: "Per week",
                        // We can pass a widget for the checkmarks
                        child: WeekCheckmarks(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(26),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2)
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Inside the plan",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          const Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green, size: 20),
                              SizedBox(width: 8),
                              Text("Workout guides"),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green, size: 20),
                              SizedBox(width: 8),
                              Text("Nutrition tips"),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green, size: 20),
                              SizedBox(width: 8),
                              Text("Progress tracking"),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green, size: 20),
                              SizedBox(width: 8),
                              Text("Weight Tracking"),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.check_circle,
                                  color: Colors.green, size: 20),
                              SizedBox(width: 8),
                              Text("Healthy Recipes"),
                            ],
                          ),
                        ],
                      ),
                      // const SizedBox(width: 40),
                      // Add some space// Add some space
                      Center(
                        child: Image.asset(
                          'assets/images/plan_ready_img.jpeg',
                          height: 100,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.all(26),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2)
                    ],
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Inside the plan",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          Icon(Icons.heart_broken,
                              color: Colors.black, size: 40),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                                "Based on results from 20 million happy customers"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(Icons.health_and_safety,
                              color: Colors.black, size: 40),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                                "Contantly learning and improving based on your feedback"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        const AuthBottomSheet(),
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreenAccent.shade400,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: const Text("Continue"),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PlanInfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const PlanInfoRow({super.key,
    required this.icon,
    required this.title,
    required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade600),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: Colors.grey.shade600)),
            Text(subtitle,
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }
}

class PlanDetailCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imagePath;
  final Widget? child;

  const PlanDetailCard({super.key,
    required this.title,
    required this.subtitle,
    this.imagePath,
    this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        image: imagePath != null
            ? DecorationImage(
          image: AssetImage(imagePath!),
          fit: BoxFit.cover,
        )
            : null,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(color: Colors.black)),
          if (child != null) ...[const Spacer(), child!]
        ],
      ),
    );
  }
}

class WeekCheckmarks extends StatelessWidget {
  const WeekCheckmarks({super.key});

  @override
  Widget build(BuildContext context) {
    // Find the controller to access the selected days
    final controller = Get.find<OnboardingController>();
    final List<String> allDays = ["mon","tue","Wed","Thu","Fri","Sat","Sun"];

    return Obx(
          () => Row(
        children: allDays.map((day) {
          final isSelected =
              controller.onboarding.value.trainingDays?.contains(day) ?? false;
          return Expanded(
            child: Icon(
              isSelected ? Icons.check_circle : Icons.cancel_outlined,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
          );
        }).toList(),
      ),
    );
  }
}