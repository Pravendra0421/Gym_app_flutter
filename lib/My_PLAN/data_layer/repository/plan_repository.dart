import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/my_plan_model.dart';

class PlanRepository{
  final String _baseUrl = "http://192.168.29.187:3000/api";
  Future<List<FitnessCategory>> getAllFitnessCategories() async {
    try{
      final response = await http.get(
        Uri.parse('$_baseUrl/fitness-category/getAll')
      );
      if(response.statusCode == 201){
        return fitnessCategoryFromJson(response.body);
      }else {
        throw Exception('Failed to load workout plans');
      }

    }catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }


  Future<List<WorkoutPlan>> getAllWorkoutPlans() async{
    try{
      final response = await http.get(
        Uri.parse('$_baseUrl/main-workout-plan/getAll')
      );
      if(response.statusCode == 201){
        return workoutPlanFromJson(response.body);
      }else {
        throw Exception('Failed to load workout plans');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}