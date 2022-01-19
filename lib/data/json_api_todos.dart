import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Todo>> fetchTodos(http.Client client) async {
  final response =
  await client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  return compute(parseTodos, response.body);
}

List<Todo> parseTodos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Todo>((json) => Todo.fromJson(json)).toList();
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}


class JsonAPI_HomePage extends StatelessWidget {
  const JsonAPI_HomePage({Key? key, required String title}) : super(key: key);

  final String title = 'Todos List';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Todo>>(
        future: fetchTodos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('errrrrror is :  $snapshot');
            return const Center(
              child: Text("An error has occured!"),
            );
          } else if (snapshot.hasData) {
            return TodosList(todos: snapshot.data!);
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

class TodosList extends StatelessWidget {
  const TodosList({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].userId.toString()),
              subtitle: Text(todos[index].id.toString()),
              trailing: const Icon(Icons.more_rounded),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(todos[index].title),
              ),
            );
          }),
    );
  }
}
