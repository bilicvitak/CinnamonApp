import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../lesson_details/lesson_details.dart';

part 'lesson.freezed.dart';

part 'lesson.g.dart';

@freezed
class Lesson with _$Lesson {
  const Lesson._();

  factory Lesson({
    required String lessonName,
    required DateTime lessonStart,
    required DateTime lessonEnd,
    LessonDetails? lessonDetails,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Lesson && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}
