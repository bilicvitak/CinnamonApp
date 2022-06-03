import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/dependencies.dart';
import '../constants/icons.dart';
import '../constants/text_styles.dart';
import '../models/reservation_seat/reservation_seat.dart';

class SeatCard extends StatelessWidget {
  final ReservationSeat reservation;
  final bool isSelected;
  final bool isReserved;
  final double angle;
  final Function() onTap;

  const SeatCard({
    required this.reservation,
    required this.onTap,
    this.isSelected = false,
    this.isReserved = false,
    this.angle = 0,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: reservation.student != null &&
                reservation.student?.id == firebaseService.firebaseUser.value?.uid
            ? Stack(
                fit: StackFit.expand,
                children: [
                  Transform.rotate(
                    angle: angle,
                    child: SvgPicture.asset(FCIcons.seatReserved),
                  ),
                  Container(
                    margin: angle == 0 ? EdgeInsets.only(bottom: 28.h) : EdgeInsets.only(top: 29.h),
                    alignment: angle == 0 ? Alignment.bottomCenter : Alignment.topCenter,
                    child: Text(
                      reservation.student?.name ?? 'Student',
                      style: FATextStyles.studentName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            : isReserved
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      Transform.rotate(
                        angle: angle,
                        child: SvgPicture.asset(FCIcons.seatUnavailable),
                      ),
                      Container(
                        margin:
                            angle == 0 ? EdgeInsets.only(bottom: 28.h) : EdgeInsets.only(top: 29.h),
                        alignment: angle == 0 ? Alignment.bottomCenter : Alignment.topCenter,
                        child: Text(
                          reservation.student?.name ?? 'Student',
                          style: FATextStyles.studentName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                : isSelected
                    ? Transform.rotate(
                        angle: angle,
                        child: SvgPicture.asset(FCIcons.seatSelected),
                      )
                    : Transform.rotate(
                        angle: angle,
                        child: SvgPicture.asset(FCIcons.seatAvailable),
                      ),
      );
}
