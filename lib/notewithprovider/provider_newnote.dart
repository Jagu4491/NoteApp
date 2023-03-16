import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp2/DBhelper.dart';
import 'package:noteapp2/ui_helper.dart';
import 'package:provider/provider.dart';

import 'note_provider.dart';

class ProviderNewnote extends StatefulWidget{
  @override
  State<ProviderNewnote> createState() => _ProviderNewnoteState();

}

class _ProviderNewnoteState extends State<ProviderNewnote> {
  var notetitle=TextEditingController();
  var notedesc=TextEditingController();
  var notedate=TextEditingController();

  @override
  void initState() {
    getallnotes();

    super.initState();
  }
  void getallnotes() async {
    context.read<NoteProvider>().getNote();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor.bgcolor,
      body: SafeArea(
        child: Consumer<NoteProvider>(
          builder: (context,Provider,child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xeffffff),
                        ),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                                Icons.arrow_back_ios_new_outlined, size: 30,
                                color: Colors.white)),
                      ),
                      InkWell(onTap: () {
                        var title = notetitle.text.toString();
                        var desc = notedesc.text.toString();
                        var date = notedate.text.toString();
                        context.read<NoteProvider>().addNote(title, desc, date);

                        //DBhelper().addData(title, desc, date);
                      },
                        child: Container(
                          width: 80,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xeffffff),
                          ),
                          child: Center(
                              child: Text('Save', style: text20(
                                  tcolor: Colors.white,
                                  tfontwt: FontWeight.bold),)),
                        ),
                      )
                    ],

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 300),
                  child: TextField(
                    style: t25(tcolor: Colors.white70),
                    controller: notetitle,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: maincolor.bgcolor,
                      border: InputBorder.none,
                      label: Text('Title', style: text34(tcolor: Colors.white
                          .withOpacity(0.6), tfontwt: FontWeight.bold),),
                    ),
                  ),

                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  style: t25(tcolor: Colors.white70),
                  controller: notedesc,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: maincolor.bgcolor,
                      border: InputBorder.none,
                      label: Text('Type Something....',
                        style: text20(tcolor: Colors.white.withOpacity(0.6)),)
                  ),
                ),
                TextField(
                  style: t25(tcolor: Colors.white70),
                  controller: notedate,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: maincolor.bgcolor,
                      border: InputBorder.none,
                      label: Text('Date here.....',
                          style: text20(tcolor: Colors.white.withOpacity(0.6)))
                  ),

                ),
                /* ElevatedButton(onPressed: (){
              var title=notetitle.text.toString();
              var desc=notedesc.text.toString();
              var date=notedate.text.toString();

DBhelper().addData(title,desc,date);
             }, child: Text('add'))
*/
              ],
            );
          }
        ),
      ),

    );
  }
}