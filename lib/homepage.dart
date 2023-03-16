import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:noteapp2/notewithprovider/note_provider.dart';
import 'package:noteapp2/ui_helper.dart';
import 'package:provider/provider.dart';

import 'DBhelper.dart';
import 'descriptionpage.dart';
import 'newnote.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Map<String, dynamic>> notes = [];
  var notetitlecontroller=TextEditingController();
  var notedesccontroller=TextEditingController();
  var notedatecontroller=TextEditingController();
  var checkIndex=0;

  @override
  void initState() {
    super.initState();
    getallnotes();
  }

  void getallnotes() async {
    notes = await DBhelper().fetchData();
    setState(() {});
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

  ];

  /* {
      'color': maincolor.c1,
      'title': 'How to make your personal brand stand out online',
      'date': 'May 21,2020',
      'des':
          'ho would have thoughts there could be so manycrative ways to tell the temperature ? Todays daily dose of design inspiration is all about the  weather.In this collection of UI designs, we\'re sharing a handful of beautiful mobile weather app concept that we wish existed in real lifeWeather apps are quite the popular interface theme for designers to explore.But don\'t let these effortlessly clean designs fool you. When it comes to the weather,there\'s a lot of data designers have to arrange which can be quite a challenge.Regardlless,it\'s a great way to practice your UI skills.'
    },
    {
      'color': maincolor.c2,
      'title': 'The brand is very turstable',
      'date': 'May 21,2020',
      'des':
          'ho would have thoughts there could be so manycrative ways to tell the temperature ? Todays daily dose of design inspiration is all about the  weather.In this collection of UI designs, we\'re sharing a handful of beautiful mobile weather app concept that we wish existed in real lifeWeather apps are quite the popular interface theme for designers to explore.But don\'t let these effortlessly clean designs fool you. When it comes to the weather,there\'s a lot of data designers have to arrange which can be quite a challenge.Regardlless,it\'s a great way to practice your UI skills.'
    },
    {
      'color': maincolor.c3,
      'title': 'Beautiful weather app UI concept we wish existed',
      'date': 'Mar 18,2020',
      'des':
          'ho would have thoughts there could be so manycrative ways to tell the temperature ? Todays daily dose of design inspiration is all about the  weather.In this collection of UI designs, we\'re sharing a handful of beautiful mobile weather app concept that we wish existed in real lifeWeather apps are quite the popular interface theme for designers to explore.But don\'t let these effortlessly clean designs fool you. When it comes to the weather,there\'s a lot of data designers have to arrange which can be quite a challenge.Regardlless,it\'s a great way to practice your UI skills.'
    },
    {
      'color': maincolor.c4,
      'title': '10 excellent font pairing tools for designers',
      'date': 'Feb 01,2020',
      'des':
          'ho would have thoughts there could be so manycrative ways to tell the temperature ? Todays daily dose of design inspiration is all about the  weather.In this collection of UI designs, we\'re sharing a handful of beautiful mobile weather app concept that we wish existed in real lifeWeather apps are quite the popular interface theme for designers to explore.But don\'t let these effortlessly clean designs fool you. When it comes to the weather,there\'s a lot of data designers have to arrange which can be quite a challenge.Regardlless,it\'s a great way to practice your UI skills.'
    },
    {
      'color': maincolor.c5,
      'title':
          'Spotify\'s Reema Bhagat on product design,music, and the key to a happy career',
      'date': 'May 01,2021',
      'des':
          'ho would have thoughts there could be so manycrative ways to tell the temperature ? Todays daily dose of design inspiration is all about the  weather.In this collection of UI designs, we\'re sharing a handful of beautiful mobile weather app concept that we wish existed in real lifeWeather apps are quite the popular interface theme for designers to explore.But don\'t let these effortlessly clean designs fool you. When it comes to the weather,there\'s a lot of data designers have to arrange which can be quite a challenge.Regardlless,it\'s a great way to practice your UI skills.'
    },
    {
      'color': maincolor.c6,
      'title': '12 eye catching mobile wallpaper',
      'date': 'Feb 01,2020',
      'des':
          'ho would have thoughts there could be so manycrative ways to tell the temperature ? Todays daily dose of design inspiration is all about the  weather.In this collection of UI designs, we\'re sharing a handful of beautiful mobile weather app concept that we wish existed in real lifeWeather apps are quite the popular interface theme for designers to explore.But don\'t let these effortlessly clean designs fool you. When it comes to the weather,there\'s a lot of data designers have to arrange which can be quite a challenge.Regardlless,it\'s a great way to practice your UI skills.'
    },
    {
      'color': maincolor.c7,
      'title': 'Design For Good: JOin the face mask challenge',
      'date': 'Feb 21,2020',
      'des':
          'ho would have thoughts there could be so manycrative ways to tell the temperature ? Todays daily dose of design inspiration is all about the  weather.In this collection of UI designs, we\'re sharing a handful of beautiful mobile weather app concept that we wish existed in real lifeWeather apps are quite the popular interface theme for designers to explore.But don\'t let these effortlessly clean designs fool you. When it comes to the weather,there\'s a lot of data designers have to arrange which can be quite a challenge.Regardlless,it\'s a great way to practice your UI skills.'
    },
  ];*/
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
              context, MaterialPageRoute(builder: (context) => newnote()));
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
      child: GridView.custom(
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
                (context, index) => note(
                    notes[index][DBhelper().columnid],
                notes[index][DBhelper().columntitle],
                notes[index][DBhelper().columndesc],
                notes[index][DBhelper().columndate],
                context),
            childCount: notes.length),
      ),
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
                  builder: (context) => descriptionpage(title,desc,date)));

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
                                            Provider.of<NoteProvider>(context).updateNote(notetitlecontroller.text, notedesccontroller.text, notedatecontroller.text, columnid);

                                            //DBhelper().UpdateData(notetitlecontroller.text,notedesccontroller.text,notedatecontroller.text,columnid);

                                          }, child: Text('Save',style: TextStyle(fontWeight: FontWeight.bold,)),
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
                                  DBhelper().deleteData(columnid);
                                  // Navigator.pop(context);

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