// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lesson_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LessonDetails _$LessonDetailsFromJson(Map<String, dynamic> json) {
  return _LessonDetails.fromJson(json);
}

/// @nodoc
mixin _$LessonDetails {
  String get lessonName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get lectureName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  DateTime get lectureStart => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  DateTime get lectureEnd => throw _privateConstructorUsedError;
  String get codeLabName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  DateTime get codeLabStart => throw _privateConstructorUsedError;
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  DateTime get codeLabEnd => throw _privateConstructorUsedError;
  List<String> get fileUrl => throw _privateConstructorUsedError;
  int get lessonNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonDetailsCopyWith<LessonDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonDetailsCopyWith<$Res> {
  factory $LessonDetailsCopyWith(
          LessonDetails value, $Res Function(LessonDetails) then) =
      _$LessonDetailsCopyWithImpl<$Res>;
  $Res call(
      {String lessonName,
      String description,
      String location,
      String lectureName,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          DateTime lectureStart,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          DateTime lectureEnd,
      String codeLabName,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          DateTime codeLabStart,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          DateTime codeLabEnd,
      List<String> fileUrl,
      int lessonNumber});
}

/// @nodoc
class _$LessonDetailsCopyWithImpl<$Res>
    implements $LessonDetailsCopyWith<$Res> {
  _$LessonDetailsCopyWithImpl(this._value, this._then);

  final LessonDetails _value;
  // ignore: unused_field
  final $Res Function(LessonDetails) _then;

  @override
  $Res call({
    Object? lessonName = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? lectureName = freezed,
    Object? lectureStart = freezed,
    Object? lectureEnd = freezed,
    Object? codeLabName = freezed,
    Object? codeLabStart = freezed,
    Object? codeLabEnd = freezed,
    Object? fileUrl = freezed,
    Object? lessonNumber = freezed,
  }) {
    return _then(_value.copyWith(
      lessonName: lessonName == freezed
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      lectureName: lectureName == freezed
          ? _value.lectureName
          : lectureName // ignore: cast_nullable_to_non_nullable
              as String,
      lectureStart: lectureStart == freezed
          ? _value.lectureStart
          : lectureStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lectureEnd: lectureEnd == freezed
          ? _value.lectureEnd
          : lectureEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codeLabName: codeLabName == freezed
          ? _value.codeLabName
          : codeLabName // ignore: cast_nullable_to_non_nullable
              as String,
      codeLabStart: codeLabStart == freezed
          ? _value.codeLabStart
          : codeLabStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codeLabEnd: codeLabEnd == freezed
          ? _value.codeLabEnd
          : codeLabEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fileUrl: fileUrl == freezed
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lessonNumber: lessonNumber == freezed
          ? _value.lessonNumber
          : lessonNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_LessonDetailsCopyWith<$Res>
    implements $LessonDetailsCopyWith<$Res> {
  factory _$$_LessonDetailsCopyWith(
          _$_LessonDetails value, $Res Function(_$_LessonDetails) then) =
      __$$_LessonDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String lessonName,
      String description,
      String location,
      String lectureName,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          DateTime lectureStart,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          DateTime lectureEnd,
      String codeLabName,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          DateTime codeLabStart,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          DateTime codeLabEnd,
      List<String> fileUrl,
      int lessonNumber});
}

/// @nodoc
class __$$_LessonDetailsCopyWithImpl<$Res>
    extends _$LessonDetailsCopyWithImpl<$Res>
    implements _$$_LessonDetailsCopyWith<$Res> {
  __$$_LessonDetailsCopyWithImpl(
      _$_LessonDetails _value, $Res Function(_$_LessonDetails) _then)
      : super(_value, (v) => _then(v as _$_LessonDetails));

  @override
  _$_LessonDetails get _value => super._value as _$_LessonDetails;

  @override
  $Res call({
    Object? lessonName = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? lectureName = freezed,
    Object? lectureStart = freezed,
    Object? lectureEnd = freezed,
    Object? codeLabName = freezed,
    Object? codeLabStart = freezed,
    Object? codeLabEnd = freezed,
    Object? fileUrl = freezed,
    Object? lessonNumber = freezed,
  }) {
    return _then(_$_LessonDetails(
      lessonName: lessonName == freezed
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      lectureName: lectureName == freezed
          ? _value.lectureName
          : lectureName // ignore: cast_nullable_to_non_nullable
              as String,
      lectureStart: lectureStart == freezed
          ? _value.lectureStart
          : lectureStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lectureEnd: lectureEnd == freezed
          ? _value.lectureEnd
          : lectureEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codeLabName: codeLabName == freezed
          ? _value.codeLabName
          : codeLabName // ignore: cast_nullable_to_non_nullable
              as String,
      codeLabStart: codeLabStart == freezed
          ? _value.codeLabStart
          : codeLabStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      codeLabEnd: codeLabEnd == freezed
          ? _value.codeLabEnd
          : codeLabEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      fileUrl: fileUrl == freezed
          ? _value._fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lessonNumber: lessonNumber == freezed
          ? _value.lessonNumber
          : lessonNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LessonDetails extends _LessonDetails {
  _$_LessonDetails(
      {required this.lessonName,
      required this.description,
      required this.location,
      required this.lectureName,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          required this.lectureStart,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          required this.lectureEnd,
      required this.codeLabName,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          required this.codeLabStart,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          required this.codeLabEnd,
      required final List<String> fileUrl,
      required this.lessonNumber})
      : _fileUrl = fileUrl,
        super._();

  factory _$_LessonDetails.fromJson(Map<String, dynamic> json) =>
      _$$_LessonDetailsFromJson(json);

  @override
  final String lessonName;
  @override
  final String description;
  @override
  final String location;
  @override
  final String lectureName;
  @override
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  final DateTime lectureStart;
  @override
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  final DateTime lectureEnd;
  @override
  final String codeLabName;
  @override
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  final DateTime codeLabStart;
  @override
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  final DateTime codeLabEnd;
  final List<String> _fileUrl;
  @override
  List<String> get fileUrl {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fileUrl);
  }

  @override
  final int lessonNumber;

  @JsonKey(ignore: true)
  @override
  _$$_LessonDetailsCopyWith<_$_LessonDetails> get copyWith =>
      __$$_LessonDetailsCopyWithImpl<_$_LessonDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LessonDetailsToJson(
      this,
    );
  }
}

abstract class _LessonDetails extends LessonDetails {
  factory _LessonDetails(
      {required final String lessonName,
      required final String description,
      required final String location,
      required final String lectureName,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          required final DateTime lectureStart,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          required final DateTime lectureEnd,
      required final String codeLabName,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          required final DateTime codeLabStart,
      @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
          required final DateTime codeLabEnd,
      required final List<String> fileUrl,
      required final int lessonNumber}) = _$_LessonDetails;
  _LessonDetails._() : super._();

  factory _LessonDetails.fromJson(Map<String, dynamic> json) =
      _$_LessonDetails.fromJson;

  @override
  String get lessonName;
  @override
  String get description;
  @override
  String get location;
  @override
  String get lectureName;
  @override
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  DateTime get lectureStart;
  @override
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  DateTime get lectureEnd;
  @override
  String get codeLabName;
  @override
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  DateTime get codeLabStart;
  @override
  @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)
  DateTime get codeLabEnd;
  @override
  List<String> get fileUrl;
  @override
  int get lessonNumber;
  @override
  @JsonKey(ignore: true)
  _$$_LessonDetailsCopyWith<_$_LessonDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
