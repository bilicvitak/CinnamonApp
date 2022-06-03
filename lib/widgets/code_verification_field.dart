import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/text_styles.dart';

class CodeVerificationField extends StatelessWidget {
  final int codeLength;

  const CodeVerificationField({
    required this.codeLength,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          for (int i = 0; i < codeLength; ++i)
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: TextField(
                  style: FATextStyles.codeNumbers,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  decoration: const InputDecoration(
                    counterText: '',
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9]'), allow: true),
                  ],

                  /// move to next input field when previous is filled
            
                  onChanged: (str) {
                    if (str.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
            ),
        ],
      );
}
