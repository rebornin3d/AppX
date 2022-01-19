import 'package:appx/data/json_api_todos.dart';
import 'package:flutter/material.dart';

class JsonAPI_Todos extends StatelessWidget {
  const JsonAPI_Todos({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    const appTitle = 'Todos';

    return MaterialApp(
        title:appTitle,
      home: JsonAPI_HomePage(title: appTitle),
    );
  }
}