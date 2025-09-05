import 'package:get/get.dart';
import '../controllers/myplan_controller.dart';

class MyPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPlanController>(() => MyPlanController());
  }
}