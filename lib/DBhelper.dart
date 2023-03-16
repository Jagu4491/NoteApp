import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  var notetable = 'note';
  var columnid = "column_id";
  var columntitle = 'column_title';
  var columndesc = 'note_desc';
  //var columncolor='note_color';
  var columndate='note_date';

  Future<Database> opendb() async {
    var directory = await getApplicationDocumentsDirectory();
    await directory.create(recursive: true);
    var path = directory.path + "note_db.db";

    return await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          'create table $notetable($columnid integer primary key autoincrement,'
          '$columntitle text,'
          '$columndesc text,$columndate Text)');
    });
  }

  Future<int> addData(String title, String desc,String date) async {
    var mydb = await opendb();

    return await mydb.insert(notetable, {columntitle: title, columndesc: desc,columndate:date});
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    var mydb = await opendb();
    return mydb.query(notetable);
  }

  Future<int> deleteData(int id) async{
var mydb= await opendb();
//mydb.delete(notetable);
return await mydb.delete(notetable,where: "$columnid=?",whereArgs: ['$id']);
  }
  Future<int> UpdateData(String title,String desc,String date,int id) async{
    var mydb= await opendb();
//mydb.delete(notetable);
    return await mydb.update(notetable,{columntitle: title, columndesc: desc,columndate:date},where: "$columnid=?",whereArgs: ['$id']);
  }
}
