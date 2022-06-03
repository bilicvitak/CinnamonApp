import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_details.freezed.dart';

part 'lesson_details.g.dart';

DateTime timestampToDate(Timestamp timestamp) => timestamp.toDate();

@freezed
class LessonDetails with _$LessonDetails {
  factory LessonDetails({
    required String lessonName,
    required String description,
    required String location,
    required String lectureName,
    @JsonKey(fromJson: timestampToDate) required DateTime lectureStart,
    @JsonKey(fromJson: timestampToDate) required DateTime lectureEnd,
    required String codeLabName,
    @JsonKey(fromJson: timestampToDate) required DateTime codeLabStart,
    @JsonKey(fromJson: timestampToDate) required DateTime codeLabEnd,
    required List<String> fileUrl,
    required int lessonNumber,
  }) = _LessonDetails;

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
}
