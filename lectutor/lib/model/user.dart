import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/course.dart';
import 'package:lectutor/model/learnTopic.dart';
import 'package:lectutor/model/testPreparation.dart';
import 'package:lectutor/model/walletInfo.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

part 'user.g.dart';

@JsonSerializable()
class User with ChangeNotifier, DiagnosticableTreeMixin{
  // String id;
  // String email;
  // String name;
  // String avatar;
  // String country;
  // String phone;
  // List<String> roles;
  // String language;
  // String birthday;
  // bool isActivated;
  // WalletInfo walletInfo;
  // List<Course> courses;
  // String requireNote;
  // String level;
  // List<LearnTopic> learnTopics;
  //
  // List<TestPreparation> testPreparations;
  // // bool isPhoneActivivated;
  // int timezone;
  // String studySchedule;
  // bool canSendMessage;

  String id;
  String email;
  String name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  WalletInfo? walletInfo;
  List<Course>? courses;
  String? requireNote;
  String? level;
  List<LearnTopic>? learnTopics;

  List<TestPreparation>? testPreparations;
  // bool isPhoneActivivated;
  int? timezone;
  String? studySchedule;
  bool? canSendMessage;


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
      // this.isPhoneActivivated,
      this.timezone,
      this.studySchedule,
      this.canSendMessage);

  void update(User user) {
    id = user.id;
    email = user.email;
    name = user.name;
    avatar = user.avatar;
    country = user.country;
    phone = user.phone;
    roles = user.roles;
    language = user.language;
    birthday = user.birthday;
    isActivated = user.isActivated;
    walletInfo = user.walletInfo;
    courses = user.courses;
    requireNote = user.requireNote;
    level = user.level;
    learnTopics = user.learnTopics;
    testPreparations = user.testPreparations;
    // isPhoneActivivated = user.isPhoneActivivated;
    timezone = user.timezone;
    studySchedule = user.studySchedule;
    canSendMessage = user.canSendMessage;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(StringProperty(name, value)Property('id', id));
  // }

}