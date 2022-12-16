// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookingInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingInfo _$BookingInfoFromJson(Map<String, dynamic> json) => BookingInfo(
      json['createdAtTimeStamp'] as int,
      json['updatedAtTimeStamp'] as int,
      json['id'] as String,
      json['userId'] as String,
      json['scheduleDetailId'] as String,
      json['tutorMeetingLink'] as String,
      json['studentMeetingLink'] as String,
      json['studentRequest'] as String?,
      json['tutorReview'] as String?,
      (json['scoreByTutor'] as num?)?.toDouble(),
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['recordUrl'] as String?,
      json['cancelReasonId'] as String?,
      json['lessonPlanId'] as String?,
      json['cancelNote'] as String?,
      json['calendarId'] as String?,
      json['isDeleted'] as bool?,
      json['scheduleDetailInfo'] == null
          ? null
          : ScheduleDetailInfo.fromJson(
              json['scheduleDetailInfo'] as Map<String, dynamic>),
      json['classReview'] as String?,
      json['showRecordUrl'] as bool?,
      (json['feedbacks'] as List<dynamic>)
          .map((e) => FeedBack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingInfoToJson(BookingInfo instance) =>
    <String, dynamic>{
      'createdAtTimeStamp': instance.createdAtTimeStamp,
      'updatedAtTimeStamp': instance.updatedAtTimeStamp,
      'id': instance.id,
      'userId': instance.userId,
      'scheduleDetailId': instance.scheduleDetailId,
      'tutorMeetingLink': instance.tutorMeetingLink,
      'studentMeetingLink': instance.studentMeetingLink,
      'studentRequest': instance.studentRequest,
      'tutorReview': instance.tutorReview,
      'scoreByTutor': instance.scoreByTutor,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'recordUrl': instance.recordUrl,
      'cancelReasonId': instance.cancelReasonId,
      'lessonPlanId': instance.lessonPlanId,
      'cancelNote': instance.cancelNote,
      'calendarId': instance.calendarId,
      'isDeleted': instance.isDeleted,
      'scheduleDetailInfo': instance.scheduleDetailInfo,
      'classReview': instance.classReview,
      'showRecordUrl': instance.showRecordUrl,
      'feedbacks': instance.feedbacks,
    };
