// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutor _$TutorFromJson(Map<String, dynamic> json) => Tutor(
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
      json['isPhoneActivated'] as bool?,
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
      (json['feedbacks'] as List<dynamic>?)
          ?.map((e) => FeedBack.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['id'] as String?,
      json['userId'] as String?,
      json['video'] as String?,
      json['bio'] as String?,
      json['education'] as String?,
      json['experience'] as String?,
      json['profession'] as String?,
      json['accent'] as String?,
      json['targetStudent'] as String?,
      json['interests'] as String?,
      json['languages'] as String?,
      json['specialties'] as String?,
      json['resume'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['isNative'] as String?,
      json['price'] as int?,
      json['isOnline'] as bool?,
    );

Map<String, dynamic> _$TutorToJson(Tutor instance) => <String, dynamic>{
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
      'isPhoneActivated': instance.isPhoneActivated,
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
      'feedbacks': instance.feedbacks,
      'id': instance.id,
      'userId': instance.userId,
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'accent': instance.accent,
      'targetStudent': instance.targetStudent,
      'interests': instance.interests,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'resume': instance.resume,
      'rating': instance.rating,
      'isNative': instance.isNative,
      'price': instance.price,
      'isOnline': instance.isOnline,
    };
