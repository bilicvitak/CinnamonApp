// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LessonDetails _$$_LessonDetailsFromJson(Map<String, dynamic> json) =>
    _$_LessonDetails(
      lessonName: json['lessonName'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      lectureName: json['lectureName'] as String,
      lectureStart: timestampToDate(json['lectureStart'] as Timestamp),
      lectureEnd: timestampToDate(json['lectureEnd'] as Timestamp),
      codeLabName: json['codeLabName'] as String,
      codeLabStart: timestampToDate(json['codeLabStart'] as Timestamp),
      codeLabEnd: timestampToDate(json['codeLabEnd'] as Timestamp),
      fileUrl:
          (json['fileUrl'] as List<dynamic>).map((e) => e as String).toList(),
      lessonNumber: json['lessonNumber'] as int,
    );

Map<String, dynamic> _$$_LessonDetailsToJson(_$_LessonDetails instance) =>
    <String, dynamic>{
      'lessonName': instance.lessonName,
      'description': instance.description,
      'location': instance.location,
      'lectureName': instance.lectureName,
      'lectureStart': instance.lectureStart.toIso8601String(),
      'lectureEnd': instance.lectureEnd.toIso8601String(),
      'codeLabName': instance.codeLabName,
      'codeLabStart': instance.codeLabStart.toIso8601String(),
      'codeLabEnd': instance.codeLabEnd.toIso8601String(),
      'fileUrl': instance.fileUrl,
      'lessonNumber': instance.lessonNumber,
    };
