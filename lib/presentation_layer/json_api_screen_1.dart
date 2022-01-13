import 'package:appx/data/json_api_1.dart';
import 'package:flutter/material.dart';

class JsonApi_Photos extends StatelessWidget {
const JsonApi_Photos({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  const appTitle = 'Isolate Demo';

  return const MaterialApp(
    title: appTitle,
    home: JsonAPI_Photos_HomePage(title: appTitle),
  );
}
}