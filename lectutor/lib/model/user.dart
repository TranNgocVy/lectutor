import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/walletInfo.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
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
      this.requireNote,
      this.level,
      this.isPhoneActivivated,
      this.timezone,
      this.canSendMessage);

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
  // Courses[] course;
  String requireNote;
  String level;
  // Topocs[] learTopics;
  bool isPhoneActivivated;
  int timezone;
  bool canSendMessage;


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}