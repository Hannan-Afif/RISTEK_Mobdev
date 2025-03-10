import 'package:flutter/material.dart';
import 'home_page.dart';

class EditPage extends StatefulWidget {
  final int index;
  final List<Tasks> tasks;
  const EditPage({super.key, required this.index, required this.tasks});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController _controller = TextEditingController();
  String temporary = "";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.tasks[widget.index].task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF5038BC),
      appBar: AppBar(backgroundColor: Color(0xFF5038BC)),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(75.0),
            topRight: Radius.circular(75.0),
          ),
        ),
        margin: EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Text(
              widget.tasks[widget.index].task,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5038BC),
                height: 3.0,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Title',

                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFF5038BC),
                    height: 3.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 5.0,
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter a task',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(10, 10),
                    backgroundColor: Color(0xFF5038BC),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async{
                    setState(() {
                      widget.tasks[widget.index].task = _controller.text;
                    });
                    Navigator.pop(context, true);
                  },
                  child: Text('Edit Task'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

