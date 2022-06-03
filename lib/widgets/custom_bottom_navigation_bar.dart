import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/dependencies.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            /// home
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                FCIcons.home,
                color: FCColors.gray600,
              ),
              activeIcon: SvgPicture.asset(
                FCIcons.home,
                color: FCColors.yellow,
              ),
              label: 'Home',
            ),

            /// lessons
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                FCIcons.lessons,
                color: FCColors.gray600,
              ),
              activeIcon: SvgPicture.asset(
                FCIcons.lessons,
                color: FCColors.yellow,
              ),
              label: 'Lessons',
            ),

            /// calendar
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                FCIcons.calendar,
                color: FCColors.gray600,
              ),
              activeIcon: SvgPicture.asset(
                FCIcons.calendar,
                color: FCColors.yellow,
              ),
              label: 'Calendar',
            ),

            /// profile
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                FCIcons.profile,
                color: FCColors.gray600,
              ),
              activeIcon: SvgPicture.asset(
                FCIcons.profile,
                color: FCColors.yellow,
              ),
              label: 'Profile',
            ),
          ],
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedItemColor: FCColors.gray600,
          selectedLabelStyle: FATextStyles.iconDescription,
          unselectedLabelStyle: FATextStyles.iconDescription,
          unselectedItemColor: FCColors.gray600,
          elevation: 2,
          currentIndex: dashboardController.selectedIndex,
          onTap: (index) => dashboardController.selectedIndex = index,
          backgroundColor: FCColors.white,
        ),
      );
}
