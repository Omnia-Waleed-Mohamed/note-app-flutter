import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes/controller/note_controller.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/editScreen.dart';
import 'package:notes/widget/deleteBottomSheet.dart';

class NotesGridWidget extends StatelessWidget {
  final List<Color> noteColors;

  const NotesGridWidget({super.key, required this.noteColors});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<NoteModel>('notes').listenable(),
      builder: (context, Box<NoteModel> box, _) {
        if (box.isEmpty) {
          return const Center(child: Text("No Notes Found"));
        }

        return Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            itemCount: box.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
    
            itemBuilder: (context, index) {
              final note = box.getAt(index);
              if (note == null) return const SizedBox();

              final noteKey = box.keyAt(index); 

              final dateTime = DateTime.tryParse(note.dataTime);
              final formattedDate =
                  dateTime != null ? DateFormat.yMMMMd().format(dateTime) : '';
              final formattedTime =
                  dateTime != null ? DateFormat.Hm().format(dateTime) : '';

              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: noteColors[index % noteColors.length],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ID
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white24,
                        child: Text(
                          "${note.id}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),

                    /// Title
                    Text(
                      note.title,
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),

                    /// Description
                    Text(
                      note.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunito(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),

                    const Divider(color: Colors.white24, thickness: 0.7),

                    /// Date + Icons
                    Row(
                      children: [
                        Expanded(
                        child: 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formattedDate,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 6,
                                ),
                              ),
                              Text(
                                formattedTime,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 6,
                                ),
                              ),
                            ],
                          ),
                         ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              padding: EdgeInsets.only(left: 30),
                              constraints: const BoxConstraints(),
                              icon: const Icon(Icons.edit,
                                  size: 18, color: Colors.white),
                              onPressed: () {
                                final note = box.getAt(index);
                                final noteKey =
                                    box.keyAt(index); 

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditScreen(
                                      note: note!,
                                      noteKey: noteKey,
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              padding: EdgeInsets.only(left: 13),
                              constraints: const BoxConstraints(),
                              icon: const Icon(Icons.delete,
                                  size: 18, color: Colors.white),
                              onPressed: () {
                                
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  builder: (_) => DeleteBottomSheet(
                                    noteController: NoteController(),
                                    parentContext: context,
                                    noteKey: noteKey, 
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
