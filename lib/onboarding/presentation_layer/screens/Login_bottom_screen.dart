import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class LoginBottomSheet extends GetView<OnboardingController> {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Log  in to your account",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          // Google Sign-in Button
          SocialAuthButton(
            text: "Continue with Google",
            iconPath: 'assets/images/icons8-google-94.png',
            onPressed: () {
              controller.handleGoogleLogIn();
            },
          ),
          const SizedBox(height: 16),
          // Facebook Sign-in Button
          SocialAuthButton(
            text: "Continue with Facebook",
            iconPath: 'assets/images/icons8-facebook-96.png',
            onPressed: () {
              // controller.handleFacebookSignIn(); // we willl add the this
            },
          ),
          const SizedBox(height: 16),
          // Apple Sign-in Button
          SocialAuthButton(
            text: "Continue with Apple",
            iconPath: 'assets/images/icons8-apple-50.png',
            onPressed: () {
              // controller.handleAppleSignIn(); //we willl add the this
            },
          ),
          const SizedBox(height: 16),
          // Email Sign-up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // controller.submitHandleLoginPage(); // we willl add the this
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Log in with email"),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialAuthButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;

  const SocialAuthButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(iconPath, height: 24, width: 24),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}

