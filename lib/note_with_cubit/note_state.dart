part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {

  NoteInitial();
}
class NoteLoading extends NoteState{
  NoteLoading();
}

class NoteLoaded extends NoteState{
  List<Map<String,dynamic>> allNotes;
  NoteLoaded(this.allNotes);
}

class NoteError extends NoteState{
  String errorMsg;
  NoteError(this.errorMsg);
}