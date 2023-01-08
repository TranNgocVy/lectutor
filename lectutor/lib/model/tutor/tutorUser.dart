import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/tutor/tutorCourseList.dart';
part 'tutorUser.g.dart';

@JsonSerializable()
class TutorUser {

  String id;
  String? level;
  String? avatar;
  String? name;
  String? country;
  String? language;
  bool? isPublicRecord;
  bool? caredByStaffId;
  String? studentGroupId;
  List<TutorCourseList> courses;

  factory TutorUser.fromJson(Map<String, dynamic> json) => _$TutorUserFromJson(json);

  Map<String, dynamic> toJson() => _$TutorUserToJson(this);

  TutorUser(
      this.id,
      this.level,
      this.avatar,
      this.name,
      this.country,
      this.language,
      this.isPublicRecord,
      this.caredByStaffId,
      this.studentGroupId,
      this.courses);
}