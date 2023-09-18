import 'package:flutter/material.dart';
import 'package:mockupui/models/task_model.dart';
import 'package:mockupui/models/user_model.dart';
import 'package:hexcolor/hexcolor.dart';

class AppViewModel extends ChangeNotifier{
  List<Task> tasks = <Task>[];
  User user = User("Naila Han");

  Color clrLvl1 = Color.fromARGB(255, 46, 50, 50);
  Color clrLvl2 = HexColor("#9A9590");
  Color clrLvl3 = HexColor("#443C3C");
  Color clrLvl4 = HexColor("#EEEAE7");
  Color clrLvl5 = Color.fromARGB(255, 210, 212, 212);
  
  int get numTasks => tasks.length;

  int get numTasksRemaining => tasks.where((task) => !task.complete).length;

  String get username => user.username;

  void addTask(Task newTask){
    tasks.add(newTask);
    notifyListeners();
  }

  bool getTaskValue(int taskIndex){
    return tasks[taskIndex].complete;
  }

  String getTaskTitle(int taskIndex){
    return tasks[taskIndex].title;
  }

  // Dismiss
  void deleteTask(int taskIndex){
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void setTextValue(int taskIndex, bool taskValue){
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  void updateUsername(String newUsername){
    user.username = newUsername;
    notifyListeners();
  }

  void deleteAllTasks(){
    tasks.clear();
    notifyListeners();
  }

  void deleteCompletedTasks(){
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context) {
          return bottomSheetView;
        }),
        );
  }
}