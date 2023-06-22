import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/screens/tab_sceen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const TabScreen());

      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: Center(child: Text("Not Found!"))));
    }
  }
}
