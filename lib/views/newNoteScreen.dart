import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewNoteScreen extends StatelessWidget {
  const NewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                // Action
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
                Icons.check_circle_outline_rounded,
                size: 20, 
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

      body:Padding(
        padding: const EdgeInsets.only(left: 20,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            TextField(
              style: GoogleFonts.nunito(
                fontSize: 20,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: GoogleFonts.nunito(
                  color: const Color(0xFF9A9A9A),
                  fontSize: 48,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            const SizedBox(height: 12),
        
            
            TextField(
              maxLines: null,
              style: GoogleFonts.nunito(
                fontSize: 18,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Type something...',
                hintStyle: GoogleFonts.nunito(
                  color: const Color(0xFF9A9A9A),
                  fontSize: 23,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ],),
      )
    );
  }
}
