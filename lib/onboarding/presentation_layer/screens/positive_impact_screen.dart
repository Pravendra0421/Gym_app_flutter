import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
class PositiveImpact extends GetView<OnboardingController>{
  const PositiveImpact({super.key});
  String _getCommitmentText(String? commitValue) {
    if (commitValue == 'At least a year') {
      return 'Committing for a year is great start to building healthy habits';
    } else if (commitValue == 'At least 3 month') {
      return 'Committing for 3 month increase your chance to reach visible results';
    } else if (commitValue == 'At least a month') {
      return 'After 1 month , you should feel a positive impact on your body and mind';
    } else {
      return 'you should feel a positive impact on your body and mind';
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('positive impact'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(child:
      Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8,),
          Obx(()=>Text(
            _getCommitmentText(controller.onboarding.value.commitTime),
            style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
          )),
          const SizedBox(height: 70,),
          Container(
            width: 400,
            height: 280,
            child: Image.asset('assets/images/positiveImpact.jpg',
            width: 400,
            height: 280,
            fit: BoxFit.cover,),
          ),
          const SizedBox(height: 30,),
          Text("But remember, there are no shortcuts in fitness and commiting to a longer period may help you reach your goals",
          style: TextStyle(fontSize: 15),),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                controller.positiveImpact();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Text("Continue"),
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
      )
      ),
    );
  }
}