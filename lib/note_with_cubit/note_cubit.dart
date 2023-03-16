import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteapp2/DBhelper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void addNote(String title,String desc,String date) async{
    emit(NoteLoading());

    var check=await DBhelper().addData(title, desc, date);

    if(check>0){
      var allNotes=await DBhelper().fetchData();
      emit(NoteLoaded(allNotes));

    }else{
      emit(NoteError('Note is not inserted'));
    }
  }

  void fetchNote() async{
    emit(NoteLoading());
    var notes=await DBhelper().fetchData();
    emit(NoteLoaded(notes));

  }

  void updateNote(String title,String desc,String date,int id)async{
    emit(NoteLoading());

    var check=await DBhelper().UpdateData(title, desc, date, id);

    if(check>0){
      var allNotes=await DBhelper().fetchData();
      emit(NoteLoaded(allNotes));
    }else{
      emit(NoteError('Note is Not Updated'));
    }
  }

  void deleteNote(int id)async{
    emit(NoteLoading());
    var check=await DBhelper().deleteData(id);

    if(check>0){
      var allNotes=await DBhelper().fetchData();
      emit(NoteLoaded(allNotes));
    }else{
      emit(NoteError('Note is Not Deleted'));
    }

  }
}
