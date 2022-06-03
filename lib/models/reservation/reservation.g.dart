// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reservation _$$_ReservationFromJson(Map<String, dynamic> json) =>
    _$_Reservation(
      lectureId:
          referenceToString(json['lectureId'] as DocumentReference<Object?>),
      students: referencesToString(json['students'] as List),
    );

Map<String, dynamic> _$$_ReservationToJson(_$_Reservation instance) =>
    <String, dynamic>{
      'lectureId': instance.lectureId,
      'students': instance.students,
    };
