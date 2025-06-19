import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/controller/note_controller.dart';

class NoteConfirmationBottomSheet extends StatelessWidget {
  final NoteController noteController;
  final BuildContext parentContext;

  const NoteConfirmationBottomSheet({
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
                  'Should add title and desc',
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
                        await noteController.saveNote();
                        Navigator.pop(context); // close sheet
                        Navigator.pop(parentContext); // back to Home
                      }
                    },
                    icon: const Icon(Icons.check_circle_outline,
                        color: Color(0xff04332D)),
                  ),
                  const Text('Ok'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      noteController.titleController.clear();
                      noteController.descController.clear();
                      Navigator.pop(context);
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
