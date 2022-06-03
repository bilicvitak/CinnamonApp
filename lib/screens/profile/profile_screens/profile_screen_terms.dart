import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
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
                  'Floofs doggorino bork puggorino adorable doggo, bork ur givin me a spook stop it fren. Long bois bork pupperino stop it fren, pats fluffer. You are doin me a concern aqua doggo fluffer shoob he made many woofs adorable doggo, fluffer long doggo wow such tempt. Super chub puggo doggorino most angery pupper I have ever seen, very good spot. Shooberino wow such tempt h*ck much ruin diet, you are doing me the shock. Most angery pupper I have ever seen doggorino the neighborhood pupper dat tungg tho bork boofers shoober, h*ck dat tungg tho doggo most angery pupper I have ever seen you are doin me a concern. Yapper doggorino super chub lotsa pats bork, he made many woofs smol borking doggo with a long snoot for pats much ruin diet. Ruff bork you are doing me the shock pupperino porgo heckin angery woofer porgo, you are doing me the shock I am bekom fat thicc wow very biscit adorable doggo.',
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
