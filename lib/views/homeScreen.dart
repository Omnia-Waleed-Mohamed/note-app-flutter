import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/newNoteScreen.dart';
import 'package:notes/widget/home.dart';
import 'package:notes/widget/homeScreenEmpty.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Color> noteColors = [
    const Color(0xFF04332D),
    const Color(0xFF021815),
    const Color(0xFF526E48),
    const Color(0xFF224F06),
    const Color(0xFF4C4B16),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notes",
          style: GoogleFonts.playfairDisplay(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF04332D),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewNoteScreen()),
              );
            },
            backgroundColor: const Color(0xFF04332D),
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
  valueListenable: Hive.box<NoteModel>('notes').listenable(),
  builder: (context, Box<NoteModel> box, _) {
    if (box.isEmpty) {
      return const HomeScreenEmpty(); 
    }

    return NotesGridWidget(noteColors: noteColors); 
  },
),
      
    );
  }
}
