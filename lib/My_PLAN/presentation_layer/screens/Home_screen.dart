import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/myplan_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomeScreen extends GetView<MyPlanController>{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){},
            icon: FaIcon(FontAwesomeIcons.solidComment), )
        ],
      ),
      body: SafeArea(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select a fitness plan",style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),),
            Text("All plans are personalized for you.",style: TextStyle(color: Colors.grey),)
          ],
        ),
      ),
      ),
    );
  }
}