import 'package:appx/app.dart';
import 'package:appx/bloc/forms/dynamic_form/app.dart';
import 'package:appx/bloc/forms/dynamic_form/new_car_repository.dart';
import 'package:appx/graph_ql/api/job_api_client.dart';
import 'package:appx/graph_ql/graphql_page.dart';
import 'package:appx/presentation_layer/reusable_card.dart';
import 'package:appx/presentation_layer/screens/json/json_api_screen_comments.dart';
import 'package:appx/presentation_layer/screens/post_page.dart';
import 'package:appx/presentation_layer/screens/settings.dart';
import 'package:appx/presentation_layer/screens/social_login.dart';
import 'package:flutter/material.dart';

import 'screens/albums.dart';
import 'screens/json/json_api_screen_photos.dart';
import 'screens/json/json_api_screen_todos.dart';
import 'screens/notes_saver.dart';

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
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 50.0,
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
                      style: (TextStyle(fontSize: 25.0)),
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
                        style: (TextStyle(fontSize: 25.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaveNotes()),
              );
            },
            child: ReusableCard(
              color: Color(0xFFEB1555),
              cardChild: Center(
                child: Text(
                  'Notes Saver',
                  style: (TextStyle(fontSize: 25.0)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        GraphQL_Page(jobsApiClient: JobsApiClient.create())),
              );
            },
            child: ReusableCard(
              color: Color(0xFFEB1555),
              cardChild: Center(
                child: Text(
                  'GraphQL',
                  style: (TextStyle(fontSize: 25.0)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Dynamic_Form_Page(
                        newCarRepository: NewCarRepository())),
              );
            },
            child: ReusableCard(
              color: Color(0xFFEB1555),
              cardChild: Center(
                child: Text(
                  'Dymamic Form',
                  style: (TextStyle(fontSize: 25.0)),
                ),
              ),
            ),
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
                  style: (TextStyle(fontSize: 25.0)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JsonApi_Photos()),
              );
            },
            child: ReusableCard(
              color: Color(0xFFEB1555),
              cardChild: Center(
                child: Text(
                  'JSON API Photos',
                  style: (TextStyle(fontSize: 25.0)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JsonAPI_Todos(),
                ),
              );
            },
            child: ReusableCard(
              color: Color(0xFFEB1555),
              cardChild: Center(
                child: Text(
                  'JsonAPI_Todos',
                  style: (TextStyle(fontSize: 25.0)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JsonApi_Comments(),
                ),
              );
            },
            child: ReusableCard(
              color: Color(0xFFEB1555),
              cardChild: Center(
                child: Text(
                  'JsonAPI_Comments',
                  style: (TextStyle(fontSize: 25.0)),
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
                  style: (TextStyle(fontSize: 25.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
