import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/tutorInfo.dart';
part 'feedBack.g.dart';
@JsonSerializable()
class FeedBack {

  String id;
  String bookingId;
  String firstId;
  String secondId;
  int rating;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  TutorInfo firstInfo;

  factory FeedBack.fromJson(Map<String, dynamic> json) => _$FeedBackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedBackToJson(this);

  FeedBack(this.id, this.bookingId, this.firstId, this.secondId, this.rating,
      this.content, this.createdAt, this.updatedAt, this.firstInfo);
}