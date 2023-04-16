import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<TaskCard> taskList = [
    TaskCard('Aprenda Flutter sfsdfsdfsdfsdfs', 5, foto: 'assets/images/dash.png'),
    TaskCard('La é mais', 3, foto: 'assets/images/bike.webp'),
    TaskCard('Aprenda Flutter', 1, foto: 'assets/images/meditar.jpeg'),
    TaskCard('Aprenda Firebase', 1),
    TaskCard('Aprenda Provider', 1),
    TaskCard('Aprenda Dart', 1, foto: 'assets/images/profile.png'),
  ];

  void newTask(String name, int difficulty, String photo){
    taskList.add(TaskCard(name, difficulty, foto: photo));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
