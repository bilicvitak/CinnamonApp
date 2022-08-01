import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_details.freezed.dart';

part 'lesson_details.g.dart';

DateTime timestampToDate(Timestamp timestamp) => timestamp.toDate();

Timestamp dateToTimestamp(DateTime dateTime) => Timestamp.fromDate(dateTime);

@freezed
class LessonDetails extends Equatable with _$LessonDetails {
  const LessonDetails._();

  factory LessonDetails(
      {required String lessonName,
      required String description,
      required String location,
      required String lectureName,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp) required DateTime lectureStart,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp) required DateTime lectureEnd,
      required String codeLabName,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp) required DateTime codeLabStart,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp) required DateTime codeLabEnd,
      required List<String> fileUrl,
      required int lessonNumber}) = _LessonDetails;

  factory LessonDetails.fromJson(Map<String, dynamic> json) => _$LessonDetailsFromJson(json);

  factory LessonDetails.blank() => LessonDetails(
        lessonName: '',
        description: '',
        location: '',
        lectureName: '',
        lectureStart: DateTime.now(),
        lectureEnd: DateTime.now(),
        codeLabName: '',
        codeLabStart: DateTime.now(),
        codeLabEnd: DateTime.now(),
        fileUrl: [],
        lessonNumber: 0,
      );

  @override
  List<Object?> get props => [
        lessonName,
        description,
        location,
        lectureName,
        lectureStart,
        lectureEnd,
        codeLabName,
        codeLabStart,
        codeLabEnd,
        fileUrl,
        lessonNumber,
      ];

  @override
  bool get stringify => true;
}
