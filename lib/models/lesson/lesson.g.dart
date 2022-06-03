// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lesson _$$_LessonFromJson(Map<String, dynamic> json) => _$_Lesson(
      lessonName: json['lessonName'] as String,
      lessonStart: DateTime.parse(json['lessonStart'] as String),
      lessonEnd: DateTime.parse(json['lessonEnd'] as String),
      lessonDetails: json['lessonDetails'] == null
          ? null
          : LessonDetails.fromJson(
              json['lessonDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LessonToJson(_$_Lesson instance) => <String, dynamic>{
      'lessonName': instance.lessonName,
      'lessonStart': instance.lessonStart.toIso8601String(),
      'lessonEnd': instance.lessonEnd.toIso8601String(),
      'lessonDetails': instance.lessonDetails,
    };
