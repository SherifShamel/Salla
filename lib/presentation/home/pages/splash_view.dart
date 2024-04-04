import 'package:flutter/material.dart';
import 'package:salla/core/config/page_routes_names.dart';
import 'package:salla/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () =>
          navigatorKey.currentState?.pushReplacementNamed(PageRouteName.login),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/img/splash_screen.png"),
        fit: BoxFit.cover,
      )),
    );
  }
}
