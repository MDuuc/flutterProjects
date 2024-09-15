import 'package:hive_flutter/adapters.dart';

class TodoDataBase{

List toDoList =[];

  //refercence out box
  final _myBox = Hive.box('myBox');

  // run this method if this is the 1st time ever
  void createInitialData(){
    toDoList=[
      ["Make Tutorial", false],
      ['Do exercise', false]
    ];
  }
  
  // load the data from database
  void loadDatabase(){
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void  updateDatabase(){
    _myBox.put("TODOLIST", toDoList);

  }
}