import 'package:get/get.dart';
import 'onboarding/presentation_layer/bindings/onboarding_binding.dart';
import 'onboarding/presentation_layer/screens/gender_screen.dart';
import 'onboarding/presentation_layer/screens/age_screen.dart';
import 'onboarding/presentation_layer/screens/tall_screen.dart';
import 'onboarding/presentation_layer/screens/weight_screen.dart';
import 'onboarding/presentation_layer/screens/goal_screen.dart';
import 'onboarding/presentation_layer/screens/bodyType_screen.dart';
import 'onboarding/presentation_layer/screens/targetWeight_screen.dart';
import 'onboarding/presentation_layer/screens/dreamBodyShape_screen.dart';
import 'onboarding/presentation_layer/screens/focusOn_screen.dart';
import 'onboarding/presentation_layer/screens/workout_experiance_screen.dart';
import 'onboarding/presentation_layer/screens/fitness_screen.dart';
import 'onboarding/presentation_layer/screens/active_screen.dart';
import 'onboarding/presentation_layer/screens/knee_screen.dart';
import 'onboarding/presentation_layer/screens/squat_screen.dart';
import 'onboarding/presentation_layer/screens/pushups_screen.dart';
import 'onboarding/presentation_layer/screens/crunches_screen.dart';
import 'onboarding/presentation_layer/screens/plank_screen.dart';
import 'onboarding/presentation_layer/screens/walk_daily_screen.dart';
import 'onboarding/presentation_layer/screens/bad_habit_screen.dart';
import 'onboarding/presentation_layer/screens/lifeStyle_screen.dart';

class AppRoutes{
  static const ONBOARDING_GENDER ='/onboarding-gender';
  static const ONBOARDING_AGE ='/onboarding-age';
  static const ONBOARDING_TALL ='/onboarding-tall';
  static const ONBOARDING_WEIGHT ='/onboarding-weight';
  static const ONBOARDING_GOAL ='/onboarding-goal';
  static const ONBOARDING_BODYTYPE ='/onboarding-bodyType';
  static const ONBOARDING_TARGET_WEIGHT= '/onboarding-targetWeight';
  static const ONBOARDING_DREAMBODYSHAPE ='/onboarding-dreambodyshape';
  static const ONBOARDING_FOCUSON ='/onboarding-focuson';
  static const ONBOARDING_WORKEXPERIANCE ='/onboarding-workoutExperiance';
  static const ONBOARDING_FITNESS = '/onboarding-fitness';
  static const ONBOARDING_ACTIVE ='/onboarding-active';
  static const ONBOARDING_KNEE = '/onboarding-knee';
  static const ONBOARDING_SQUAT = '/onboarding-squat';
  static const ONBOARDING_PUSHUPS = '/onboarding-pushups';
  static const ONBOARDING_CRUNCHES = '/onboarding-crunches';
  static const ONBOARDING_PLANK ='/onboarding-plank';
  static const ONBOARDING_WALKDAILY ='/onboarding-walkdaily';
  static const ONBOARDING_BADHABIT ='/onboarding-bad-habit';
  static const ONBOARDING_LIFESTYLE ='/onboarding-lifeStyle';
}
class AppPages {
  static final routes =[
    GetPage(
        name: AppRoutes.ONBOARDING_GENDER,
        page: ()=>GenderScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
      name:AppRoutes.ONBOARDING_AGE,
      page: ()=>AgeScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_TALL,
        page: ()=>TallScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING_WEIGHT,
      page: ()=>WeightScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_GOAL,
        page: ()=>GoalScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING_BODYTYPE,
      page: ()=>BodyTypeScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_TARGET_WEIGHT,
        page: ()=>TargetWeightScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_DREAMBODYSHAPE,
        page: ()=>DreamBodyShapeScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_FOCUSON,
        page: ()=>FocusOnScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_WORKEXPERIANCE,
        page: ()=>WorkoutScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_FITNESS,
        page: ()=>FitnessScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_ACTIVE,
        page: ()=>ActiveScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_KNEE,
        page: ()=>KneeScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_SQUAT,
        page: ()=>SquatScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_PUSHUPS,
        page: ()=>PushupsScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_CRUNCHES,
        page: ()=>CrunchesScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_PLANK,
        page: ()=>PlankScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_WALKDAILY,
        page: ()=>WalkDailyScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_BADHABIT,
        page: ()=>BadHabitScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_LIFESTYLE,
        page: ()=>LifeStyleScreen(),
        binding: OnboardingBinding(),
    ),
  ];
}