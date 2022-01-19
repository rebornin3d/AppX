import 'package:appx/data/json_api_comments.dart';
import 'package:appx/data/json_api_photos.dart';
import 'package:flutter/material.dart';

class JsonApi_Comments extends StatelessWidget {
  const JsonApi_Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Comments';

    return const MaterialApp(
      title: appTitle,
      home: JsonAPI_Comments_HomePage(title: appTitle),
    );
  }
}
