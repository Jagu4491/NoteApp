import 'dart:ui';

import 'package:flutter/material.dart';

class maincolor{
  static final Color bgcolor=Color(0xff252525);
  static final Color c1=Color(0xffdf9e89);
  static final Color c2=Color(0xff715730);
  static final Color c3=Color(0xffe6ee9b);
  static final Color c4=Color(0xff85d6e0);
  static final Color c5=Color(0xffcf93d9);
  static final Color c6=Color(0xff814d5f);
  static final Color c7=Color(0xff3b615e);
}

TextStyle text34({
  tcolor=Colors.black,
  tfontwt=FontWeight.w500
}){
  return TextStyle(
    color: tcolor,fontWeight: tfontwt,
    fontFamily: 'myfont',
    fontSize: 34
  );

}

TextStyle text25({
  tcolor=Colors.black,
  tfontwt=FontWeight.w500
}){
  return TextStyle(
      color: tcolor,fontWeight: tfontwt,
      fontFamily: 'myfont',
      fontSize: 23
  );

}
TextStyle text20({
  tcolor=Colors.black,
  tfontwt=FontWeight.w500
}){
  return TextStyle(
      color: tcolor,fontWeight: tfontwt,
      fontFamily: 'myfont',
      fontSize: 20
  );

}

TextStyle text43({
  tcolor=Colors.black,
  tfontwt=FontWeight.w500
}){
  return TextStyle(
      color: tcolor,fontWeight: tfontwt,
      fontFamily: 'myfont',
      fontSize: 43
  );

}
TextStyle t25({
  tcolor=Colors.black,
  tfontwt=FontWeight.w500
}){
  return TextStyle(
      color: tcolor,fontWeight: tfontwt,
      fontFamily: 'myfont',
      fontSize: 25
  );
}
Widget container(){
  return Container(
      width:50,
      height:50,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
  color: Color(0xeffffff),
  ),
    child: Icon(Icons.search_rounded,color: Colors.white,size: 30,),
  );
}