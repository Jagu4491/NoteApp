part of 'note_bloc.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

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