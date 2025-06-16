import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/onBoardingScreen.dart';

void main() async{
   
  WidgetsFlutterBinding.ensureInitialized(); 
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter()); 

  await Hive.openBox<NoteModel>('notes');
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}