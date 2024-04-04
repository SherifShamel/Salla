import 'package:flutter/material.dart';
import 'package:salla/core/config/application_theme_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationThemeManager.themeData.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/header.png"),
            const Text(
              "Welcome Back To Route",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const Text(
              "Please sign in with your mail",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
