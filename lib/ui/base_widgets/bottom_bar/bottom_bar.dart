import 'package:flutter/material.dart';
import 'package:school_managment/config/app_colors.dart';
import 'package:school_managment/route/app_routes.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedItemColor:  Theme.of(context).colorScheme.onBackground,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded), label: 'Classes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              if (currentIndex == 0) {
                return;
              }
              Navigator.pushReplacementNamed(context, AppRoutes.home);
              break;
            case 1:
              if (currentIndex == 1) {
                return;
              }
              Navigator.pushReplacementNamed(context, AppRoutes.chat);
              break;
            case 2:
              if (currentIndex == 2) {
                return;
              }
              Navigator.pushReplacementNamed(context, AppRoutes.classes);
              break;
            case 3:
              if (currentIndex == 3) {
                return;
              }
              Navigator.pushReplacementNamed(context, AppRoutes.profile);
              break;
          }
        });
  }
}
