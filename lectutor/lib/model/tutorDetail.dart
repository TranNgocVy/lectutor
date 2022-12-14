import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/tutorUser.dart';

import 'feedBack.dart';
part 'tutorDetail.g.dart';

@JsonSerializable()
class TutorDetail {

  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  bool? accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  double? rating;
  bool? isNative;
  TutorUser User;
  bool? isFavorite;
  double? avgRating;
  int? totalFeedback;
  List<FeedBack> feedlist =[];
  factory TutorDetail.fromJson(Map<String, dynamic> json) => _$TutorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TutorDetailToJson(this);

  TutorDetail(
      this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.accent,
      this.targetStudent,
      this.interests,
      this.languages,
      this.specialties,
      this.rating,
      this.isNative,
      this.User,
      this.isFavorite,
      this.avgRating,
      this.totalFeedback);
}