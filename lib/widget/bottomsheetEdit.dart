/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/controller/note_controller.dart';

class EditBottomSheet extends StatelessWidget {
  final NoteController noteController;
  final BuildContext parentContext;

  const EditBottomSheet({
    super.key,
    required this.noteController,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 33,
              ),
              Expanded(
                child: Text(
                  'What Do You want to Do',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.grey),
              ),
            ],
          ),
          //const SizedBox(height: 4),
          const Text(
            'to save',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          // const SizedBox(height: 12),
          const Divider(
            thickness: 0.8,
            color: Color.fromARGB(255, 197, 197, 197),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () async {
                      if (noteController.titleController.text.isNotEmpty &&
                          noteController.descController.text.isNotEmpty) {
                        await noteController.updateNote();
                        Navigator.pop(context); // close sheet
                        Navigator.pop(parentContext); // back to Home
                      }
                    },
                    icon: const Icon(Icons.edit,
                        color: Color(0xff04332D)),
                  ),
                  const Text('Edit'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () async {
                      await noteController.deleteNote(noteKey);
                   Navigator.pop(context); // close bottom sheet
                       Navigator.pop(parentContext); // back to HomeScreen
                    },
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                  ),
                  const Text('Delete'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/// 🟢 EditBottomSheet.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/controller/note_controller.dart';
import 'package:notes/models/note_model.dart';

class EditBottomSheet extends StatelessWidget {
  final NoteController noteController;
  final BuildContext parentContext;

  final dynamic noteKey;
  final NoteModel note;

  const EditBottomSheet({
    super.key,
    required this.noteController,
    required this.parentContext,
    required this.noteKey,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const SizedBox(width: 33),
              Expanded(
                child: Text(
                  'Are yor sure to save changes ?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.grey),
              ),
            ],
          ),
          const Text(
            'to save',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const Divider(thickness: 0.8, color: Color.fromARGB(255, 197, 197, 197)),
          const SizedBox(height: 5),

          /// ✅ Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /// ✅ Edit
              Column(
                children: [
                  IconButton(
                    onPressed: () async {
                      if (noteController.titleController.text.isNotEmpty &&
                          noteController.descController.text.isNotEmpty) {
                        final updatedNote = NoteModel(
                          note.id,
                          noteController.titleController.text.trim(),
                          noteController.descController.text.trim(),
                          DateTime.now().toString(),
                          false,
                        );

                        await noteController.updateNote(noteKey, updatedNote);
                        Navigator.pop(context); // close sheet
                        Navigator.pop(parentContext); // back to Home
                      }
                    },
                    icon: const Icon(Icons.edit, color: Color(0xff04332D)),
                  ),
                  const Text('Edit'),
                ],
              ),

              /// ✅ Delete
              Column(
                children: [
                  IconButton(
                    onPressed: () async {
                      await noteController.deleteNote(noteKey);
                      Navigator.pop(context); // close bottom sheet
                      Navigator.pop(parentContext); // back to HomeScreen
                    },
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                  ),
                  const Text('Delete'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

