import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/views/homeScreen.dart';


//https://www.figma.com/design/PgXE4Kam33nFSN0e9RbSMI/Note-App?node-id=0-1&p=f&t=6Sd9j2Nn7bSIllM5-0


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30,left: 18,right: 18),
          child: Column(
            children: [
              SizedBox(height:22 ,),
              Image.asset("assets/images/note.png" ),
              
              Text(
                  textAlign: TextAlign.center,
                  "All thoughts One place.",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  )),
                  SizedBox(height: 14,),
              Text(
                "Dive right in and clear that mind of yours by writing your thoughts down.",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff686868),
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder:(context) => HomeScreen() ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF04332D), 
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(28), 
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white, 
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
