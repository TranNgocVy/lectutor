// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorCourse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorCourse _$TutorCourseFromJson(Map<String, dynamic> json) => TutorCourse(
      json['UserId'] as String?,
      json['CourseId'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$TutorCourseToJson(TutorCourse instance) =>
    <String, dynamic>{
      'UserId': instance.UserId,
      'CourseId': instance.CourseId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
