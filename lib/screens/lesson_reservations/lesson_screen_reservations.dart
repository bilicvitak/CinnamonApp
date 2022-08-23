import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../constants/keys.dart';
import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import '../../widgets/outlined_gray_button.dart';
import '../../widgets/seat_card.dart';
import '../../widgets/white_button.dart';
import 'lesson_reservations_controller.dart';

class LessonScreenReservations extends StatelessWidget {
  static const routeName = '/lesson_screen_reservations';
  final lessonReservationsController = Get.find<LessonReservationsController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: FCColors.gray100,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: FCColors.white,
          elevation: 1,
          leading: IconButton(
            key: FAKeys.reservationsClose,
            onPressed: lessonReservationsController.getBackAndRefresh,
            icon: SvgPicture.asset(
              FCIcons.close,
              height: 24.h,
              width: 24.w,
              color: FCColors.yellow,
            ),
          ),
          title: Text(
            FAStrings.buttonReserveSeat,
            style: FATextStyles.headline,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => lessonReservationsController.reservationsDetails.isEmpty
                  ? const LinearProgressIndicator()
                  : Padding(
                      padding: EdgeInsets.only(top: 24.h, right: 16.w, left: 16.w),
                      child: SizedBox(
                        height: Get.height * 0.65,
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 8.w,
                              crossAxisCount: 3,
                            ),
                            itemCount: lessonReservationsController.reservationsDetails.length,
                            itemBuilder: (context, index) => index % 6 == 0 ||
                                    index % 6 == 1 ||
                                    index % 6 == 2
                                ? Obx(
                                    () => SeatCard(
                                      reservation:
                                          lessonReservationsController.reservationsDetails[index]!,
                                      isSelected: index ==
                                          lessonReservationsController.selectedSeat.position,
                                      isReserved: lessonReservationsController
                                              .reservationsDetails[index]!.student !=
                                          null,
                                      onTap: () => lessonReservationsController.isSeatReserved
                                          ? null
                                          : lessonReservationsController
                                                      .reservationsDetails[index]!.student !=
                                                  null
                                              ? null
                                              : lessonReservationsController.selectedSeat =
                                                  lessonReservationsController
                                                      .reservationsDetails[index]!.seat,
                                    ),
                                  )
                                : Obx(
                                    () => SeatCard(
                                      reservation:
                                          lessonReservationsController.reservationsDetails[index]!,
                                      isSelected: index ==
                                          lessonReservationsController.selectedSeat.position,
                                      isReserved: lessonReservationsController
                                              .reservationsDetails[index]!.student !=
                                          null,
                                      angle: pi,
                                      onTap: () => lessonReservationsController.isSeatReserved
                                          ? null
                                          : lessonReservationsController
                                                      .reservationsDetails[index]!.student !=
                                                  null
                                              ? null
                                              : lessonReservationsController.selectedSeat =
                                                  lessonReservationsController
                                                      .reservationsDetails[index]!.seat,
                                    ),
                                  )),
                      ),
                    ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8.w),
                            height: 16.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                              color: FCColors.gray300,
                              border: Border.all(
                                color: FCColors.gray500,
                              ),
                            ),
                          ),
                          Text(
                            FAStrings.lessonsSeatAvailable,
                            style: FATextStyles.iconDescription,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8.w),
                            height: 16.h,
                            width: 16.w,
                            color: FCColors.red,
                          ),
                          Text(
                            FAStrings.lessonsSeatNotAvailable,
                            style: FATextStyles.iconDescription,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8.w),
                            height: 16.h,
                            width: 16.w,
                            decoration: BoxDecoration(border: Border.all(color: FCColors.yellow)),
                          ),
                          Text(
                            FAStrings.lessonsSeatSelected,
                            style: FATextStyles.iconDescription,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                /// reserve seat
                Container(
                  margin: EdgeInsets.only(top: 8.h),
                  color: FCColors.yellow,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h, right: 16.w, bottom: 32.h, left: 16.w),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${FAStrings.lessonsSelectedSeat}\n${lessonReservationsController.selectedSeat.name}',
                            style: FATextStyles.headline,
                          ),
                          if (lessonReservationsController.isSeatReserved)
                            OutlinedGrayButton(
                              width: 160.w,
                              height: 56.h,
                              text: FAStrings.buttonCancel,
                              onPressed: lessonReservationsController.cancelReservation,
                            )
                          else
                            WhiteButton(
                              text: FAStrings.buttonReserve,
                              width: 160.w,
                              height: 56.h,
                              onPressed: lessonReservationsController.reserveSeat,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
