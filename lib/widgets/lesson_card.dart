import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';

class LessonCard extends StatelessWidget {
  final String lessonName;
  final String lessonDate;

  const LessonCard({
    required this.lessonName,
    required this.lessonDate,
  });

  @override
  Widget build(BuildContext context) => Container(
    color: FCColors.white,
    child: Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lessonName,
                    style: FATextStyles.headline,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    lessonDate,
                    style: FATextStyles.iconDescription,
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    FCIcons.chevronRight,
                    color: FCColors.gray600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
