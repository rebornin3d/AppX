import 'package:appx/router.dart';
import 'package:flutter/material.dart';

class AppX extends StatelessWidget {
  const AppX({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
              title: 'AppX',
              theme: ThemeData(primarySwatch: Colors.amber),
              darkTheme: ThemeData.dark(),
              themeMode: currentMode,
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.dashboard,
              onGenerateRoute: RouteGenerator.generateRoute);
        });
  }
}
