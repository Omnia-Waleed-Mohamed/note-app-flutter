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
    final box = hiveService.box;
    int maxId = 0;
    if (box.isNotEmpty) {
      final allNotes = box.values.toList();
      maxId = allNotes
          .map((note) => note.id)
          .fold(0, (prev, next) => prev > next ? prev : next);
    }

    final newId = maxId + 1;

    final note = NoteModel(
      newId,
      titleController.text.trim(),
      descController.text.trim(),
      DateTime.now().toString(),
      false,
    );

    await box.add(note);
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

  Future<List<NoteModel>> getAllNotes() async {
    return hiveService.getAllValues();
  }
}
