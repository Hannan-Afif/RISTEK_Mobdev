import 'package:flutter/material.dart';

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
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<String> _tasks = [];
  final TextEditingController _controller = TextEditingController();
  bool isChecked = false;

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text);
      });
      _controller.clear();
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter a task',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(color: Colors.blue),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: _addTask,
              child: const Text('Add Task'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(8.0), // Atur jarak kanan & kiri
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    border: Border.all(color: Color(0xFFE2E0F2), width: 1.0),
                  ),
                  child: ListTile(
                    title: Text(
                      _tasks[index],
                      style: TextStyle(color: Color(0xFF5038BC), fontWeight: FontWeight.bold,),
                      ),
                    dense: true,
                    subtitle: Text(
                      'Deadline',
                      style: TextStyle(color: Colors.amber),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onTap: (){
                      print(isChecked);
                      setState(() {
                      isChecked = !isChecked;
                    });
                    },
                    trailing: IconButton(
                      icon: Icon(
                       isChecked ? Icons.radio_button_checked : Icons.radio_button_off,
                       color: Color(0xFF5038BC)),
                      onPressed: () => _removeTask(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
