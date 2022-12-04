import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/topic.dart';

import 'category.dart';
part 'course.g.dart';
@JsonSerializable()
class Course {

  String id;
  String name;
  String description;
  String imageUrl;
  String level;
  String reason;
  String purpose;
  String other_details;
  int default_price;
  int course_price;
  String courseType;
  String sectionType;
  bool visible;
  String displayOrder;
  DateTime createdAt;
  DateTime updatedAt;
  List<Topic> topics;
  List<Category> categories;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  Course(
      this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.level,
      this.reason,
      this.purpose,
      this.other_details,
      this.default_price,
      this.course_price,
      this.courseType,
      this.sectionType,
      this.visible,
      this.displayOrder,
      this.createdAt,
      this.updatedAt,
      this.topics,
      this.categories);
}