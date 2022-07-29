import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'seat.freezed.dart';

part 'seat.g.dart';

@freezed
class Seat extends Equatable with _$Seat {
  const Seat._();

  factory Seat({
    required String id,
    required String name,
    required int position,
  }) = _Seat;

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);

  factory Seat.blank() => Seat(id: '', name: '', position: -1);

  @override
  List<Object> get props => [
        id,
        name,
        position,
      ];

  @override
  bool get stringify => true;
}
