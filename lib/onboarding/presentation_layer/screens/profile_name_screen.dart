import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class ProfileName extends GetView<OnboardingController>{
  const ProfileName({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Age"),
      ),
      body: SafeArea(
        child:
        Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              const Text("What should we call you?",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              const SizedBox(height: 100,),
              TextField(
                controller: controller.nameController,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                autofocus: true,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(
                  hintText: "First name",
                  border: InputBorder.none,
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(12)
                  // )
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  controller.submitProfileName();
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text("Continue",)),
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}