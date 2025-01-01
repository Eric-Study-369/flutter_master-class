import 'package:flutter/material.dart';
import 'package:flutter_tutorial/todo_app/data/database.dart';
import 'package:flutter_tutorial/todo_app/todo_tile.dart';
import 'package:flutter_tutorial/todo_app/dialog__box.dart';
import 'package:hive/hive.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final _myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  final _controller = TextEditingController();

  @override
  void initState() {
    if (_myBox.get("ToDOList") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void checkboxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTaske() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTaske,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: Text("To Do"),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewtask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: db.toDoList[index][0],
                taskComplete: db.toDoList[index][1],
                onChange: (value) => checkboxChange(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }
}
