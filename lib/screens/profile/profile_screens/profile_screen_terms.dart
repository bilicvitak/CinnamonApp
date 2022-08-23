import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../constants/keys.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';
import '../../../widgets/yellow_back_button.dart';

class ProfileScreenTerms extends StatelessWidget {
  static const routeName = '/profile_screen_terms';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          leading: YellowBackButton(),
          title: Text(
            FAStrings.profileTermsCo,
            style: FATextStyles.headline,
          ),
        ),
        body: SingleChildScrollView(
          key: FAKeys.profileTermsScrollView,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Terms & Conditions headline
                Container(
                  margin: EdgeInsets.only(top: 24.h, bottom: 8.h),
                  child: Text(
                    FAStrings.profileTermsCo,
                    style: FATextStyles.headline,
                  ),
                ),

                /// Terms & Conditions text
                Text(
                  FAStrings.profileTermsText,
                  style: FATextStyles.description,
                  textAlign: TextAlign.justify,
                ),

                /// Privacy policy headline
                Container(
                  margin: EdgeInsets.only(top: 24.h, bottom: 8.h),
                  child: Text(
                    FAStrings.profilePrivacyPolicy,
                    style: FATextStyles.headline,
                  ),
                ),

                /// Privacy policy text
                Container(
                  margin: EdgeInsets.only(bottom: 32.h),
                  child: Text(
                    FAStrings.profilePrivacyPolicyText,
                    style: FATextStyles.description,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
