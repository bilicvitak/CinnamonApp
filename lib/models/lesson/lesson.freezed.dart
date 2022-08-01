// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
class _$LessonTearOff {
  const _$LessonTearOff();

  _Lesson call(
      {required String lessonName,
      required DateTime lessonStart,
      required DateTime lessonEnd,
      @JsonKey(toJson: lessonDetailsToJson, fromJson: lessonDetailsFromJson)
          LessonDetails? lessonDetails}) {
    return _Lesson(
      lessonName: lessonName,
      lessonStart: lessonStart,
      lessonEnd: lessonEnd,
      lessonDetails: lessonDetails,
    );
  }

  Lesson fromJson(Map<String, Object?> json) {
    return Lesson.fromJson(json);
  }
}

/// @nodoc
const $Lesson = _$LessonTearOff();

/// @nodoc
mixin _$Lesson {
  String get lessonName => throw _privateConstructorUsedError;
  DateTime get lessonStart => throw _privateConstructorUsedError;
  DateTime get lessonEnd => throw _privateConstructorUsedError;
  @JsonKey(toJson: lessonDetailsToJson, fromJson: lessonDetailsFromJson)
  LessonDetails? get lessonDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonCopyWith<Lesson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) =
      _$LessonCopyWithImpl<$Res>;
  $Res call(
      {String lessonName,
      DateTime lessonStart,
      DateTime lessonEnd,
      @JsonKey(toJson: lessonDetailsToJson, fromJson: lessonDetailsFromJson)
          LessonDetails? lessonDetails});

  $LessonDetailsCopyWith<$Res>? get lessonDetails;
}

/// @nodoc
class _$LessonCopyWithImpl<$Res> implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  final Lesson _value;
  // ignore: unused_field
  final $Res Function(Lesson) _then;

  @override
  $Res call({
    Object? lessonName = freezed,
    Object? lessonStart = freezed,
    Object? lessonEnd = freezed,
    Object? lessonDetails = freezed,
  }) {
    return _then(_value.copyWith(
      lessonName: lessonName == freezed
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String,
      lessonStart: lessonStart == freezed
          ? _value.lessonStart
          : lessonStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lessonEnd: lessonEnd == freezed
          ? _value.lessonEnd
          : lessonEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lessonDetails: lessonDetails == freezed
          ? _value.lessonDetails
          : lessonDetails // ignore: cast_nullable_to_non_nullable
              as LessonDetails?,
    ));
  }

  @override
  $LessonDetailsCopyWith<$Res>? get lessonDetails {
    if (_value.lessonDetails == null) {
      return null;
    }

    return $LessonDetailsCopyWith<$Res>(_value.lessonDetails!, (value) {
      return _then(_value.copyWith(lessonDetails: value));
    });
  }
}

/// @nodoc
abstract class _$LessonCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$LessonCopyWith(_Lesson value, $Res Function(_Lesson) then) =
      __$LessonCopyWithImpl<$Res>;
  @override
  $Res call(
      {String lessonName,
      DateTime lessonStart,
      DateTime lessonEnd,
      @JsonKey(toJson: lessonDetailsToJson, fromJson: lessonDetailsFromJson)
          LessonDetails? lessonDetails});

  @override
  $LessonDetailsCopyWith<$Res>? get lessonDetails;
}

/// @nodoc
class __$LessonCopyWithImpl<$Res> extends _$LessonCopyWithImpl<$Res>
    implements _$LessonCopyWith<$Res> {
  __$LessonCopyWithImpl(_Lesson _value, $Res Function(_Lesson) _then)
      : super(_value, (v) => _then(v as _Lesson));

  @override
  _Lesson get _value => super._value as _Lesson;

  @override
  $Res call({
    Object? lessonName = freezed,
    Object? lessonStart = freezed,
    Object? lessonEnd = freezed,
    Object? lessonDetails = freezed,
  }) {
    return _then(_Lesson(
      lessonName: lessonName == freezed
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String,
      lessonStart: lessonStart == freezed
          ? _value.lessonStart
          : lessonStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lessonEnd: lessonEnd == freezed
          ? _value.lessonEnd
          : lessonEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lessonDetails: lessonDetails == freezed
          ? _value.lessonDetails
          : lessonDetails // ignore: cast_nullable_to_non_nullable
              as LessonDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lesson extends _Lesson {
  _$_Lesson(
      {required this.lessonName,
      required this.lessonStart,
      required this.lessonEnd,
      @JsonKey(toJson: lessonDetailsToJson, fromJson: lessonDetailsFromJson)
          this.lessonDetails})
      : super._();

  factory _$_Lesson.fromJson(Map<String, dynamic> json) =>
      _$$_LessonFromJson(json);

  @override
  final String lessonName;
  @override
  final DateTime lessonStart;
  @override
  final DateTime lessonEnd;
  @override
  @JsonKey(toJson: lessonDetailsToJson, fromJson: lessonDetailsFromJson)
  final LessonDetails? lessonDetails;

  @JsonKey(ignore: true)
  @override
  _$LessonCopyWith<_Lesson> get copyWith =>
      __$LessonCopyWithImpl<_Lesson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LessonToJson(this);
  }
}

abstract class _Lesson extends Lesson {
  factory _Lesson(
      {required String lessonName,
      required DateTime lessonStart,
      required DateTime lessonEnd,
      @JsonKey(toJson: lessonDetailsToJson, fromJson: lessonDetailsFromJson)
          LessonDetails? lessonDetails}) = _$_Lesson;
  _Lesson._() : super._();

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$_Lesson.fromJson;

  @override
  String get lessonName;
  @override
  DateTime get lessonStart;
  @override
  DateTime get lessonEnd;
  @override
  @JsonKey(toJson: lessonDetailsToJson, fromJson: lessonDetailsFromJson)
  LessonDetails? get lessonDetails;
  @override
  @JsonKey(ignore: true)
  _$LessonCopyWith<_Lesson> get copyWith => throw _privateConstructorUsedError;
}
