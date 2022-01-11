

import 'package:appx/presentation_layer/dashboard.dart';
import 'package:appx/presentation_layer/social_login.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String social_login = '/social_login.dart';
  static const String dashboard = '/dashboard.dart';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      // case AppRoutes.initialRoute:
      //   return MaterialPageRoute(builder: (_) => SocialLogin());
      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return ErrorPage();
    });
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('No route'),
    );
  }
}
