import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';

part 'reservation.g.dart';

String referenceToString(DocumentReference reference) => reference.path;

List<Map<String, String>> referencesToString(List<dynamic> references) {
  final paths = references.map((data) => (data as Map<String, dynamic>)
      .map((key, value) => MapEntry(key, (value as DocumentReference).path)));

  return paths.toList();
}

@freezed
class Reservation extends Equatable with _$Reservation {
  const Reservation._();

  factory Reservation({
    @JsonKey(fromJson: referenceToString) required String lectureId,
    @JsonKey(fromJson: referencesToString) required List<Map<String, String>> students,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);

  @override
  List<Object?> get props => [lectureId, students];

  @override
  bool get stringify => true;
}
