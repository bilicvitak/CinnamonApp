// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'seat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Seat _$SeatFromJson(Map<String, dynamic> json) {
  return _Seat.fromJson(json);
}

/// @nodoc
mixin _$Seat {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeatCopyWith<Seat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeatCopyWith<$Res> {
  factory $SeatCopyWith(Seat value, $Res Function(Seat) then) =
      _$SeatCopyWithImpl<$Res>;
  $Res call({String id, String name, int position});
}

/// @nodoc
class _$SeatCopyWithImpl<$Res> implements $SeatCopyWith<$Res> {
  _$SeatCopyWithImpl(this._value, this._then);

  final Seat _value;
  // ignore: unused_field
  final $Res Function(Seat) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_SeatCopyWith<$Res> implements $SeatCopyWith<$Res> {
  factory _$$_SeatCopyWith(_$_Seat value, $Res Function(_$_Seat) then) =
      __$$_SeatCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, int position});
}

/// @nodoc
class __$$_SeatCopyWithImpl<$Res> extends _$SeatCopyWithImpl<$Res>
    implements _$$_SeatCopyWith<$Res> {
  __$$_SeatCopyWithImpl(_$_Seat _value, $Res Function(_$_Seat) _then)
      : super(_value, (v) => _then(v as _$_Seat));

  @override
  _$_Seat get _value => super._value as _$_Seat;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? position = freezed,
  }) {
    return _then(_$_Seat(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Seat extends _Seat {
  _$_Seat({required this.id, required this.name, required this.position})
      : super._();

  factory _$_Seat.fromJson(Map<String, dynamic> json) => _$$_SeatFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int position;

  @JsonKey(ignore: true)
  @override
  _$$_SeatCopyWith<_$_Seat> get copyWith =>
      __$$_SeatCopyWithImpl<_$_Seat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SeatToJson(
      this,
    );
  }
}

abstract class _Seat extends Seat {
  factory _Seat(
      {required final String id,
      required final String name,
      required final int position}) = _$_Seat;
  _Seat._() : super._();

  factory _Seat.fromJson(Map<String, dynamic> json) = _$_Seat.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get position;
  @override
  @JsonKey(ignore: true)
  _$$_SeatCopyWith<_$_Seat> get copyWith => throw _privateConstructorUsedError;
}
