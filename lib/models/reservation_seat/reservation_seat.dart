import 'package:equatable/equatable.dart';

import '../seat/seat.dart';
import '../user/user.dart' as cinnamon_user;

class ReservationSeat extends Equatable {
  cinnamon_user.User? student;
  Seat seat;

  ReservationSeat({required this.seat, this.student});

  @override
  List<Object?> get props => [student, seat];

  @override
  bool get stringify => true;
}
