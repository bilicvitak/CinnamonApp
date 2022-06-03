import '../seat/seat.dart';
import '../user/user.dart' as cinnamon_user;

class ReservationSeat {
  cinnamon_user.User? student;
  Seat seat;

  ReservationSeat({required this.seat, this.student});
}
