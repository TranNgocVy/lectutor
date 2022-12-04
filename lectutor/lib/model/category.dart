import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';
@JsonSerializable()
class Category {

  String id;
  String title;
  String description;
  String key;
  int displayOrder;
  DateTime createdAt;
  DateTime updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category(this.id, this.title, this.description, this.key, this.displayOrder,
      this.createdAt, this.updatedAt);
}