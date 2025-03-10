import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  final List<String> _tasks = [];
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                style: TextStyle(
                  color: Color(0xFF5038BC),
                  fontWeight: FontWeight.bold,
                ),
              ),
              dense: true,
              subtitle: Text('Deadline', style: TextStyle(color: Colors.amber)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onTap: () {
                print(isChecked);
                setState(() {
                  isChecked = !isChecked;
                });
              },
              
              trailing: IconButton(
                icon: Icon(
                  isChecked
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: Color(0xFF5038BC),
                ),
                onPressed: () {
                  
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
