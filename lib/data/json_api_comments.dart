import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Comment>> fetchComments(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseComments, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Comment> parseComments(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
}

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  const Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );
  }
}

class JsonAPI_Comments_HomePage extends StatelessWidget {
  const JsonAPI_Comments_HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Comment>>(
        future: fetchComments(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Comment> photos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(".typicode.com/comments"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(photos[index].name),
                subtitle: Text(photos[index].body),
                trailing: Icon(Icons.more_vert),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(photos[index].email),
                ),
              );
            }),
      ),
    );
  }
}
