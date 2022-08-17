// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return _Reservation.fromJson(json);
}

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
abstract class _$$_ReservationCopyWith<$Res>
    implements $ReservationCopyWith<$Res> {
  factory _$$_ReservationCopyWith(
          _$_Reservation value, $Res Function(_$_Reservation) then) =
      __$$_ReservationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(fromJson: referenceToString)
          String lectureId,
      @JsonKey(fromJson: referencesToString)
          List<Map<String, String>> students});
}

/// @nodoc
class __$$_ReservationCopyWithImpl<$Res> extends _$ReservationCopyWithImpl<$Res>
    implements _$$_ReservationCopyWith<$Res> {
  __$$_ReservationCopyWithImpl(
      _$_Reservation _value, $Res Function(_$_Reservation) _then)
      : super(_value, (v) => _then(v as _$_Reservation));

  @override
  _$_Reservation get _value => super._value as _$_Reservation;

  @override
  $Res call({
    Object? lectureId = freezed,
    Object? students = freezed,
  }) {
    return _then(_$_Reservation(
      lectureId: lectureId == freezed
          ? _value.lectureId
          : lectureId // ignore: cast_nullable_to_non_nullable
              as String,
      students: students == freezed
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Map<String, String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reservation extends _Reservation {
  _$_Reservation(
      {@JsonKey(fromJson: referenceToString)
          required this.lectureId,
      @JsonKey(fromJson: referencesToString)
          required final List<Map<String, String>> students})
      : _students = students,
        super._();

  factory _$_Reservation.fromJson(Map<String, dynamic> json) =>
      _$$_ReservationFromJson(json);

  @override
  @JsonKey(fromJson: referenceToString)
  final String lectureId;
  final List<Map<String, String>> _students;
  @override
  @JsonKey(fromJson: referencesToString)
  List<Map<String, String>> get students {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  @JsonKey(ignore: true)
  @override
  _$$_ReservationCopyWith<_$_Reservation> get copyWith =>
      __$$_ReservationCopyWithImpl<_$_Reservation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReservationToJson(
      this,
    );
  }
}

abstract class _Reservation extends Reservation {
  factory _Reservation(
      {@JsonKey(fromJson: referenceToString)
          required final String lectureId,
      @JsonKey(fromJson: referencesToString)
          required final List<Map<String, String>> students}) = _$_Reservation;
  _Reservation._() : super._();

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
  _$$_ReservationCopyWith<_$_Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}
