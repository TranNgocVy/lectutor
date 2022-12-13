import 'package:json_annotation/json_annotation.dart';
part 'tutorCourse.g.dart';

@JsonSerializable()
class TutorCourse {
  String? UserId;
  String? CourseId;
  String? createdAt;
  String? updatedAt;

  factory TutorCourse.fromJson(Map<String, dynamic> json) => _$TutorCourseFromJson(json);

  Map<String, dynamic> toJson() => _$TutorCourseToJson(this);

  TutorCourse(this.UserId, this.CourseId, this.createdAt, this.updatedAt);
}