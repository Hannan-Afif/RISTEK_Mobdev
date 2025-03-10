import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widget_tree.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: WidgetTree(),
    );
  }
}
