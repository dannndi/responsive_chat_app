import 'package:flutter/material.dart';
import 'package:responsive_chat_app/module/home/presentation/home_screen.dart';

import '/core/route/app_route_name.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
    }

    return null;
  }
}
