// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String,
      json['email'] as String,
      json['name'] as String,
      json['avatar'] as String?,
      json['country'] as String?,
      json['phone'] as String?,
      (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['language'] as String?,
      json['birthday'] as String?,
      json['isActivated'] as bool?,
      json['walletInfo'] == null
          ? null
          : WalletInfo.fromJson(json['walletInfo'] as Map<String, dynamic>),
      (json['courses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['requireNote'] as String?,
      json['level'] as String?,
      (json['learnTopics'] as List<dynamic>?)
          ?.map((e) => LearnTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['testPreparations'] as List<dynamic>?)
          ?.map((e) => TestPreparation.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['timezone'] as int?,
      json['studySchedule'] as String?,
      json['canSendMessage'] as bool?,
    )
      ..tutorInfo = json['tutorInfo'] == null
          ? null
          : Tutor.fromJson(json['tutorInfo'] as Map<String, dynamic>)
      ..isPhoneActivivated = json['isPhoneActivivated'] as bool?
      ..studentGroup = json['studentGroup'] as String?
      ..studentInfo = json['studentInfo'] as String?
      ..avgRating = (json['avgRating'] as num?)?.toDouble();

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'roles': instance.roles,
      'language': instance.language,
      'birthday': instance.birthday,
      'isActivated': instance.isActivated,
      'tutorInfo': instance.tutorInfo,
      'walletInfo': instance.walletInfo,
      'courses': instance.courses,
      'requireNote': instance.requireNote,
      'level': instance.level,
      'learnTopics': instance.learnTopics,
      'testPreparations': instance.testPreparations,
      'isPhoneActivivated': instance.isPhoneActivivated,
      'timezone': instance.timezone,
      'studySchedule': instance.studySchedule,
      'canSendMessage': instance.canSendMessage,
      'studentGroup': instance.studentGroup,
      'studentInfo': instance.studentInfo,
      'avgRating': instance.avgRating,
    };
