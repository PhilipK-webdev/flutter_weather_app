import "package:flutter/material.dart";
import 'package:flutter_auto_machine/favorite/favorite_page.dart';
import 'package:flutter_auto_machine/mainpage/main_page.dart';

class RouteManager {
  static const String homePage = '/';
  static const String favorite = '/favorite';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var valuePassed;
    if (settings.arguments != null) {
      valuePassed = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => MainPage(),
        );
      default:
        throw FormatException('Route not found,check routes again');
    }
  }
}
