// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduleInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleInfo _$ScheduleInfoFromJson(Map<String, dynamic> json) => ScheduleInfo(
      json['date'] as String,
      json['startTimestamp'] as int,
      json['endTimestamp'] as int,
      json['id'] as String,
      json['tutorId'] as String,
      json['startTime'] as String,
      json['endTime'] as String,
      json['isDeleted'] as bool,
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
      TutorInfo.fromJson(json['tutorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleInfoToJson(ScheduleInfo instance) =>
    <String, dynamic>{
      'date': instance.date,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'id': instance.id,
      'tutorId': instance.tutorId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'tutorInfo': instance.tutorInfo,
    };
