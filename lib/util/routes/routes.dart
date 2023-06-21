import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/screens/detail.dart';
import 'package:flutter_anime_flix/screens/tab_sceen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const TabScreen());
      case '/detailscreen':
        return MaterialPageRoute(builder: (_) => const MovieDetail());

      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: Center(child: Text("Not Found!"))));
    }
  }
}
