import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/dependencies.dart';

part 'user.freezed.dart';

part 'user.g.dart';

List<String>? referenceToString(List<dynamic>? references) => references?.map((reference) {
      final ref = reference as DocumentReference;
      return ref.path;
    }).toList();

List<DocumentReference>? stringToReference(List<String>? goals) =>
    goals?.map((goal) => firebaseService.getDocumentReference(doc: goal)).toList();

@freezed
class User extends Equatable with _$User {
  const User._();

  factory User(
      {required String id,
      required String email,
      String? code,
      bool? codeIsVerified,
      bool? isValid,
      String? name,
      String? profilePicture,
      @JsonKey(fromJson: referenceToString, toJson: stringToReference) List<String>? userGoals,
      String? password}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.blank() => User(id: '', email: '');

  @override
  List<Object?> get props => [id, email];

  @override
  bool get stringify => true;
}
