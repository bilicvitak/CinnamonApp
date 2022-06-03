import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class WhiteButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final double width;
  final double height;
  final Function() onPressed;

  const WhiteButton({
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            primary: FCColors.gray600,
            backgroundColor: FCColors.white,
            shape: const RoundedRectangleBorder(),
            textStyle: FATextStyles.headline,
          ),
          child: Text(text),
        ),
      );
}
