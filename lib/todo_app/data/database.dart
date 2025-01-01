import 'package:hive/hive.dart';

class TodoDatabase {
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load data from database
  void loadData() {
    toDoList = _myBox.get("ToDOList");
  }

  // update database
  void updateData() {
    _myBox.put("ToDOList", toDoList);
  }
}
