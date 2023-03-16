import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteapp2/newnote.dart';
import 'package:noteapp2/note_with_cubit/note_cubit.dart';

import '../DBhelper.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<addNote>((event, emit)async{
      emit(NoteLoading());
      var check=await DBhelper().addData(event.title, event.desc, event.date);

      if(check>0){
        var allNotes=await DBhelper().fetchData();
        emit(NoteLoaded(allNotes));
      }else{
        emit(NoteError("Note is not added"));
      }
    });

    on<fetchNote>((event, emit)async{
      emit(NoteLoading());
      var notes=await DBhelper().fetchData();
      emit(NoteLoaded(notes));
    });

    on<updateNote>((event, emit) async{
      emit(NoteLoading());
      var check=await DBhelper().UpdateData(event.title, event.desc, event.date, event.id);

      if(check>0){
        var allNotes=await DBhelper().fetchData();
        emit(NoteLoaded(allNotes));
      }else{
        emit(NoteError('Note is not updated'));
      }
    });

    on<delNote>((event, emit) async{
      emit(NoteLoading());
      var check=await DBhelper().deleteData(event.id);

      if(check>0){
        var allNotes=await DBhelper().fetchData();
        emit(NoteLoaded(allNotes));
      }else{
        emit(NoteError("Note is Not deleted"));
      }

    });


  }

}
