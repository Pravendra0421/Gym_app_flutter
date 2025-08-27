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
import 'onboarding/presentation_layer/screens/ideal_weight_screen.dart';
import 'onboarding/presentation_layer/screens/sleep_screen.dart';
import 'onboarding/presentation_layer/screens/getup_bed_screen.dart';
import 'onboarding/presentation_layer/screens/feel_wakeup_screen.dart';
import 'onboarding/presentation_layer/screens/feel_stressed_screen.dart';
import 'onboarding/presentation_layer/screens/motivate_screen.dart';

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
  static const ONBOARDING_IDEALWEIGHT = '/onboarding-idealWeight';
  static const ONBOARDING_SLEEP = '/onboarding-sleep';
  static const ONBOARDING_GETUP_BED ='/onboarding-GETUP-BED';
  static const ONBOARDING_FEELWAKEUP ='/onboarding-feelwakeup';
  static const ONBOARDING_FEELSTRESSED = '/onboarding-feelStressed';
  static const ONBOARDING_MOTIVATE = '/onboarding-motivate';

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
    GetPage(
        name: AppRoutes.ONBOARDING_IDEALWEIGHT,
        page: ()=>IdealWeightScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_SLEEP,
        page: ()=>SleepScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_GETUP_BED,
        page: ()=>GETUPScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_FEELWAKEUP,
        page: ()=>feelWakeUpScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_FEELSTRESSED,
        page: ()=>FeelStressedScreen(),
        binding: OnboardingBinding(),
    ),
    GetPage(
        name: AppRoutes.ONBOARDING_MOTIVATE,
        page: ()=>MotivateScreen(),
        binding: OnboardingBinding(),
    ),
  ];
}