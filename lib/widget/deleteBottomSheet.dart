
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/controller/note_controller.dart';

class DeleteBottomSheet extends StatelessWidget {
  final NoteController noteController;
  final BuildContext parentContext;
  final dynamic noteKey;

  const DeleteBottomSheet({
    super.key,
    required this.noteController,
    required this.parentContext,
    required this.noteKey,
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
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 55),
              Text(
                'Are you sure to delete?',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
                      await noteController.deleteNote(noteKey);
                      Navigator.pop(context);       // close bottom sheet
                     
                    },
                    icon: const Icon(Icons.check_circle_outline,
                        color: Color(0xff04332D)),
                  ),
                  const Text('Delete'),
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

