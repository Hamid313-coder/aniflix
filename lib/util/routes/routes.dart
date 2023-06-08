import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "a":
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
