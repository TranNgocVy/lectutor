import 'package:json_annotation/json_annotation.dart';
import 'feedBack.dart';
part 'tutor.g.dart';

@JsonSerializable()
class Tutor {

  String? level;
  String? email;
  String? google;
  String? facebook;
  String? apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  String? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  String? requireNote;
  int? timezone;
  String? phoneAuth;
  bool? isPhoneAuthActivated;
  String? studySchedule;
  bool? canSendMessage;
  bool? isPublicRecord;
  String? caredByStaffId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String? studentGroupId;
  List<FeedBack>? feedbacks;
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  String? resume;
  double? rating;
  bool? isNative;
  int? price;
  bool? isOnline;

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);

  Map<String, dynamic> toJson() => _$TutorToJson(this);

  Tutor(
      this.level,
      this.email,
      this.google,
      this.facebook,
      this.apple,
      this.avatar,
      this.name,
      this.country,
      this.phone,
      this.language,
      this.birthday,
      this.requestPassword,
      this.isActivated,
      this.isPhoneActivated,
      this.requireNote,
      this.timezone,
      this.phoneAuth,
      this.isPhoneAuthActivated,
      this.studySchedule,
      this.canSendMessage,
      this.isPublicRecord,
      this.caredByStaffId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.studentGroupId,
      this.feedbacks,
      this.id,
      this.userId,
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
      this.resume,
      this.rating,
      this.isNative,
      this.price,
      this.isOnline);
}