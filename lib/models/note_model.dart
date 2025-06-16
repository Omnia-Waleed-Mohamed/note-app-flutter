import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String dataTime;
  @HiveField(4)
  bool done;

   NoteModel(this.id,this.title,this.description,this.dataTime,this.done);

}