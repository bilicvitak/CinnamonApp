// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return _Reservation.fromJson(json);
}

/// @nodoc
class _$ReservationTearOff {
  const _$ReservationTearOff();

  _Reservation call(
      {@JsonKey(fromJson: referenceToString)
          required String lectureId,
      @JsonKey(fromJson: referencesToString)
          required List<Map<String, String>> students}) {
    return _Reservation(
      lectureId: lectureId,
      students: students,
    );
  }

  Reservation fromJson(Map<String, Object?> json) {
    return Reservation.fromJson(json);
  }
}

/// @nodoc
const $Reservation = _$ReservationTearOff();

/// @nodoc
mixin _$Reservation {
  @JsonKey(fromJson: referenceToString)
  String get lectureId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: referencesToString)
  List<Map<String, String>> get students => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationCopyWith<Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCopyWith<$Res> {
  factory $ReservationCopyWith(
          Reservation value, $Res Function(Reservation) then) =
      _$ReservationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(fromJson: referenceToString)
          String lectureId,
      @JsonKey(fromJson: referencesToString)
          List<Map<String, String>> students});
}

/// @nodoc
class _$ReservationCopyWithImpl<$Res> implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._value, this._then);

  final Reservation _value;
  // ignore: unused_field
  final $Res Function(Reservation) _then;

  @override
  $Res call({
    Object? lectureId = freezed,
    Object? students = freezed,
  }) {
    return _then(_value.copyWith(
      lectureId: lectureId == freezed
          ? _value.lectureId
          : lectureId // ignore: cast_nullable_to_non_nullable
              as String,
      students: students == freezed
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc
abstract class _$ReservationCopyWith<$Res>
    implements $ReservationCopyWith<$Res> {
  factory _$ReservationCopyWith(
          _Reservation value, $Res Function(_Reservation) then) =
      __$ReservationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(fromJson: referenceToString)
          String lectureId,
      @JsonKey(fromJson: referencesToString)
          List<Map<String, String>> students});
}

/// @nodoc
class __$ReservationCopyWithImpl<$Res> extends _$ReservationCopyWithImpl<$Res>
    implements _$ReservationCopyWith<$Res> {
  __$ReservationCopyWithImpl(
      _Reservation _value, $Res Function(_Reservation) _then)
      : super(_value, (v) => _then(v as _Reservation));

  @override
  _Reservation get _value => super._value as _Reservation;

  @override
  $Res call({
    Object? lectureId = freezed,
    Object? students = freezed,
  }) {
    return _then(_Reservation(
      lectureId: lectureId == freezed
          ? _value.lectureId
          : lectureId // ignore: cast_nullable_to_non_nullable
              as String,
      students: students == freezed
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reservation implements _Reservation {
  _$_Reservation(
      {@JsonKey(fromJson: referenceToString) required this.lectureId,
      @JsonKey(fromJson: referencesToString) required this.students});

  factory _$_Reservation.fromJson(Map<String, dynamic> json) =>
      _$$_ReservationFromJson(json);

  @override
  @JsonKey(fromJson: referenceToString)
  final String lectureId;
  @override
  @JsonKey(fromJson: referencesToString)
  final List<Map<String, String>> students;

  @override
  String toString() {
    return 'Reservation(lectureId: $lectureId, students: $students)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reservation &&
            (identical(other.lectureId, lectureId) ||
                other.lectureId == lectureId) &&
            const DeepCollectionEquality().equals(other.students, students));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, lectureId, const DeepCollectionEquality().hash(students));

  @JsonKey(ignore: true)
  @override
  _$ReservationCopyWith<_Reservation> get copyWith =>
      __$ReservationCopyWithImpl<_Reservation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservationToJson(this);
  }
}

abstract class _Reservation implements Reservation {
  factory _Reservation(
      {@JsonKey(fromJson: referenceToString)
          required String lectureId,
      @JsonKey(fromJson: referencesToString)
          required List<Map<String, String>> students}) = _$_Reservation;

  factory _Reservation.fromJson(Map<String, dynamic> json) =
      _$_Reservation.fromJson;

  @override
  @JsonKey(fromJson: referenceToString)
  String get lectureId;
  @override
  @JsonKey(fromJson: referencesToString)
  List<Map<String, String>> get students;
  @override
  @JsonKey(ignore: true)
  _$ReservationCopyWith<_Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}
