import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/dependencies.dart';

part 'notification.freezed.dart';

part 'notification.g.dart';

String referenceToString(DocumentReference reference) => reference.path;

DocumentReference stringToReference(String lectureId) =>
    firebaseService.getDocumentReference(doc: lectureId);

@freezed
class Notification with _$Notification {
  factory Notification({
    required String title,
    required String description,
    @JsonKey(fromJson: referenceToString, toJson: stringToReference) required String lectureId,
    required bool isRead,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
