// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      title: json['title'] as String,
      description: json['description'] as String,
      lectureId:
          referenceToString(json['lectureId'] as DocumentReference<Object?>),
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'lectureId': stringToReference(instance.lectureId),
      'isRead': instance.isRead,
    };
