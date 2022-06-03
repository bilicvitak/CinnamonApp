import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';

class YellowBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: Get.back,
        icon: SvgPicture.asset(
          FCIcons.chevronLeft,
          height: 24.h,
          width: 24.w,
          color: FCColors.yellow,
        ),
      );
}
