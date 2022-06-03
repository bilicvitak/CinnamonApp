import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class FATextStyles {
  static const headline = TextStyle(
    color: FCColors.gray600,
    fontFamily: 'MontHeavy',
    fontSize: 16,
    fontWeight: FontWeight.w800,
  );

  static const description = TextStyle(
    color: FCColors.gray600,
    fontFamily: 'MontExtraLight',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 2,
  );

  static const linkDescription = TextStyle(
    color: FCColors.gray600,
    fontFamily: 'MontExtraLight',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
  );

  static const errorDescription = TextStyle(
    color: FCColors.red,
    fontFamily: 'MontExtraLight',
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const codeNumbers = TextStyle(
    color: FCColors.gray600,
    fontFamily: 'MontExtraLight',
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static const iconDescription = TextStyle(
    color: FCColors.gray600,
    fontFamily: 'MontExtraLight',
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const lessonTitle = TextStyle(
    color: FCColors.gray600,
    fontFamily: 'MontHeavy',
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );

  static const lessonAttachment = TextStyle(
    color: FCColors.gray600,
    fontFamily: 'MontHeavy',
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );

  static const studentName = TextStyle(
    color: FCColors.white,
    fontFamily: 'MontHeavy',
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const calendarNumbers = TextStyle(
    color: FCColors.gray600,
    fontFamily: 'MontExtraLight',
    fontSize: 12,
    fontWeight: FontWeight.w900,
  );

  static const calendarDays = TextStyle(
    color: FCColors.gray600,
    fontFamily: 'MontHeavy',
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const hyperlink = TextStyle(
    color: FCColors.yellow,
    fontFamily: 'MontExtraLight',
    fontSize: 16,
    fontWeight: FontWeight.w900,
  );
}
