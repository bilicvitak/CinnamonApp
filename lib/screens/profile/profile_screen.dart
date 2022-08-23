import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/keys.dart';
import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import 'profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile_screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ProfileController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: FCColors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 1,
          title: Text(
            FAStrings.profileProfile,
            style: FATextStyles.headline,
          ),
        ),
        body: FutureBuilder(
          future: profileController.init(),
          builder: (context, snapshot) => snapshot.hasData
              ? Obx(() => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: 24.h),

                          /// Info description
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FAStrings.profileInfo,
                                style: FATextStyles.headline,
                              ),
                              GestureDetector(
                                onTap: profileController.goToEditProfile,
                                child: Text(
                                  FAStrings.profileEdit,
                                  style: FATextStyles.hyperlink,
                                ),
                              ),
                            ],
                          ),

                          /// Info details
                          Container(
                            margin: EdgeInsets.only(top: 8.h),
                            height: 96.h,
                            color: FCColors.white,
                            child: Padding(
                              padding: EdgeInsets.all(16.r),
                              child: Row(
                                children: [
                                  Container(
                                    key: FAKeys.profilePicture,
                                    width: 64.w,
                                    color: FCColors.white,
                                    child: profileController.user.profilePicture != null
                                        ? Image.network(
                                            profileController.user.profilePicture!,
                                            fit: BoxFit.fitWidth,
                                          )
                                        : SvgPicture.asset(
                                            FCIcons.profilePicturePlaceholder,
                                            color: FCColors.gray300,
                                          ),
                                  ),
                                  SizedBox(width: 24.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        profileController.user.name ?? 'John Doe',
                                        key: FAKeys.profileFullName,
                                        style: FATextStyles.headline,
                                      ),
                                      Text(
                                        profileController.user.email,
                                        key: FAKeys.profileEmail,
                                        style: FATextStyles.description,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 24.h),

                          /// Goals description
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FAStrings.profileGoals,
                                style: FATextStyles.headline,
                              ),
                              GestureDetector(
                                onTap: profileController.goToEditGoals,
                                child: Text(
                                  FAStrings.profileEdit,
                                  style: FATextStyles.hyperlink,
                                ),
                              )
                            ],
                          ),

                          /// Goals
                          Container(
                            key: FAKeys.profileGoalsContainer,
                            margin: EdgeInsets.only(top: 8.h),
                            height: 140.h,
                            color: FCColors.white,
                            child: Padding(
                              padding: EdgeInsets.all(16.r),
                              child: profileController.user.userGoals != null &&
                                      profileController.user.userGoals!.isNotEmpty
                                  ? ListView.builder(
                                      key: FAKeys.profileGoalsList,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: profileController.user.userGoals?.length,
                                      itemBuilder: (context, index) => Text(
                                        profileController
                                            .getGoalName(profileController.user.userGoals![index]),
                                        style: FATextStyles.description,
                                      ),
                                    )
                                  : SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        FAStrings.profileNoGoals,
                                        style: FATextStyles.description,
                                      ),
                                    ),
                            ),
                          ),

                          SizedBox(height: 24.h),

                          /// Settings description
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              FAStrings.profileSettings,
                              style: FATextStyles.headline,
                            ),
                          ),

                          /// Settings
                          Container(
                            margin: EdgeInsets.only(top: 8.h),
                            height: 270.h,
                            child: ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                /// Notifications settings
                                Container(
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  child: ListTile(
                                    title: Text(
                                      FAStrings.profileNotifications,
                                      style: FATextStyles.description,
                                    ),
                                    tileColor: FCColors.white,
                                    shape: Border.all(color: FCColors.gray200),
                                    trailing: GestureDetector(
                                      key: FAKeys.profileNotificationsToggle,
                                      onTap: () => profileController
                                        ..notifications = !profileController.notifications
                                        ..setNotifications(),
                                      child: profileController.notifications
                                          ? SvgPicture.asset(
                                              FCIcons.turnOn,
                                              key: FAKeys.profileNotificationsOn,
                                              height: 31.h,
                                              width: 51.w,
                                            )
                                          : SvgPicture.asset(
                                              FCIcons.turnOff,
                                              key: FAKeys.profileNotificationsOff,
                                              height: 31.h,
                                              width: 51.w,
                                            ),
                                    ),
                                  ),
                                ),

                                /// Dark mode settings
                                Container(
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  child: ListTile(
                                    title: Text(
                                      FAStrings.profileDarkMode,
                                      style: FATextStyles.description,
                                    ),
                                    tileColor: FCColors.white,
                                    shape: Border.all(color: FCColors.gray200),
                                    trailing: GestureDetector(
                                      key: FAKeys.profileDarkModeToggle,
                                      onTap: () => profileController
                                        ..darkMode = !profileController.darkMode
                                        ..setDarkMode(),
                                      child: profileController.darkMode
                                          ? SvgPicture.asset(
                                              FCIcons.turnOn,
                                              key: FAKeys.profileDarkModeOn,
                                              height: 31.h,
                                              width: 51.w,
                                            )
                                          : SvgPicture.asset(
                                              FCIcons.turnOff,
                                              key: FAKeys.profileDarkModeOff,
                                              height: 31.h,
                                              width: 51.w,
                                            ),
                                    ),
                                  ),
                                ),

                                /// Terms & conditions
                                Container(
                                  margin: EdgeInsets.only(bottom: 8.h),
                                  child: GestureDetector(
                                    onTap: profileController.goToTerms,
                                    child: ListTile(
                                      title: Text(
                                        FAStrings.profileTermsCo,
                                        style: FATextStyles.description,
                                      ),
                                      trailing: SvgPicture.asset(FCIcons.chevronRight),
                                      tileColor: FCColors.white,
                                      shape: Border.all(color: FCColors.gray200),
                                    ),
                                  ),
                                ),

                                /// Log out
                                ListTile(
                                  title: GestureDetector(
                                    onTap: profileController.logOut,
                                    child: Text(
                                      FAStrings.profileLogOut,
                                      style: FATextStyles.description,
                                    ),
                                  ),
                                  tileColor: FCColors.white,
                                  shape: Border.all(color: FCColors.gray200),
                                )
                              ],
                            ),
                          ),

                          SizedBox(height: 28.h),
                        ],
                      ),
                    ),
                  ))
              : const SizedBox(
                  width: double.infinity,
                  child: LinearProgressIndicator(
                    color: FCColors.yellow,
                  ),
                ),
        ),
      );
}
