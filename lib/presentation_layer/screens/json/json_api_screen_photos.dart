import 'package:appx/data/json_api_photos.dart';
import 'package:flutter/material.dart';

class JsonApi_Photos extends StatelessWidget {
const JsonApi_Photos({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  const appTitle = 'Photos';

  return const MaterialApp(
    title: appTitle,
    home: JsonAPI_Photos_HomePage(title: appTitle),
  );
}
}