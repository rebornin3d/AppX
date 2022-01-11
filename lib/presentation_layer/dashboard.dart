import 'package:appx/app.dart';
import 'package:appx/presentation_layer/post_page.dart';
import 'package:appx/presentation_layer/reusable_card.dart';
import 'package:appx/presentation_layer/settings.dart';
import 'package:appx/presentation_layer/social_login.dart';
import 'package:flutter/material.dart';

import 'albums.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE513333),
      appBar: AppBar(
        title: Text('App X'),
        actions: [
          IconButton(
              icon: Icon(AppX.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                AppX.themeNotifier.value =
                    AppX.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 150.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostPage()),
                    );
                  },
                  child: ReusableCard(
                    color: Color(0xFFEB1555),
                    cardChild: Center(
                        child: Text(
                      'Post',
                      style: (TextStyle(fontSize: 35.0)),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Albums()),
                    );
                  },
                  child: ReusableCard(
                    color: Color(0xFFEB1555),
                    cardChild: Center(
                        child: Text(
                      'My Albums',
                      style: (TextStyle(fontSize: 35.0)),
                    )),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SocialLogin()),
              );
            },
            child: ReusableCard(
              color: Color(0xFFEB1555),
              cardChild: Center(
                child: Text(
                  'LOGIN',
                  style: (TextStyle(fontSize: 35.0)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
            child: ReusableCard(
              color: Color(0xFFEB1555),
              cardChild: Center(
                child: Text(
                  'Settings',
                  style: (TextStyle(fontSize: 35.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
