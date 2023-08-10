import 'dart:convert';
import 'dart:io';

import 'manager.dart';
import 'task.dart';



var Manger = TaskManager();

final file = File("./tasks.json");
readTask(){
  final contents = file.readAsStringSync();
   var tasks = jsonDecode(contents);

  return tasks;
}


writeTask(content){
  final newContent = jsonEncode(content);
  file.writeAsStringSync(newContent);
}

readUserInput(){
  final value = stdin.readLineSync();
  return value;
}

printchoise(){
  print("===============================================================================================");
  print("enter 1- add task");
  print("enter 2- veiw all tasks");
  print("enter 3- veiw completed tasks");
  print("enter 4- view pending tasks");
  print("enter 5- edit task");
  print("enter 6- delete task");
  print("enter q to quit");
  print("===============================================================================================");
}
  
 readAddTaskInput(){
    Map<String,String> taskFields =  {};
      print("enter title: ");
      var title = readUserInput();
      taskFields["title"] = title;

      print("enter description: ");
      var desc = readUserInput();
      taskFields["description"] = desc;

      print("enter status 1.completed 2.pending ");
      var status = int.tryParse(readUserInput());
      taskFields["Status"] = "${status}";     
      return taskFields; 
    
}

printAllTask(allTasks){
    if (allTasks != null){
        allTasks.forEach((task){
        print("\n \n \n");
        print("===========================================================");
          print("title => ${task["title"]}");
          print("-----------------------------------------");
          print("description => ${task["description"]}");
          print("-----------------------------------------");
          print("status => ${task["status"]}");
          print("-----------------------------------------");
        print("============================================================");
        print("\n \n \n");
        });

      }
}

helpAddTask(taskFields){
   var CurrStatus = TaskStatus.pending;
      if (taskFields["Status"] == 1){
        CurrStatus = TaskStatus.completed;
      } 
      var newTask = Task(title: taskFields["title"], description: taskFields["description"], status: CurrStatus );
      Manger.addTask(task: newTask);
}

String encodeTaskStatus(TaskStatus status) {
  switch (status) {
    case TaskStatus.pending:
      return 'pending';
    case TaskStatus.completed:
      return 'completed';
    default:
      throw Exception('Unknown task status: $status');
  }
}

helpEditTask(taskFields){
   var CurrStatus = TaskStatus.pending;
      if (taskFields["Status"] == 1){
        CurrStatus = TaskStatus.completed;
      } 
      var newTask = Task(title: taskFields["title"], description: taskFields["description"], status: CurrStatus );
      return newTask;
}

