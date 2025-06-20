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
              const SizedBox(width: 18),
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
            ],
          ),
          const Divider(
              thickness: 0.8, color: Color.fromARGB(255, 197, 197, 197)),
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
                    icon: const Icon(Icons.check_circle_outline,
                        color: Color(0xff04332D)),
                  ),
                  const Text('Save'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.grey),
                  ),
                  const Text('Cancel'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
