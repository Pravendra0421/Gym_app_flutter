import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data_layer/models/onboarding_model.dart';
import '../../../routes.dart';
class OnboardingController extends GetxController {
  final onboarding = OnboardingModel().obs;
  late TextEditingController ageController;
  late TextEditingController heightCmController;
  late TextEditingController heightFeetController;
  late TextEditingController heightInchesController;
  late TextEditingController weightKgController;
  late TextEditingController weightLbsController;
  var isCm = true.obs;
  var isKg = true.obs;
  var bmi = 0.0.obs;
  var bmiStatus = ''.obs;
  final focuson = OnboardingModel(focusOn: []).obs;
  final badHabitmodel = OnboardingModel(badHabit: []).obs;
  @override
  void onInit(){
    super.onInit();
    ageController = TextEditingController();
    heightCmController = TextEditingController();
    heightFeetController = TextEditingController();
    heightInchesController = TextEditingController();
    weightKgController = TextEditingController();
    weightLbsController = TextEditingController();
    weightKgController.addListener(() => calculateBmi(weightKgController.text));
    weightLbsController.addListener(() => calculateBmi(weightLbsController.text));
  }
  @override
  void onClose(){
    ageController.dispose();
    heightCmController.dispose();
    heightFeetController.dispose();
    heightInchesController.dispose();
    weightKgController.dispose();
    weightLbsController.dispose();
    weightKgController.removeListener(() => calculateBmi(weightKgController.text));
    weightLbsController.removeListener(() => calculateBmi(weightLbsController.text));
    super.onClose();
  }
  void calculateBmi(String currentWeightText) {
    final heightInCm = onboarding.value.height;
    if (heightInCm == null || heightInCm == 0 || currentWeightText.isEmpty) {
      bmi.value = 0.0;
      bmiStatus.value = '';
      return;
    }

    double? weightInKg;
    if (isKg.value) {
      weightInKg = double.tryParse(currentWeightText);
    } else {
      final lbs = double.tryParse(currentWeightText);
      if (lbs != null) {
        weightInKg = lbs * 0.453592;
      }
    }

    if (weightInKg != null && weightInKg > 0) {
      final heightInM = heightInCm / 100;
      final calculatedBmi = weightInKg / (heightInM * heightInM);
      bmi.value = calculatedBmi;

      // New condition logic to set the BMI status
      if (calculatedBmi < 18.5) {
        bmiStatus.value = 'Underweight';
      } else if (calculatedBmi >= 18.5 && calculatedBmi < 25) {
        bmiStatus.value = 'Healthy Weight';
      } else if (calculatedBmi >= 25 && calculatedBmi < 30) {
        bmiStatus.value = 'overweight';
      } else {
        bmiStatus.value = 'Obese';
      }

    } else {
      bmi.value = 0.0;
      bmiStatus.value = ''; // Reset the status
    }
  }
  void toggleHeightUnit(bool value) {
    isCm.value = value;
  }
  void toggleWeightUnit(bool value) {
    isKg.value = value;
  }
  void selectGender(String gender){
    onboarding.update((val){
      val?.gender = gender;
    });
    print("selected Gender : ${onboarding.value.gender}");
    Get.toNamed(AppRoutes.ONBOARDING_AGE);
  }
  void submitAge(){
    if(ageController.text.isNotEmpty){
      final age = int.tryParse(ageController.text);
      if(age != null && age>10 && age<100){
        onboarding.update((val){
          val?.age = age;
        });
        print("saved age : ${onboarding.value.age}");
        Get.toNamed(AppRoutes.ONBOARDING_TALL);
      }else{
        Get.snackbar("Invalid Age", "Please enter a valid age between 10 and 100.");
      }
    }else{
      Get.snackbar("Missing Age", "Please enter the age");
    }
  }
  void submitHeight(){
    double? heightInCm;
    if(isCm.value){
      if(heightCmController.text.isNotEmpty){
        heightInCm = double.tryParse(heightCmController.text);
      }
    }else{
      if(heightFeetController.text.isNotEmpty && heightInchesController.text.isNotEmpty){
        final feet = double.tryParse(heightFeetController.text)?? 0;
        final inch = double.tryParse(heightInchesController.text)?? 0;
        heightInCm=(feet * 30.48) + (inch*2.54);
      }
    }
    if(heightInCm != null && heightInCm >100 && heightInCm<300){
      onboarding.update((val){
        val?.height = heightInCm;
      });
      print("saved age : ${onboarding.value.height}");
      Get.toNamed(AppRoutes.ONBOARDING_WEIGHT);
    }else{
      Get.snackbar("Invalid Height", "Please enter a valid height.");
    }
  }
  void submitWeight() {
    double? weightInKg;
    if (isKg.value) {
      weightInKg = double.tryParse(weightKgController.text);
    } else {
      final lbs = double.tryParse(weightLbsController.text);
      if (lbs != null) {
        // Convert lbs to kg (1 lbs = 0.453592 kg)
        weightInKg = lbs * 0.453592;
      }
    }

    if (weightInKg != null && weightInKg > 30 && weightInKg < 250) {
      onboarding.update((val) => val?.currentWeight = weightInKg);
      print("Saved Weight: ${onboarding.value.currentWeight?.toStringAsFixed(2)} kg");
      Get.toNamed(AppRoutes.ONBOARDING_GOAL);
    } else {
      Get.snackbar("Invalid Weight", "Please enter a valid weight.");
    }
  }
  void selectGoal(String goal){
    onboarding.update((val){
      val?.goal = goal;
    });
    print ('Selected Goal : ${onboarding.value.goal}');
    if(goal == 'Lose'){
      Get.toNamed(AppRoutes.ONBOARDING_TARGET_WEIGHT);
    }else{
      Get.toNamed(AppRoutes.ONBOARDING_BODYTYPE);
    }
  }
  void selectBodyType(String bodyType){
    onboarding.update((val){
      val?.bodyType = bodyType;
    });
    print('selected bodyType: ${onboarding.value.bodyType}');
    Get.toNamed(AppRoutes.ONBOARDING_DREAMBODYSHAPE);
  }
  void submitTargetWeight() {
    double? weightInKg;
    if (isKg.value) {
      weightInKg = double.tryParse(weightKgController.text);
    } else {
      final lbs = double.tryParse(weightLbsController.text);
      if (lbs != null) {
        // Convert lbs to kg (1 lbs = 0.453592 kg)
        weightInKg = lbs * 0.453592;
      }
    }

    if (weightInKg != null && weightInKg > 30 && weightInKg < 250) {
      onboarding.update((val) => val?.targetWeight = weightInKg);
      print("Saved targetWeight: ${onboarding.value.targetWeight?.toStringAsFixed(2)} kg");
      Get.toNamed(AppRoutes.ONBOARDING_BODYTYPE);
    } else {
      Get.snackbar("Invalid Weight", "Please enter a valid weight.");
    }
  }
  void submitDreamBodyShape(String dreamBodyShape){
    onboarding.update((val){
      val?.dreamBodyShape = dreamBodyShape;
    });
    print("Submit Dreamed body shape ${onboarding.value.dreamBodyShape}");
    Get.toNamed(AppRoutes.ONBOARDING_FOCUSON);
  }
  void toggleFocusOn(String focusOn){
    focuson.update((val){
      if(val!.focusOn!.contains(focusOn)){
        val.focusOn!.remove(focusOn);
      }else{
        val.focusOn!.add(focusOn);
      }
    });
    print("updated focus on:${focuson.value.focusOn}");
  }
  void submitFocusOn() {
    if (focuson.value.focusOn!.isNotEmpty) {
      print("Focus Areas Submitted: ${focuson.value.focusOn}");
      // Navigate to the next screen
      Get.toNamed(AppRoutes.ONBOARDING_WORKEXPERIANCE);
    } else {
      // If the list is empty, show an error message
      Get.snackbar(
        "Selection Required",
        "Please select at least one focus area.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  void submitWorkoutExperiance(String workoutExperiance){
    onboarding.update((val){
      val?.workoutExperiance = workoutExperiance;
    });
    print('selected workoutExperiance :${onboarding.value.workoutExperiance}');
    Get.toNamed(AppRoutes.ONBOARDING_FITNESS);
  }
  void submitFitness(String fitness){
    onboarding.update((val){
      val?.fitness = fitness;
    });
    print('selected fitness: ${onboarding.value.fitness}');
    Get.toNamed(AppRoutes.ONBOARDING_ACTIVE);
  }
  void submitActive(String active){
    onboarding.update((val){
      val?.self_assessed_activity=active;
    });
    print('selected active:${onboarding.value.self_assessed_activity}');
    Get.toNamed(AppRoutes.ONBOARDING_KNEE);
  }
  void submitKnee(bool hasPain){
    onboarding.update((val){
      val?.knee = hasPain;
    });
    print('selected knee pain :${onboarding.value.knee}');
    Get.toNamed(AppRoutes.ONBOARDING_SQUAT);
  }
  void submitSquat(String squat_reps){
    onboarding.update((val){
      val?.squat_reps=squat_reps;
    });
    print('selected squat ${onboarding.value.squat_reps}');
    if(onboarding.value.gender == "Male"){
      Get.toNamed(AppRoutes.ONBOARDING_PUSHUPS);
    }else{
      Get.toNamed(AppRoutes.ONBOARDING_CRUNCHES);
    }
  }
  void submitPushups(String pushups_reps){
    onboarding.update((val){
      val?.pushups_reps=pushups_reps;
    });
    print('selected squat ${onboarding.value.pushups_reps}');
    Get.toNamed(AppRoutes.ONBOARDING_PLANK);
  }
  void submitcrunches(String crunches_reps){
    onboarding.update((val){
      val?.crunches_reps=crunches_reps;
    });
    print('selected squat ${onboarding.value.crunches_reps}');
    Get.toNamed(AppRoutes.ONBOARDING_PLANK);
  }
  void submitPlank(String plank_reps){
    onboarding.update((val){
      val?.plank_reps = plank_reps;
    });
    print('selected plank ${onboarding.value.plank_reps}');
    Get.toNamed(AppRoutes.ONBOARDING_WALKDAILY);
  }
  void submitWalk(String walk_daily){
    onboarding.update((val){
      val?.walk_daily = walk_daily;
    });
    print('selected walkDaily ${onboarding.value.walk_daily}');
    Get.toNamed(AppRoutes.ONBOARDING_BADHABIT);
  }

  void togglebadHabit(String badHabit){
    badHabitmodel.update((val){
      if(val!.badHabit!.contains(badHabit)){
        val.badHabit!.remove(badHabit);
      }else{
        val.badHabit!.add(badHabit);
      }
    });
    print("updated bad habit on:${badHabitmodel.value.badHabit}");
  }
  void submitBadhabit() {
    if (badHabitmodel.value.badHabit!.isNotEmpty) {
      print("Focus Areas Submitted: ${badHabitmodel.value.badHabit}");
      // Navigate to the next screen
      Get.toNamed(AppRoutes.ONBOARDING_LIFESTYLE);
    } else {
      // If the list is empty, show an error message
      Get.snackbar(
        "Selection Required",
        "Please select at least one focus area.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  void submitLifeStyle(String lifestyle){
    onboarding.update((val){
      val?.lifeStyle = lifestyle;
    });
    print('selected lifestyle ${onboarding.value.lifeStyle}');
    // Get.toNamed(AppRoutes.ONBOARDING_WALKDAILY);
  }
}