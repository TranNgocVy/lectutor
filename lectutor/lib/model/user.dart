import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/course.dart';
import 'package:lectutor/model/learnTopic.dart';
import 'package:lectutor/model/walletInfo.dart';
part 'user.g.dart';

@JsonSerializable()
class User {


  String id;
  String email;
  String name;
  String avatar;
  String country;
  String phone;
  List<String> roles;
  String language;
  String birthday;
  bool isActivated;
  WalletInfo walletInfo;
  List<Course> courses;
  String requireNote;
  String level;
  List<LearnTopic> learnTopics;

  List<String> testPreparations;
  bool isPhoneActivivated;
  int timezone;
  String studySchedule;
  bool canSendMessage;


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User(
      this.id,
      this.email,
      this.name,
      this.avatar,
      this.country,
      this.phone,
      this.roles,
      this.language,
      this.birthday,
      this.isActivated,
      this.walletInfo,
      this.courses,
      this.requireNote,
      this.level,
      this.learnTopics,
      this.testPreparations,
      this.isPhoneActivivated,
      this.timezone,
      this.studySchedule,
      this.canSendMessage);
}