
import 'dart:convert';

import '../task_1/task.dart';
import 'helpers.dart';

class TaskManager {
  
    addTask({required Task task}){
      var tasks = readTask();
      tasks.add(task.toJson());
      writeTask(tasks);
    }

     viewAll(){
      var tasks = readTask();
      return tasks;
    }

    viewCompleted(){
      var tasks = readTask();
      var completedTasks = [];
      for (var i = 0; i < tasks.length;i++){
        if (tasks[i]["status"] == encodeTaskStatus(TaskStatus.completed)){
          completedTasks.add(tasks[i]);
        }
      }

      return completedTasks;
      
    
    }

     viewPending(){
     var tasks = readTask();
      var pendingTasks = [];
      for (var i = 0; i < tasks.length;i++){
       if (tasks[i]["status"] == encodeTaskStatus(TaskStatus.pending)){
          pendingTasks.add(tasks[i]);
        }
      }
      return pendingTasks;
    }

    Edit(String title , Task task){
      var tasks = readTask();
      for(var i = 0; i < tasks.length;i++){
        if(tasks[i]["title"] == title){
          tasks[i] = task;
          writeTask(tasks);
          return tasks;
        }
      }


      
    }

    delete(title){
      var tasks = readTask();
      print("--------title ${title}");
    
      tasks.removeWhere((task) => task["title"] == title);
      writeTask(tasks);
    }

}

