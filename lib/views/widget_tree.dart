import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/views/pages/home_page.dart';
import 'package:flutter_application_1/views/pages/profile_page.dart';

import 'widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(
  key: UniqueKey(),
), ProfilePage()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  bool isChecked = false;
  int home = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 0),
          color: (home == 0) ? Colors.white : Color(0xFF5038BC),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'My Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (BuildContext context, dynamic value, Widget? child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (home != value) {
              setState(() {
                home = value;
              });
            }
          });
          return IndexedStack(index: value, children: pages);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
