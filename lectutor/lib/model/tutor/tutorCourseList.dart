import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/tutor/tutorCourse.dart';
part 'tutorCourseList.g.dart';

@JsonSerializable()
class TutorCourseList {

  String? id;
  String? name;
  TutorCourse? tutorCourse;

  factory TutorCourseList.fromJson(Map<String, dynamic> json) => _$TutorCourseListFromJson(json);

  Map<String, dynamic> toJson() => _$TutorCourseListToJson(this);

  TutorCourseList(this.id, this.name, this.tutorCourse);
}