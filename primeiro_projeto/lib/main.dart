import 'package:flutter/material.dart';
import 'package:primeiro_projeto/data/task_inherited.dart';
import 'screens/form_screen.dart';
import 'screens/initial_screen.dart';
//import 'package:primeiro_projeto/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          // useMaterial3: true,
          primarySwatch: Colors.grey,
        ),
        home: TaskInherited(child: const InitialScreen()),
    );
  }
}
