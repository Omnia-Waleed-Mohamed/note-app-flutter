import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/controller/note_controller.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widget/bottomSheet.dart';
import 'package:notes/widget/bottomsheetEdit.dart';

class EditScreen extends StatelessWidget {
  final NoteModel note;
  final dynamic noteKey;

  EditScreen({super.key, required this.note, required this.noteKey});

  @override
  final noteController = NoteController();

  Widget build(BuildContext context) {
    noteController.titleController.text = note.title;
    noteController.descController.text = note.description;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Color(0xFF04332D),
                size: 24,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "Back",
              style: GoogleFonts.playfairDisplay(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xFF04332D),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: FilledButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) => EditBottomSheet(
                    noteController: noteController,
                    parentContext: context,
                    noteKey: noteKey, 
                    note: note, 
                  ),
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF04332D),
                minimumSize: const Size(34, 34),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Icon(
                Icons.edit,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// Title Field
            TextField(
              controller: noteController.titleController,
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),

            /// Description Field
            Expanded(
              child: TextField(
                controller: noteController.descController,
                maxLines: null,
                expands: true,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                decoration: const InputDecoration(
                  hintText: 'Start typing...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
