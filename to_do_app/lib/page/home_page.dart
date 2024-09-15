import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
TodoDataBase db = TodoDataBase();

//if this is the 1st time ever open in the app, then create default data
@override
  void initState() {
    if (_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      //there already exist data
      db.loadDatabase();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value; 
    });
    db.updateDatabase();
  }

  //save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([
        _controller.text,
        false
      ]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();

  }

  // create a new task
  void createNewTask(){
    showDialog(
      context: context,
      builder:(context)  {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancle:() => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete a task
  void deleteTask(int index){
 setState(() {
   db.toDoList.removeAt(index);
 });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        elevation: 0,
        title: const Text('TO DO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: db.toDoList.length, 
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunciton: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
