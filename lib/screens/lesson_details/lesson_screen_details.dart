import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/dependencies.dart';
import '../../constants/keys.dart';
import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import '../../widgets/attachment_card.dart';
import '../../widgets/outlined_gray_button.dart';
import '../../widgets/rating_bar.dart';
import '../../widgets/schedule_painter.dart';
import '../../widgets/yellow_back_button.dart';
import '../../widgets/yellow_button.dart';
import 'lesson_details_controller.dart';

class LessonScreenDetails extends StatelessWidget {
  static const routeName = '/lesson_screen_details';
  final detailsController = Get.find<LessonDetailsController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: FCColors.gray100,
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: FCColors.white,
          leading: YellowBackButton(),
          title: Obx(
            () => Text(
              detailsController.lesson.lessonName,
              style: FATextStyles.headline,
            ),
          ),
        ),
        body: Obx(
          () => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              /// lesson details

              SingleChildScrollView(
                key: FAKeys.lessonDetailsScrollView,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 24.h,
                          right: 16.w,
                          bottom: detailsController.isPastLesson ? 32.h : 136.h,
                          left: 16.w),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            /// description text
                            Text(
                              FAStrings.lessonsDescription,
                              key: FAKeys.lessonDescription,
                              style: FATextStyles.headline,
                            ),

                            /// lesson description
                            Text(
                              detailsController.lesson.description,
                              style: FATextStyles.description,
                            ),

                            /// blank space
                            SizedBox(height: 24.h),

                            /// lesson schedule text
                            Text(
                              FAStrings.lessonsLessonSchedule,
                              style: FATextStyles.headline,
                            ),

                            /// lesson schedule calendar
                            Container(
                              height: 304.h,
                              margin: EdgeInsets.only(top: 8.h, bottom: 24.h),
                              color: FCColors.white,
                              child: CustomPaint(
                                painter: SchedulePainter(
                                  lessonLecture: detailsController.getLecture(),
                                  lessonCodeLab: detailsController.getCodeLab(),
                                ),
                              ),
                            ),

                            /// location text
                            Text(
                              FAStrings.lessonsLocation,
                              style: FATextStyles.headline,
                            ),

                            /// lesson location
                            Text(
                              detailsController.lesson.location,
                              key: FAKeys.lessonLocation,
                              style: FATextStyles.description,
                            ),

                            /// blank space
                            SizedBox(height: 24.h),

                            /// date text
                            Text(
                              FAStrings.lessonsDate,
                              style: FATextStyles.headline,
                            ),

                            /// lesson date
                            Text(
                              dashboardController.writeLessonDate(detailsController.getLesson()),
                              key: FAKeys.lessonDate,
                              style: FATextStyles.description,
                            ),

                            /// blank space
                            SizedBox(height: 24.h),

                            /// Attachemnts text
                            Text(
                              FAStrings.lessonsAttachments,
                              style: FATextStyles.headline,
                            ),

                            /// Attachments ListView
                            SizedBox(
                              height: (detailsController.lesson.fileUrl.length * 80).h,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: detailsController.lesson.fileUrl.length,
                                  itemBuilder: (context, index) {
                                    final fileUrl = detailsController.lesson.fileUrl[index];
                                    return AttachmentCard(
                                      fileName: detailsController.getFileName(fileUrl),
                                      fileUrl: fileUrl,
                                    );
                                  }),
                            ),

                            if (detailsController.isPastLesson)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// blank space
                                  SizedBox(height: 16.h),

                                  /// rating text
                                  Text(
                                    FAStrings.lessonsRating,
                                    style: FATextStyles.headline,
                                  ),

                                  SizedBox(height: 8.h),

                                  /// rating bar
                                  const RatingBar(maxRating: 5),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// reserve button
              if (!detailsController.isPastLesson)
                if (detailsController.isSeatReserved)
                  Container(
                    margin: EdgeInsets.only(top: 8.h),
                    color: FCColors.yellow,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h, right: 16.w, bottom: 32.h, left: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${FAStrings.lessonsSelectedSeat}\n${detailsController.reservedSeat.name}',
                            style: FATextStyles.headline,
                          ),
                          OutlinedGrayButton(
                            width: 160.w,
                            height: 56.h,
                            text: FAStrings.buttonChange,
                            onPressed: detailsController.goToLessonReservations,
                          )
                        ],
                      ),
                    ),
                  )
                else
                  Container(
                    color: FCColors.gray100,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h, right: 16.w, bottom: 32.h, left: 16.w),
                      child: YellowButton(
                        text: FAStrings.buttonReserve,
                        enabled: !detailsController.isPastLesson,
                        onPressed: detailsController.goToLessonReservations,
                      ),
                    ),
                  ),
            ],
          ),
        ),
      );
}
