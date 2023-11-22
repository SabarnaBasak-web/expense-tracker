import 'package:expense_tracker_app/components/custom_divider.dart';
import 'package:expense_tracker_app/components/custom_text.dart';
import 'package:expense_tracker_app/components/custom_text_field.dart';
import 'package:expense_tracker_app/components/separtor.dart';
import 'package:expense_tracker_app/models/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterScreen> createState() => LoginOrRegisterScreenState();
}

class LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  void onLoginHandler() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
          emailField.text, passwordField.text);
    } on FirebaseAuthException catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomText(
        text: err.toString(),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent.shade100,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'images/login_cover_image.json',
                ),
                const Separtor(height: 20),
                CustomTextField(
                    controller: emailField,
                    hintText: 'Email',
                    iconName: Icons.email),
                const Separtor(height: 10),
                CustomTextField(
                  controller: passwordField,
                  hintText: 'Password',
                  iconName: Icons.lock,
                  obscureText: true,
                ),
                const Separtor(height: 30),
                CupertinoButton.filled(
                  onPressed: onLoginHandler,
                  child: const CustomText(
                    text: 'Login',
                    fontColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Separtor(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                        text: 'Not a member?', fontColor: Colors.white70),
                    const CustomDivider(width: 5),
                    GestureDetector(
                      onTap: () {},
                      child: const CustomText(
                        text: 'Register Now',
                        fontWeight: FontWeight.bold,
                        fontColor: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
