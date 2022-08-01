// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String id,
      required String email,
      String? code,
      bool? codeIsVerified,
      bool? isValid,
      String? name,
      String? profilePicture,
      @JsonKey(fromJson: referenceToString, toJson: stringToReference)
          List<String>? userGoals,
      String? password}) {
    return _User(
      id: id,
      email: email,
      code: code,
      codeIsVerified: codeIsVerified,
      isValid: isValid,
      name: name,
      profilePicture: profilePicture,
      userGoals: userGoals,
      password: password,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  bool? get codeIsVerified => throw _privateConstructorUsedError;
  bool? get isValid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;
  @JsonKey(fromJson: referenceToString, toJson: stringToReference)
  List<String>? get userGoals => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String email,
      String? code,
      bool? codeIsVerified,
      bool? isValid,
      String? name,
      String? profilePicture,
      @JsonKey(fromJson: referenceToString, toJson: stringToReference)
          List<String>? userGoals,
      String? password});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? code = freezed,
    Object? codeIsVerified = freezed,
    Object? isValid = freezed,
    Object? name = freezed,
    Object? profilePicture = freezed,
    Object? userGoals = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      codeIsVerified: codeIsVerified == freezed
          ? _value.codeIsVerified
          : codeIsVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      userGoals: userGoals == freezed
          ? _value.userGoals
          : userGoals // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String email,
      String? code,
      bool? codeIsVerified,
      bool? isValid,
      String? name,
      String? profilePicture,
      @JsonKey(fromJson: referenceToString, toJson: stringToReference)
          List<String>? userGoals,
      String? password});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? code = freezed,
    Object? codeIsVerified = freezed,
    Object? isValid = freezed,
    Object? name = freezed,
    Object? profilePicture = freezed,
    Object? userGoals = freezed,
    Object? password = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      codeIsVerified: codeIsVerified == freezed
          ? _value.codeIsVerified
          : codeIsVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isValid: isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      userGoals: userGoals == freezed
          ? _value.userGoals
          : userGoals // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {required this.id,
      required this.email,
      this.code,
      this.codeIsVerified,
      this.isValid,
      this.name,
      this.profilePicture,
      @JsonKey(fromJson: referenceToString, toJson: stringToReference)
          this.userGoals,
      this.password})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? code;
  @override
  final bool? codeIsVerified;
  @override
  final bool? isValid;
  @override
  final String? name;
  @override
  final String? profilePicture;
  @override
  @JsonKey(fromJson: referenceToString, toJson: stringToReference)
  final List<String>? userGoals;
  @override
  final String? password;

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User(
      {required String id,
      required String email,
      String? code,
      bool? codeIsVerified,
      bool? isValid,
      String? name,
      String? profilePicture,
      @JsonKey(fromJson: referenceToString, toJson: stringToReference)
          List<String>? userGoals,
      String? password}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get code;
  @override
  bool? get codeIsVerified;
  @override
  bool? get isValid;
  @override
  String? get name;
  @override
  String? get profilePicture;
  @override
  @JsonKey(fromJson: referenceToString, toJson: stringToReference)
  List<String>? get userGoals;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
