import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 75, 171, 216).withValues(alpha:0.2),
                spreadRadius: 0.5,
                blurRadius: 5.0,
                offset: Offset(0, -1),
                blurStyle: BlurStyle.normal,
              ),
            ],
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
            ),
            child: SizedBox(
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                enableFeedback: false,
                type:BottomNavigationBarType.fixed,
              
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/home_inactive.png',
                      height: 30,
                    ),
                    activeIcon: Image.asset(
                      'assets/images/home_active.png',
                      height: 30,
                    ),                   
                    label: ' ',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/person_inactive.png',
                      height: 30,
                    ),
                    activeIcon: Image.asset(
                      'assets/images/person_active.png',
                      height: 30,
                    ),
                    label: ' ',
                  ),
                ],
                onTap: (value) {
                  print(value);
                  selectedPageNotifier.value = value;
                },
                currentIndex: selectedPage,
              ),
            ),
          ),
        );
      },
    );
  }
}
