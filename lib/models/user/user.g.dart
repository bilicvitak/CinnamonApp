// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      email: json['email'] as String,
      code: json['code'] as String?,
      codeIsVerified: json['codeIsVerified'] as bool?,
      isValid: json['isValid'] as bool?,
      name: json['name'] as String?,
      profilePicture: json['profilePicture'] as String?,
      userGoals: referenceToString(json['userGoals'] as List?),
      token: json['token'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'code': instance.code,
      'codeIsVerified': instance.codeIsVerified,
      'isValid': instance.isValid,
      'name': instance.name,
      'profilePicture': instance.profilePicture,
      'userGoals': instance.userGoals,
      'token': instance.token,
      'password': instance.password,
    };
