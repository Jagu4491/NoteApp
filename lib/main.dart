

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:noteapp2/DBhelper.dart';
import 'package:noteapp2/descriptionpage.dart';
import 'package:noteapp2/newnote.dart';
import 'package:noteapp2/note_with_bloc/bloc_home.dart';
import 'package:noteapp2/note_with_bloc/note_bloc.dart';
import 'package:noteapp2/note_with_cubit/cubit_homepage.dart';
import 'package:noteapp2/note_with_cubit/note_cubit.dart';
import 'package:noteapp2/notewithprovider/note_provider.dart';
import 'package:noteapp2/notewithprovider/provider_home.dart';
import 'package:noteapp2/ui_helper.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';


void main() {
  runApp(BlocProvider<NoteBloc>(
    create: (context)=>NoteBloc(),
      child: myapp()));
 /* runApp(BlocProvider<NoteCubit>(
    create: (context) => NoteCubit(),
    child: myapp(),
  ));*/
 /* runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>NoteProvider())
  ],
      child: myapp()));*/
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotesApp',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: BlocHome(),
    );
  }
}
