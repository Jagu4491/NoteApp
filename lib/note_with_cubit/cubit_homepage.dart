import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:noteapp2/note_with_cubit/cubit_descriptionpage.dart';
import 'package:noteapp2/note_with_cubit/cubit_newnote.dart';
import 'package:noteapp2/notewithprovider/note_provider.dart';
import 'package:noteapp2/notewithprovider/provider_descriptionpage.dart';
import 'package:noteapp2/notewithprovider/provider_newnote.dart';
import 'package:noteapp2/ui_helper.dart';
import 'package:provider/provider.dart';

import '../DBhelper.dart';
import 'note_cubit.dart';

class CubitHome extends StatefulWidget{
  @override
  State<CubitHome> createState() => _CubitHomeState();
}

class _CubitHomeState extends State<CubitHome> {
  List<Map<String, dynamic>> notes = [];

  var notetitlecontroller=TextEditingController();

  var notedesccontroller=TextEditingController();

  var notedatecontroller=TextEditingController();
var checkIndex=0;


  /*void addData(title,desc,date){
    context.read<NoteProvider>().addNote(title, desc, date);
  }*/

  @override
  void initState() {
    getallnotes();
    super.initState();
  }
  void getallnotes() async {
    context.read<NoteCubit>().fetchNote();
  }

  var arrdata = [
    {
      'color': maincolor.c1,
    },
    {
      'color': maincolor.c2,
    },
    {
      'color': maincolor.c3,
    },
    {
      'color': maincolor.c4,
    },
    {
      'color': maincolor.c5,
    },
    {
      'color': maincolor.c6,
    },
    {
      'color': maincolor.c7,
    },
    {
      'color': maincolor.c1,
    },
    {
      'color': maincolor.c1,
    },
    {
      'color': maincolor.c1,
    },
    {
      'color': maincolor.c1,
    },
    {
      'color': maincolor.c1,
    },
    {
      'color': maincolor.c1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor.bgcolor,
      body: SafeArea(
        child: Column(
          children: [uiheader(), body(context)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CubitNewnote()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: maincolor.bgcolor,
      ),
    );
  }

  Widget uiheader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: text43(tcolor: Colors.white, tfontwt: FontWeight.bold),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xeffffff),
            ),
            child: Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget body(BuildContext context) {
    return Expanded(
      child:BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is NoteLoading) {
            return CircularProgressIndicator();
          }
          if (state is NoteError) {
            return Text('${state.errorMsg}');
          }
          if (state is NoteLoaded) {
            notes=state.allNotes;
            return GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                pattern: [
                  QuiltedGridTile(1, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 2),
                ],
              ),
              shrinkWrap: true,
              childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) =>
                      note(
                          notes[index][DBhelper().columnid],
                          notes[index][DBhelper().columntitle],
                          notes[index][DBhelper().columndesc],
                          notes[index][DBhelper().columndate],
                          context),
                  childCount: notes.length),
            );
          }
          return Container();
        }
    )
    );
  }

  Widget note(columnid, title,desc,date, context,) {
    if(checkIndex<arrdata.length-1){
      checkIndex++;
    }else{
      checkIndex=0;
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CubitDescriptionpage(title,desc,date)));

        },
        /*  child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => descriptionpage(title, desc, date)));
        },
          onLongPress: (){

          },*/
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: text25(
                        tfontwt: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(desc,style: t25(),),
                  Text(
                    date,
                    style: text20(
                        tcolor: Colors.black.withOpacity(0.4),
                        tfontwt: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        OutlinedButton(onPressed: (){
                          notetitlecontroller.text=title;
                          notedesccontroller.text=desc;
                          notedatecontroller.text=date;

                          showModalBottomSheet(context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                              ),
                              builder: (context){
                                return Container(
                                  height: 350,
                                  decoration: BoxDecoration(
                                      color: maincolor.bgcolor,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Update Note',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white70),),
                                      SizedBox(height: 15,),
                                      TextField(
                                        controller: notetitlecontroller,
                                        style: t25(tcolor: Colors.white70),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(21)
                                            )
                                        ),
                                      ),
                                      SizedBox(height: 11,),
                                      TextField(
                                        controller: notedesccontroller,
                                        style: t25(tcolor: Colors.white70),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(21)
                                            )
                                        ),
                                      ),
                                      SizedBox(height: 11,),
                                      TextField(
                                        controller: notedatecontroller,
                                        style: t25(tcolor: Colors.white70),
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(21)
                                            )
                                        ),
                                      ),
                                      SizedBox(height: 11,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          OutlinedButton(onPressed: (){
                                            context.read<NoteCubit>().updateNote(notetitlecontroller.text, notedesccontroller.text, notedatecontroller.text, columnid);

                                            //DBhelper().UpdateData(title,desc,date,columnid);

                                          }, child: Text('Update',style: TextStyle(fontWeight: FontWeight.bold,)),
                                            style: OutlinedButton.styleFrom(
                                                shape:RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(21)
                                                )
                                            ),
                                          ),

                                          OutlinedButton(onPressed: (){
                                            Navigator.pop(context);
                                          }, child: Text('Cancel'),
                                            style: OutlinedButton.styleFrom(
                                                shape:RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(21)
                                                )

                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );

                              });
                        }, child: Text('Update',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          style: OutlinedButton.styleFrom(
                              shape:RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(21),
                              ),
                              side: BorderSide(color:Colors.black)

                          ),
                        ),

                        OutlinedButton(onPressed: (){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text('Delete Note'),
                              content: Text('Are you sure want to delete this note?'),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text('Cancel')),
                                TextButton(onPressed: (){
                                  //Provider.of<NoteProvider>(context,listen: false).delNote(columnid);
                                  BlocProvider.of<NoteCubit>(context).deleteNote(columnid);

                                  // DBhelper().deleteData(columnid);
                                  Navigator.pop(context);

                                }, child: Text('Delete'))
                              ],
                            );
                          }
                          );


                        }, child: Text('Delete',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                          style: OutlinedButton.styleFrom(
                              shape:RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(21),
                              ),
                              side: BorderSide(color:Colors.black)

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: arrdata[checkIndex]['color'], borderRadius: BorderRadius.circular(21)),
        ),
      ),

    );
  }
}