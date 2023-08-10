import 'dart:io';

import 'helpers.dart';
import 'manager.dart';
import 'task.dart';
void main(){
var Manger = TaskManager();

while (true){
  print("===============================================================================================");
  print("\u{1D11E} well come to To-do ${String.fromCharCode(0x1F4D6)}");
  print("===============================================================================================");
  printchoise();

  
  var choise = readUserInput();


    if (choise == "1"){
      var taskFields = readAddTaskInput();
      helpAddTask(taskFields);
    }

    else if (choise == "2") {
      var allTasks = Manger.viewAll();
      printAllTask(allTasks);
      
    }
    else if (choise == "3") {
      var completed = Manger.viewCompleted();
      printAllTask(completed);
    }

    else if (choise == "4") {
      var pending = Manger.viewPending();
      printAllTask(pending);
    }

    else if (choise == "5") {
        var title = readUserInput();
        var taskFields = readAddTaskInput();
        var task = helpEditTask(taskFields);
        Manger.Edit(title, task);
       
    }

    else if (choise == "6") {
      print("enter the title of the task");
      var title = readUserInput();
      Manger.delete(title);
      
    }

    else if (choise == "q") {
      break;
    }

    else {
      print("invalid input");
    }
  }
}

  