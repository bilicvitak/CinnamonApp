import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'seat.freezed.dart';

part 'seat.g.dart';

@freezed
class Seat with _$Seat {
  factory Seat({
    required String id,
    required String name,
    required int position,
  }) = _Seat;

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);

  factory Seat.blank() => Seat(id: '', name: '', position: -1);
}
