import 'package:json_annotation/json_annotation.dart';
part 'tutorInfo.g.dart';

@JsonSerializable()
class TutorInfo {

  String level;
  String email;
  String google;
  String facebook;
  String apple;
  String avatar;
  String name;
  String country;
  String phone;
  String language;
  String birthday;
  bool requestPassword;
  bool isActivated;
  String requireNote;
  int timezone;
  String phoneAuth;
  bool isPhoneAuthActivated;
  String studySchedule;
  bool canSendMessage;
  bool isPublicRecord;
  String caredByStaffId;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String studentGroupId;

  factory TutorInfo.fromJson(Map<String, dynamic> json) => _$TutorInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TutorInfoToJson(this);

  TutorInfo(
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
      this.studentGroupId);
}