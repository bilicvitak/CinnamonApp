import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';

class YellowCloseButton extends StatelessWidget {
  final String routeName;
  final String routeUntil;

  const YellowCloseButton({required this.routeName, required this.routeUntil});

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => Get.offNamedUntil(routeName, (route) => route.settings.name == routeUntil),
        icon: SvgPicture.asset(
          FCIcons.close,
          height: 24.h,
          width: 24.w,
          color: FCColors.yellow,
        ),
      );
}
