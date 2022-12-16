// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorInfo _$TutorInfoFromJson(Map<String, dynamic> json) => TutorInfo(
      json['level'] as String?,
      json['email'] as String?,
      json['google'] as String?,
      json['facebook'] as String?,
      json['apple'] as String?,
      json['avatar'] as String?,
      json['name'] as String?,
      json['country'] as String?,
      json['phone'] as String?,
      json['language'] as String?,
      json['birthday'] as String?,
      json['requestPassword'] as bool?,
      json['isActivated'] as bool?,
      json['requireNote'] as String?,
      json['timezone'] as int?,
      json['phoneAuth'] as String?,
      json['isPhoneAuthActivated'] as bool?,
      json['studySchedule'] as String?,
      json['canSendMessage'] as bool?,
      json['isPublicRecord'] as bool?,
      json['caredByStaffId'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      json['studentGroupId'] as String?,
    )..id = json['id'] as String?;

Map<String, dynamic> _$TutorInfoToJson(TutorInfo instance) => <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'email': instance.email,
      'google': instance.google,
      'facebook': instance.facebook,
      'apple': instance.apple,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'phone': instance.phone,
      'language': instance.language,
      'birthday': instance.birthday,
      'requestPassword': instance.requestPassword,
      'isActivated': instance.isActivated,
      'requireNote': instance.requireNote,
      'timezone': instance.timezone,
      'phoneAuth': instance.phoneAuth,
      'isPhoneAuthActivated': instance.isPhoneAuthActivated,
      'studySchedule': instance.studySchedule,
      'canSendMessage': instance.canSendMessage,
      'isPublicRecord': instance.isPublicRecord,
      'caredByStaffId': instance.caredByStaffId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'studentGroupId': instance.studentGroupId,
    };
