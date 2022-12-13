// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorCourseList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorCourseList _$TutorCourseListFromJson(Map<String, dynamic> json) =>
    TutorCourseList(
      json['id'] as String?,
      json['name'] as String?,
      json['TutorCourse'] == null
          ? null
          : TutorCourse.fromJson(json['TutorCourse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TutorCourseListToJson(TutorCourseList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'TutorCourse': instance.tutorCourse,
    };
