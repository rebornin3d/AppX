import 'dart:io';

import 'package:appx/data/database_helper.dart';
import 'package:appx/data/note.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SaveNotes extends StatefulWidget {
  const SaveNotes({Key? key}) : super(key: key);

  @override
  _SaveNotesState createState() => _SaveNotesState();
}

class _SaveNotesState extends State<SaveNotes> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Note>>(
              future: DatabaseHelper.instance.getGroceries(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Note>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading...'));
                }
                return snapshot.data!.isEmpty
                    ? Center(child: Text('No notes in List.'))
                    : ListView(
                        children: snapshot.data!.map((grocery) {
                          return Center(
                            child: Card(
                              color: selectedId == grocery.id
                                  ? Colors.white70
                                  : Colors.white,
                              child: ListTile(
                                title: Text(grocery.name),
                                onTap: () {
                                  setState(() {
                                    if (selectedId == null) {
                                      textController.text = grocery.name;
                                      selectedId = grocery.id;
                                    } else {
                                      textController.text = '';
                                      selectedId = null;
                                    }
                                  });
                                },
                                onLongPress: () {
                                  setState(() {
                                    DatabaseHelper.instance.remove(grocery.id!);
                                  });
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            selectedId != null
                ? await DatabaseHelper.instance.update(
                    Note(id: selectedId, name: textController.text),
                  )
                : await DatabaseHelper.instance.add(
                    Note(name: textController.text),
                  );
            setState(() {
              textController.clear();
              selectedId = null;
            });
          },
        ),
      ),
    );
  }
}




