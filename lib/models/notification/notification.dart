import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';

part 'notification.g.dart';

List<Map<String, dynamic>> referencesToString(List<dynamic> data) {
  final parsedData = data.map((e) => (e as Map<String, dynamic>)
      .map((key, value) {
        if(value is DocumentReference) {
          return MapEntry(key, value.path);
        } else {
          return MapEntry(key, value);
        }
  }));

  return parsedData.toList();
}

@freezed
class Notification with _$Notification{
  factory Notification({
    @JsonKey(fromJson: referencesToString) required List<Map<String, dynamic>> notification,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
