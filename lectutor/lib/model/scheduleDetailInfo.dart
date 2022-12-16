import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/scheduleInfo.dart';
import 'package:lectutor/model/tutorCourseList.dart';

import 'bookingInfo.dart';
part 'scheduleDetailInfo.g.dart';

@JsonSerializable()
class ScheduleDetailInfo {

  int startPeriodTimestamp;
  int endPeriodTimestamp;
  String id;
  String scheduleId;
  String startPeriod;
  String endPeriod;
  DateTime createdAt;
  DateTime updatedAt;
  ScheduleInfo scheduleInfo;

  factory ScheduleDetailInfo.fromJson(Map<String, dynamic> json) => _$ScheduleDetailInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleDetailInfoToJson(this);

  ScheduleDetailInfo(
      this.startPeriodTimestamp,
      this.endPeriodTimestamp,
      this.id,
      this.scheduleId,
      this.startPeriod,
      this.endPeriod,
      this.createdAt,
      this.updatedAt,
      this.scheduleInfo);
}