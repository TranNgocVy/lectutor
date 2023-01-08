// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduleDetailInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDetailInfo _$ScheduleDetailInfoFromJson(Map<String, dynamic> json) =>
    ScheduleDetailInfo(
      json['startPeriodTimestamp'] as int,
      json['endPeriodTimestamp'] as int,
      json['id'] as String,
      json['scheduleId'] as String,
      json['startPeriod'] as String,
      json['endPeriod'] as String,
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
      ScheduleInfo.fromJson(json['scheduleInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScheduleDetailInfoToJson(ScheduleDetailInfo instance) =>
    <String, dynamic>{
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'id': instance.id,
      'scheduleId': instance.scheduleId,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'scheduleInfo': instance.scheduleInfo,
    };
