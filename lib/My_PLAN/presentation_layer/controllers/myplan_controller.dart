import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data_layer/models/my_plan_model.dart';
import '../../data_layer/repository/plan_repository.dart';
import '../../../routes.dart';
class MyPlanController extends GetxController{
  final PlanRepository _repository = PlanRepository();
  var isLoading = true.obs;
  // var workoutPlans = <WorkoutPlan>[].obs;
  var errorMessage = Rx<String?>(null);
  var categories =<FitnessCategory>[].obs;
  @override
  void onInit(){
    super.onInit();
    // fetchWorkoutPlans();
    // fetchFitnessCategory();
    fetchData();

  }
  void fetchWorkoutPlans() async {
    try{
      isLoading(true);
      errorMessage(null);
      var plans = await _repository.getAllWorkoutPlans();
      print("--- Fetched WorkoutPlan from Backend ---");
      for(var cat in plans){
        print("Wokout plan: ${plans.length}, Name:${cat.name}, cardio:${cat.cardio}");
      }
      print("------------------------------------");
      // workoutPlans.assignAll(plans);
    }catch (e) {
      errorMessage(e.toString()); // Set error message if something fails
      print("Error fetching plans: $e");
    } finally {
      isLoading(false); // Stop loading
    }
  }

  void fetchFitnessCategory() async{
    try{
      isLoading(true);
      errorMessage(null);
      var fitnessCategory = await _repository.getAllFitnessCategories();
      print("--- Fetched Categories from Backend ---");
      for (var cat in fitnessCategory) {
        print("Category ID: ${cat.id}, Name: ${cat.name}");
      }
      print("------------------------------------");
      // categories.assignAll(fitnessCategory);
    }catch (e) {
      errorMessage(e.toString()); // Set error message if something fails
      print("Error fetching plans: $e");
    } finally {
      isLoading(false); // Stop loading
    }
  }

  void  fetchData() async {
    try{
      isLoading(true);
      errorMessage(null);
      final results = await Future.wait([
        _repository.getAllFitnessCategories(),
        _repository.getAllWorkoutPlans(),
      ]);
      final fetchedCategories = results[0] as List<FitnessCategory>;
      final fetchedPlan = results[1] as List<WorkoutPlan>;
      print("--- Fetched Categories: ${fetchedCategories.length} ---");

      for(var category in fetchedCategories){
        final plansForCategory = fetchedPlan.where((plan)=>plan.fitnessCategoryId == category.id).toList();
        category.plans.assignAll(plansForCategory);
        print("Category '${category.name}' has ${category.plans.length} plans.");
      }
      categories.assignAll(fetchedCategories);
    }catch (e) {
      errorMessage(e.toString());
      print("Error fetching data: $e");
    } finally {
      isLoading(false);
    }
  }
}