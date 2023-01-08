// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorUser _$TutorUserFromJson(Map<String, dynamic> json) => TutorUser(
      json['id'] as String,
      json['level'] as String?,
      json['avatar'] as String?,
      json['name'] as String?,
      json['country'] as String?,
      json['language'] as String?,
      json['isPublicRecord'] as bool?,
      json['caredByStaffId'] as bool?,
      json['studentGroupId'] as String?,
      (json['courses'] as List<dynamic>)
          .map((e) => TutorCourseList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TutorUserToJson(TutorUser instance) => <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'avatar': instance.avatar,
      'name': instance.name,
      'country': instance.country,
      'language': instance.language,
      'isPublicRecord': instance.isPublicRecord,
      'caredByStaffId': instance.caredByStaffId,
      'studentGroupId': instance.studentGroupId,
      'courses': instance.courses,
    };
