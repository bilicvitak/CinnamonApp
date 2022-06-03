import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import '../../widgets/lessons_list.dart';
import 'lessons_controller.dart';

class LessonsScreen extends StatefulWidget {
  static const routeName = '/lessons_screen';

  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}

class _LessonsScreenState extends State<LessonsScreen> {
  late LessonsController lessonsController;

  @override
  void initState() {
    super.initState();
    lessonsController = Get.put(LessonsController());
  }

  @override
  void dispose() {
    Get.delete<LessonsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: FCColors.gray100,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          title: Text(
            FAStrings.lessonsLessons,
            style: FATextStyles.headline,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: LessonsList(),
        ),
      );
}
