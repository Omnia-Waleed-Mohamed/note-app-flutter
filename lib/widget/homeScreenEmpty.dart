import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenEmpty extends StatelessWidget {
  const HomeScreenEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
        
          children: [

            SizedBox(height: 30,),
              Image.asset("assets/images/note.png" ),
              
              Text(
                  textAlign: TextAlign.center,
                  "Create your first note !",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff252525),
                  )),
          ],
        ),
      );
  }
}