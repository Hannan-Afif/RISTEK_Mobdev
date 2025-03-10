import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _controllerName = TextEditingController(text: 'Hannan Afif Darmawan');
  final TextEditingController _controllerNickname = TextEditingController(text: 'Hannan');
  final TextEditingController _controllerHobbies = TextEditingController(text: 'Typing');
  final TextEditingController _controllerSocialMedia = TextEditingController(text: '@hannanad03');
  File? _image;

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _controllerName = TextEditingController(text: usernameNotifier.value);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(backgroundColor: Color(0xFF5038BC), elevation: 0,),
      backgroundColor: Color(0xFF5038BC),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(
                  top: 30.0,
                  left: 50.0,
                  right: 50.0,
                  bottom: 0.0,
                ),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child:
                        _image == null
                            ? Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.white,
                            )
                            : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField('Full Name', _controllerName),
              _buildTextField('Nickname', _controllerNickname),
              _buildTextField('Hobbies', _controllerHobbies),
              _buildTextField('Social Media', _controllerSocialMedia),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 15.0, color: Color(0xFF5038BC), ),
          ),
          SizedBox(height: 5),
          TextField(
            onSubmitted: (value) async {
              if (_controllerName.text == value) {
                usernameNotifier.value = value;
              }
            },
            controller: controller,
            readOnly: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 11,
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(50)),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
