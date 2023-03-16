import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp2/ui_helper.dart';

class BlocDescriptionpage extends StatefulWidget {
  var title;
  var date;
  var des;

  BlocDescriptionpage(this.title,this.date,this.des);

  @override
  State<BlocDescriptionpage> createState() => _BlocDescriptionpage();
}

class _BlocDescriptionpage extends State<BlocDescriptionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor.bgcolor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width:50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xeffffff),
                        ),
                        child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios_new,color:Colors.white,size: 30)),
                      ),
                      Container(
                        width:50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xeffffff),
                        ),
                        child: Icon(Icons.note_alt_outlined,color:Colors.white,size: 30,),
                      ),
                    ]
                ),
              ),
              spart(widget.title,widget.date,widget.des)
            ],
          ),

        ),
      ),

    );
  }
}

Widget spart(title,date,des){
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 25,left: 25,bottom: 15),
        child: Text(title,style: text34(tfontwt: FontWeight.bold,tcolor: Colors.white ),),
      ),
      Padding(
          padding: const EdgeInsets.only(right: 225),
          child: Text(date,style:t25(tcolor: Colors.grey.withOpacity(0.4),tfontwt: FontWeight.w600,),
          )
      ),
      Padding(
        padding: const EdgeInsets.all(25),
        child: Text(des,style: t25(tcolor: Colors.white.withOpacity(0.6)) ),),
    ],
  );


}