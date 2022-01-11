

import 'package:appx/router.dart';
import 'package:flutter/material.dart';

class AppX extends StatelessWidget {
  const AppX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppX',
      debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.dashboard,
        onGenerateRoute: RouteGenerator.generateRoute);

  }
}
