import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/tutor/tutorCourseList.dart';

import '../tutor/tutorInfo.dart';

part 'scheduleInfo.g.dart';

@JsonSerializable()
class ScheduleInfo {

  String date;
  int startTimestamp;
  int endTimestamp;
  String id;
  String tutorId;
  String startTime;
  String endTime;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  TutorInfo tutorInfo;

  factory ScheduleInfo.fromJson(Map<String, dynamic> json) => _$ScheduleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleInfoToJson(this);

  ScheduleInfo(this.date, this.startTimestamp, this.endTimestamp, this.id,
      this.tutorId, this.startTime, this.endTime, this.isDeleted,
      this.createdAt, this.updatedAt, this.tutorInfo);


}