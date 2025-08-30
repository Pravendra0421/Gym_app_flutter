import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data_layer/models/onboarding_model.dart';
import '../../../routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../data_layer/repository/onboarding_repository.dart';
class OnboardingController extends GetxController {
  final onboarding = OnboardingModel(
    trainingDays: [],
    focusOn: [],
    badHabit: [],
    motivate: [],
    workOutPlace: []
  ).obs;
  final OnboardingRepository _repository =OnboardingRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn =GoogleSignIn();
  late TextEditingController ageController;
  late TextEditingController heightCmController;
  late TextEditingController heightFeetController;
  late TextEditingController heightInchesController;
  late TextEditingController weightKgController;
  late TextEditingController weightLbsController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var isCm = true.obs;
  var isKg = true.obs;
  var bmi = 0.0.obs;
  var bmiStatus = ''.obs;
  var remainder = true.obs;
  // final focuson = OnboardingModel(focusOn: []).obs;
  // final badHabitmodel = OnboardingModel(badHabit: []).obs;
  // final motivateModel =OnboardingModel(motivate: []).obs;
  // final workoutModel = OnboardingModel(workOutPlace:  []).obs;
  var progress =0.0.obs;
  var topMessage ='Analyzing your Data'.obs;
  var midMessage ='Plans for real Results'.obs;
  var bottomWidgetType = 'testimonials'.obs;
  @override
  void onInit(){
    super.onInit();
    ageController = TextEditingController();
    heightCmController = TextEditingController();
    heightFeetController = TextEditingController();
    heightInchesController = TextEditingController();
    weightKgController = TextEditingController();
    weightLbsController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController =TextEditingController();
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
    onboarding.update((val){
      if(val!.focusOn!.contains(focusOn)){
        val.focusOn!.remove(focusOn);
      }else{
        val.focusOn!.add(focusOn);
      }
    });
    print("updated focus on:${onboarding.value.focusOn}");
  }
  void submitFocusOn() {
    if (onboarding.value.focusOn!.isNotEmpty) {
      print("Focus Areas Submitted: ${onboarding.value.focusOn}");
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
    onboarding.update((val){
      if(val!.badHabit!.contains(badHabit)){
        val.badHabit!.remove(badHabit);
      }else{
        val.badHabit!.add(badHabit);
      }
    });
    print("updated bad habit on:${onboarding.value.badHabit}");
  }
  void submitBadhabit() {
    if (onboarding.value.badHabit!.isNotEmpty) {
      print("badhabit Areas Submitted: ${onboarding.value.badHabit}");
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
    Get.toNamed(AppRoutes.ONBOARDING_IDEALWEIGHT);
  }
  void submitidealWeight(String idealWeight){
    onboarding.update((val){
      val?.idealWeight = idealWeight;
    });
    print('selected idealWeight ${onboarding.value.idealWeight}');
    Get.toNamed(AppRoutes.ONBOARDING_SLEEP);
  }
  void submitSleep(String sleepTime){
    onboarding.update((val){
      val?.sleepTime = sleepTime;
    });
    print('selected sleepTime ${onboarding.value.sleepTime}');
    Get.toNamed(AppRoutes.ONBOARDING_GETUP_BED);
  }
  void submitGetup(String GetupTime){
    onboarding.update((val){
      val?.GetupTime = GetupTime;
    });
    print('selected GetupTime ${onboarding.value.GetupTime}');
    Get.toNamed(AppRoutes.ONBOARDING_FEELWAKEUP);
  }
  void submitWakeup(String wakeupTime){
    onboarding.update((val){
      val?.wakeupTime = wakeupTime;
    });
    print('selected wakeupTime ${onboarding.value.wakeupTime}');
    Get.toNamed(AppRoutes.ONBOARDING_FEELSTRESSED);
  }
  void submitFeelStressed(String feelStressed){
    onboarding.update((val){
      val?.feelStressed = feelStressed;
    });
    print('selected feelStressed ${onboarding.value.feelStressed}');
    Get.toNamed(AppRoutes.ONBOARDING_MOTIVATE);
  }

  void toggleMotivate(String motivate){
    onboarding.update((val){
      if(val!.motivate!.contains(motivate)){
        val.motivate!.remove(motivate);
      }else{
        val.motivate!.add(motivate);
      }
    });
    print("updated motivate on:${onboarding.value.motivate}");
  }
  void submitMotivate() {
    if (onboarding.value.motivate!.isNotEmpty) {
      print("motivate Areas Submitted: ${onboarding.value.motivate}");
      // Navigate to the next screen
      Get.toNamed(AppRoutes.ONBOARDING_HEALTHIER);
    } else {
      // If the list is empty, show an error message
      Get.snackbar(
        "Selection Required",
        "Please select at least one focus area.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  void submitHealthier(){
    Get.toNamed(AppRoutes.ONBOARDING_WORKOUTPLACE);
  }
  void toggleWorkout(String workOutPlace){
    onboarding.update((val){
      if(val!.workOutPlace!.contains(workOutPlace)){
        val.workOutPlace!.remove(workOutPlace);
      }else{
        val.workOutPlace!.add(workOutPlace);
      }
    });
    print("updated workout place on :${onboarding.value.workOutPlace}");
  }
  void submitWorkout(){
    if(onboarding.value.workOutPlace!.isNotEmpty){
      print("Workout areas submmited:${onboarding.value.workOutPlace}");
      Get.toNamed(AppRoutes.ONBOARDING_EXCLUDELOUD);
    }else {
      // If the list is empty, show an error message
      Get.snackbar(
        "Selection Required",
        "Please select at least one focus area.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  void submitExcludeLoud(String excludeloud){
    onboarding.update((val){
      val?.excludeloud = excludeloud;
    });
    print('selected excludeloud ${onboarding.value.excludeloud}');
    Get.toNamed(AppRoutes.ONBOARDING_EVENT_COMINGUP);
  }
  void submitEventComingup(String eventcomingup){
    onboarding.update((val){
      val?.eventcomingup = eventcomingup;
    });
    print('selected eventcomingup ${onboarding.value.eventcomingup}');
    Get.toNamed(AppRoutes.ONBOARDING_EVENT_TIME);
  }
  void submitEventTime(String eventTime){
    onboarding.update((val){
      val?.eventTime = eventTime;
    });
    print('selected eventTime ${onboarding.value.eventTime}');
    Get.toNamed(AppRoutes.ONBOARDING_READYTOCOMMIT);
  }
  void submitReadyTocommit(String commitTime){
    onboarding.update((val){
      val?.commitTime = commitTime;
    });
    print('selected commitTime ${onboarding.value.commitTime}');
    Get.toNamed(AppRoutes.ONBOARDING_POSITVEIMPACT);
  }
  void positiveImpact(){
    Get.toNamed(AppRoutes.ONBOARDING_LENGTH_WORKOUT);
  }
  void submitLength(int LengthWorkout){
    onboarding.update((val){
      val?.LengthWorkout =LengthWorkout;
    });
    print('submitted length workout : ${onboarding.value.LengthWorkout}');
    Get.toNamed(AppRoutes.ONBOARDING_PROFILE_NAME);
  }
  void submitProfileName(){
    if(nameController.text.isNotEmpty){
      final name = nameController.text;
      onboarding.update((val){
        val?.profileName = name;
      });
      print("saved profileName: ${onboarding.value.profileName}");
      Get.toNamed(AppRoutes.ONBOARDING_PLAN_PACE);
    }else{
      Get.snackbar("Mising Profile name", "please enter the profile name");
    }
  }
  void submitPlanPace(String planPace){
    onboarding.update((val){
      val?.planPace = planPace;
    });
    print('selected planPace: ${onboarding.value.planPace}');
    Get.toNamed(AppRoutes.ONBOARDING_TRAINING_DAYS);
  }
  void toggleTrainingdays(String day){
    onboarding.update((val){
      if(val!.trainingDays!.contains(day)){
        val.trainingDays!.remove(day);
      }else{
        val.trainingDays!.add(day);
      }
    });
    print('selected Days : ${onboarding.value.trainingDays}');
  }
  void toggleRemainder(bool isEnabled){
    remainder.value = isEnabled;
    print('remaider enabled : ${remainder.value}');
  }
  void submitTrainigDays(){
    if(onboarding.value.trainingDays!.isNotEmpty){
      print('final days submitted ${onboarding.value.trainingDays}');
      print("remainder are ${remainder.value ? "ON":"OFF"}");
      Get.toNamed(AppRoutes.ONBOARDING_HEAR_ABOUT);
    }
  }
  void submitHearAbout(String hearAbout){
    onboarding.update((val){
      val?.hearAbout = hearAbout;
    });
    print('selected hearAbout: ${onboarding.value.hearAbout}');
    Get.toNamed(AppRoutes.ONBOARDING_PLAN_LOADING);
  }
  void startLoadingProcess() {
    progress.value = 0.0;
    bottomWidgetType.value = 'testimonials'; // Start with testimonials

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (progress.value >= 1.0) {
        timer.cancel();
        Get.offNamed(AppRoutes.ONBOARDING_PLAN_READY);
      } else {
        progress.value += 0.01;

        // Update text and bottom widget based on progress
        if (progress.value > 0.91) {
          topMessage.value = 'Building your first week';
          midMessage.value = 'Top Rated Fitness App';
          bottomWidgetType.value = 'trusted_by'; // Show the trusted by card
        } else if (progress.value > 0.57) {
          topMessage.value = 'Creating your plan';
          midMessage.value = '87% success rate';
          bottomWidgetType.value = 'exercises'; // Show activity question
        }else {
          // From 0% to 37%
          topMessage.value = 'Analyzing your data';
          midMessage.value = 'Plans for real Results';
          bottomWidgetType.value = 'testimonials'; // Use the correct string for TestinomialScroll
        }
      }
    });
  }
Future<void> handleGoogleSignIn()async {
    try{
      final GoogleSignInAccount ? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User cancelled the sign-in
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      print(user);
      if(user != null){
        final String? idToken = await user.getIdToken(true);
        final String uid = user.uid;
        final String email = user.email ?? '';
        bool success = await _repository.registerUserWithProfile(idToken!, onboarding.value, uid, email);
        if (success) {
          print("Signup successful! Data saved to your backend.");
          // Navigate to the next screen
          Get.offAllNamed(AppRoutes.ONBOARDING_HOME);
        } else {
          Get.snackbar("Signup Failed", "Could not save profile to our server.");
        }
      }
    }catch (e) {
      Get.snackbar("Error", "Google Sign-In failed. Please try again.");
      print("Google Sign In Error: $e");
    }
}
  void submitHandleSigupPage(){
    Get.toNamed(AppRoutes.ONBOARDING_SIGNUPWITHEMAIL);
  }
Future<void> handleSignupWithEmail()async{
  try{
    final email = emailController.text.trim();
    final password  = passwordController.text.trim();
    if(email.isEmpty || password.isEmpty){
      Get.snackbar("Input Error", "Please enter both email and password");
      return;
    }
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final User? user = userCredential.user;
    if(user != null){
      final String? idToken = await user.getIdToken(true);
      final String uid = user.uid;
      final String email = user.email ?? '';
      bool success = await _repository.registerUserWithProfile(idToken!, onboarding.value, uid, email);
      if (success) {
        print("Signup successful! Data saved to your backend.");
        // Navigate to the next screen
        Get.offAllNamed(AppRoutes.ONBOARDING_HOME);
      } else {
        Get.snackbar("Signup Failed", "Could not save profile to our server.");
      }
    }
  }catch (e) {
    Get.snackbar("Error", "email Sign-In failed. Please try again.");
    print("Email password SignIn : $e");
  }
}

  Future<void> handleGoogleLogIn() async {
    try {
      print("Step 1: Starting Google Sign-In...");
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print("Google Sign-In was cancelled by the user.");
        return;
      }
      print("Step 2: Google Sign-In successful. User email: ${googleUser.email}");

      if (googleUser.email == null || googleUser.email.isEmpty) {
        print("CRITICAL ERROR: Google account did not return an email.");
        Get.snackbar("Login Error", "Could not get email from your Google account. Please try again.");
        await _googleSignIn.signOut();
        return;
      }

      final userEmail = googleUser.email;
      print("Step 3: Fetching sign-in methods for email: $userEmail");

      final List<String> signInMethods =
      await _auth.fetchSignInMethodsForEmail(userEmail);

      print("Step 4: Found sign-in methods: $signInMethods");

      if (signInMethods.isEmpty) {
        print("Step 5a: No user found. Showing 'user does not exist' dialog.");
        await _googleSignIn.signOut();
        Get.dialog(
          AlertDialog(
            title: const Text("Login Failed"),
            content: const Text("No account exists for this email. Please sign up first."),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else {
        print("Step 5b: User found with methods: $signInMethods. Proceeding with Firebase sign-in.");
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);

        print("Step 6: Google Login to Firebase successful!");
        Get.offAllNamed(AppRoutes.ONBOARDING_HOME);
      }
    } catch (e) {
      print("A critical error occurred during Google Log In: $e");
      Get.snackbar("Login Error", "An unexpected error occurred. Please check the logs.");
    }
  }
}