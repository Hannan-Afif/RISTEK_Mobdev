import 'package:flutter/material.dart';

class TaskNotifier extends ChangeNotifier {
  final List<String> _tasks = [];
  final TextEditingController controller = TextEditingController();
  bool isChecked = false;

  List<String> get tasks => _tasks;

  void addTask() {
    if (controller.text.isNotEmpty) {
      _tasks.add(controller.text);
      controller.clear();
      notifyListeners(); // Notify UI to rebuild
    }
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners(); // Notify UI to rebuild
  }

  void toggleCheck() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
