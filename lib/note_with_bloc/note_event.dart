part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {}

class addNote extends NoteEvent{
  late String title;
  late String desc;
  late String date;

  addNote(this.title,this.desc,this.date);
}

class fetchNote extends NoteEvent{}

class delNote extends NoteEvent{
  int id;

  delNote(this.id);
}

class updateNote extends NoteEvent{
  String title;
  String desc;
  String date;
  int id;
  updateNote(this.title,this.desc,this.date,this.id);
}

