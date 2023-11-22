import 'package:expense_tracker_app/components/custom_text.dart';
import 'package:expense_tracker_app/components/separtor.dart';
import 'package:expense_tracker_app/screens/auth_gate.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  void onPress() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (builder) => const AuthGate()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Separtor(
                height: 40,
              ),
              const CustomText(
                text: 'Expense Tracker',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontColor: Colors.white,
              ),
              Lottie.asset('images/expense_cover_image.json'),
              const Separtor(
                height: 10,
              ),
              const CustomText(
                text: 'manage your expenses',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontColor: Colors.white,
              ),
              const Separtor(height: 80),
              CupertinoButton.filled(
                onPressed: onPress,
                child: const CustomText(
                  text: 'Lets get started',
                  fontColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
