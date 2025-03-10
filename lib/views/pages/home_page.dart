import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/views/pages/edit_page.dart';

class Tasks {
  String task = "";
  bool check = false;

  Tasks(this.task, this.check);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Tasks> _tasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() async {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(Tasks(_controller.text, false));
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
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<String>(
                  valueListenable: usernameNotifier,
                  builder: (context, value, child) {
                    return Text(
                      'Welcome $value!',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                Text(
                  'Have a nice day!',
                  style: TextStyle(fontSize: 15.0),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(7.0),
            color: Colors.white,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5038BC), // Change to your desired color
                foregroundColor: Colors.white, // Text/Icon color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ), // Optional: Adjust border radius
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ), // Adjust padding
              ),
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
                    border: Border.all(color: Color(0xFFE2E0F2), width: 1.0),
                  ),
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _removeTask(index);
                      },
                    ),
                    title: Text(
                      _tasks[index].task,
                      style: TextStyle(
                        color: Color(0xFF5038BC),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    dense: true,
                    // subtitle: Text(
                    //   'Deadline',
                    //   style: TextStyle(color: Colors.amber),
                    // ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onTap: () {
                      setState(() {
                        _tasks[index].check = !_tasks[index].check;
                      });
                    },
                    leading: IconButton(
                      icon: Icon(
                        _tasks[index].check
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: Color(0xFF5038BC),
                      ),
                      onPressed: () {
                        setState(() {
                          _tasks[index].check = !_tasks[index].check;
                        });
                      },
                    ),
                    onLongPress: () async {
                      bool? updated = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  EditPage(index: index, tasks: _tasks),
                        ),
                      );
                      //Refresh the UI
                      if (updated == true) {
                        setState(() {});
                      }
                    },
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
