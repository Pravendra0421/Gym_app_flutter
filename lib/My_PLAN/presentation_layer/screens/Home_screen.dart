import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gym_setup/My_PLAN/data_layer/models/my_plan_model.dart';
import '../controllers/myplan_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomeScreen extends GetView<MyPlanController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Fitness Plan"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.solidComment),
            onPressed: () {
            },
          )
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          // --- State 1: Loading ---
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // --- State 2: Error ---
          if (controller.errorMessage.value != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error: ${controller.errorMessage.value}',
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          // --- State 3: Success ---
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Select a fitness plan!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "All plans are personalized for you.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index];
                      return FitnessCategorySection(category: category);
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// --- Reusable Helper Widgets ---

class FitnessCategorySection extends StatelessWidget {
  final FitnessCategory category;
  const FitnessCategorySection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              category.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              category.description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 250,
            child: Obx(

                  () => ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemCount: category.plans.length,
                itemBuilder: (context, index) {
                  final plan = category.plans[index];
                  return WorkoutPlanCard(plan: plan);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkoutPlanCard extends StatelessWidget {
  final WorkoutPlan plan;
  const WorkoutPlanCard({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // Har card ki width
      margin: const EdgeInsets.only(right: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Expanded(
              flex: 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Image.network(
                  //   plan.imageUrl, // Try to load the image from the backend
                  //   fit: BoxFit.cover,
                  //   loadingBuilder: (context, child, loadingProgress) {
                  //     if (loadingProgress == null) return child;
                  //     return const Center(child: CircularProgressIndicator());
                  //   },
                  //   errorBuilder: (context, error, stackTrace) {
                  //     // If it fails, show the local default image instead
                  //     return Image.asset(
                  //       'assets/images/default_plan_image.png', // Your default image
                  //       fit: BoxFit.cover,
                  //     );
                  //   },
                  // ),
                Image.asset(
                'assets/images/gym_crunches.jpg', // Your default image
                fit: BoxFit.cover,
              ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "${plan.durationInWeeks} weeks",
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Text section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      plan.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        _buildStatBar('Cardio', plan.cardio ?? 0),
                        const SizedBox(width: 16),
                        _buildStatBar('Strength', plan.strength ?? 0),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildStatBar(String label, int level) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(5, (index) {
            return Container(
              width: 15,
              height: 6,
              margin: const EdgeInsets.only(right: 2),
              decoration: BoxDecoration(
                color: index < level ? Colors.green : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            );
          }),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}