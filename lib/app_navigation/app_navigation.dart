import 'package:flutter/material.dart';
import 'package:flutter_firebase_demo/screens/login/login_screen.dart';
import 'package:flutter_firebase_demo/screens/register/register_screen.dart';

import '../screens/home/home_page.dart';

class AppNavigation {
  static Route? buildPage(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.PAGE_NAME:
        {
          return MaterialPageRoute(
              builder: (context) => const LoginScreen(), settings: settings);
        }
      case RegisterScreen.PAGE_NAME:
        {
          return MaterialPageRoute(
              builder: (context) => const RegisterScreen(), settings: settings);
        }
      case HomeScreen.PAGE_NAME:
        {
          return MaterialPageRoute(
              builder: (context) => const HomeScreen(), settings: settings);
        }
      default:
        {}
    }
    return null;
  }
}
