import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class OutlinedGrayButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double width;
  final double height;

  const OutlinedGrayButton({
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            primary: FCColors.gray600,
            side: const BorderSide(
              color: FCColors.gray600,
            ),
            shape: const RoundedRectangleBorder(),
            textStyle: FATextStyles.headline,
          ),
          child: Text(text),
        ),
      );
}
