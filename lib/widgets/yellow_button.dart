import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class YellowButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final Function() onPressed;

  const YellowButton({
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 55.h,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            primary: enabled ? FCColors.gray600 : FCColors.gray600.withOpacity(0.4),
            backgroundColor: enabled ? FCColors.yellow : FCColors.yellow.withOpacity(0.4),
            shape: const RoundedRectangleBorder(),
            textStyle: FATextStyles.headline,
          ),
          child: Text(text),
        ),
      );
}
