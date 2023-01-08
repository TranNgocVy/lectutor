// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduleDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDetail _$ScheduleDetailFromJson(Map<String, dynamic> json) =>
    ScheduleDetail(
      json['startPeriodTimestamp'] as int?,
      json['endPeriodTimestamp'] as int?,
      json['id'] as String?,
      json['scheduleId'] as String?,
      json['startPeriod'] as String?,
      json['endPeriod'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      (json['bookingInfo'] as List<dynamic>)
          .map((e) => BookingInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isBooked'] as bool?,
    );

Map<String, dynamic> _$ScheduleDetailToJson(ScheduleDetail instance) =>
    <String, dynamic>{
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'id': instance.id,
      'scheduleId': instance.scheduleId,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'bookingInfo': instance.bookingInfo,
      'isBooked': instance.isBooked,
    };
