import 'package:json_annotation/json_annotation.dart';
part 'learnTopic.g.dart';

@JsonSerializable()
class LearnTopic {


  int? id;
  String? key;
  String? name;

  factory LearnTopic.fromJson(Map<String, dynamic> json) => _$LearnTopicFromJson(json);

  Map<String, dynamic> toJson() => _$LearnTopicToJson(this);

  LearnTopic(this.id, this.key, this.name);
}