import 'package:flutter/foundation.dart';
import 'package:noteapp2/DBhelper.dart';

class NoteProvider extends ChangeNotifier{

  List<Map<String,dynamic>> myData=[];

//add note function
  void addNote(String title,String desc,String date) async{
    await DBhelper().addData(title, desc, date);
    myData=await DBhelper().fetchData();
    notifyListeners();
  }

  //get note function
  void getNote() async{
    myData=await DBhelper().fetchData();
    notifyListeners();
  }

  void delNote(int id)async{
    await DBhelper().deleteData(id);
    myData=await DBhelper().fetchData();
    notifyListeners();
  }

  void updateNote(String title,String desc,String date ,int id)async{
    await DBhelper().UpdateData(title, desc, date, id);
    notifyListeners();

  }
}