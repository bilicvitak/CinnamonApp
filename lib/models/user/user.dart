import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

List<String>? referenceToString(List<dynamic>? references) => references?.map((reference) {
      final ref = reference as DocumentReference;
      return ref.path;
    }).toList();

@freezed
class User with _$User {
  factory User(
      {required String id,
      required String email,
      String? code,
      bool? codeIsVerified,
      bool? isValid,
      String? name,
      String? profilePicture,
      @JsonKey(fromJson: referenceToString) List<String>? userGoals,
      String? token,
      String? password}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  factory User.blank() => User(id: '', email: '');
}
