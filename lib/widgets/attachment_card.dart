import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';
import '../screens/lesson_details/lesson_details_controller.dart';

class AttachmentCard extends StatelessWidget {
  final detailsController = Get.find<LessonDetailsController>();

  final String fileName;
  final String fileUrl;

  AttachmentCard({required this.fileName, required this.fileUrl});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => detailsController
          ..selectedFileUrl = fileUrl
          ..goToLessonScreenPdfViewer(),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: FCColors.white,
            border: Border.all(
              color: FCColors.yellow,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    fileName,
                    style: FATextStyles.lessonAttachment,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () => detailsController.saveFile(url: fileUrl, name: fileName),
                  child: SvgPicture.asset(
                    FCIcons.fileDownload,
                    color: FCColors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
