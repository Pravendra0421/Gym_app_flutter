import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/onboarding_model.dart';
class OnboardingRepository {
  final String _baseurl ="http://192.168.29.187:3000/api/auth";
  Future<bool> registerUserWithProfile(String idToken,OnboardingModel profile, String firebaseUid,String email) async{
    try{
      final body = profile.toJson();
      body['firebaseUid'] = firebaseUid;
      body['email']=email;
      final response = await http.post(
        Uri.parse('$_baseurl/user'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $idToken',
        },
        body: jsonEncode(body),
      );
      if(response.statusCode == 201){
        return true;
      }else {
        print("Backend Error: ${response.body}");
        return false;
      }
    }catch (e) {
      print("HTTP Error: $e");
      return false;
    }
  }
}