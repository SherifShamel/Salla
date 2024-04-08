import 'package:flutter/material.dart';
import 'package:salla/core/config/page_routes_names.dart';
import 'package:salla/presentation/home/pages/splash_view.dart';
import 'package:salla/presentation/layout_view/layout_view.dart';
import 'package:salla/presentation/login/pages/login_view.dart';
import 'package:salla/presentation/registration/pages/register_view.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case PageRouteName.login:
        {
          return MaterialPageRoute(
            builder: (context) => const LoginView(),
          );
        }
      case PageRouteName.registration:
        {
          return MaterialPageRoute(builder: (context) => const RegisterView());
        }
      case PageRouteName.layout:
        {
          return MaterialPageRoute(builder: (context) => const LayoutView());
        }
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
    }
  }
}
