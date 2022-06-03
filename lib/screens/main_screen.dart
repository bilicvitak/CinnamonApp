import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/dependencies.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'calendar/calendar_screen.dart';
import 'home/home_screen.dart';
import 'lessons/lessons_screen.dart';
import 'profile/profile_screen.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main_screen';
  static const routeNameTransition = '/main_screen_transition';

  final _widgets = <Widget>[
    HomeScreen(),
    LessonsScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: FCColors.gray100,
        body: Obx(
          () => SafeArea(
            child: _widgets.elementAt(dashboardController.selectedIndex),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      );
}
