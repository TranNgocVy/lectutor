// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorDetail _$TutorDetailFromJson(Map<String, dynamic> json) => TutorDetail(
      json['video'] as String?,
      json['bio'] as String?,
      json['education'] as String?,
      json['experience'] as String?,
      json['profession'] as String?,
      json['accent'] as bool?,
      json['targetStudent'] as String?,
      json['interests'] as String?,
      json['languages'] as String?,
      json['specialties'] as String?,
      (json['rating'] as num?)?.toDouble(),
      json['isNative'] as bool?,
      TutorUser.fromJson(json['User'] as Map<String, dynamic>),
      json['isFavorite'] as bool?,
      (json['avgRating'] as num?)?.toDouble(),
      json['totalFeedback'] as int?,
    )..feedlist = (json['feedlist'] as List<dynamic>)
        .map((e) => FeedBack.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$TutorDetailToJson(TutorDetail instance) =>
    <String, dynamic>{
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
      'rating': instance.rating,
      'isNative': instance.isNative,
      'User': instance.User,
      'isFavorite': instance.isFavorite,
      'avgRating': instance.avgRating,
      'totalFeedback': instance.totalFeedback,
      'feedlist': instance.feedlist,
    };
