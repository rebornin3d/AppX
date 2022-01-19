import 'dart:io';
import 'package:path/path.dart';
import 'package:appx/presentation_layer/screens/notes_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Note {
  final int? id;
  final String name;

  Note({this.id, required this.name});

  factory Note.fromMap(Map<String, dynamic> json) => new Note(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}