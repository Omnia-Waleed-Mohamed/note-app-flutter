import 'package:flutter/material.dart';
import 'package:notes/db/hiveService.dart';
import 'package:notes/models/note_model.dart';

class NoteController {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final hiveService = HiveService<NoteModel>('notes');

  void dispose() {
    titleController.dispose();
    descController.dispose();
  }

  Future<void> saveNote() async {
    final id = DateTime.now().millisecondsSinceEpoch;

    final note = NoteModel(
      id,
      titleController.text.trim(),
      descController.text.trim(),
      DateTime.now().toString(),
      false,
    );

    await hiveService.addValue(id.toString(), note);
  }

  Future<void> updateNote(String key, NoteModel updatedNote) async {
    await hiveService.updateValue(key, updatedNote);
  }

  Future<void> deleteNote(String key) async {
    await hiveService.deleteValue(key);
  }

  Future<NoteModel?> getNote(String key) async {
    return await hiveService.getValue(key);
  }

  // Future<List<NoteModel>> getAllNotes() async {
  //   final box = await hiveService.openBox();
  //   return box.values.toList();
  // }
  Future<List<NoteModel>> getAllNotes() async {
  return hiveService.getAllValues();
}

}
