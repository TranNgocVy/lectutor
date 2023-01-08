import 'package:json_annotation/json_annotation.dart';
part 'topic.g.dart';
@JsonSerializable()
class Topic {

  String? id;
  String? courseId;
  int? orderCourse;
  String? name;
  String? nameFile;
  int? numberOfPages;
  String? description;
  String? videoUrl;
  String? type;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);

  Topic(
      this.id,
      this.courseId,
      this.orderCourse,
      this.name,
      this.numberOfPages,
      this.description,
      this.videoUrl,
      this.type,
      this.createdAt,
      this.updatedAt);
}