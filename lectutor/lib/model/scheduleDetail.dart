import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/tutorCourseList.dart';

import 'bookingInfo.dart';
part 'scheduleDetail.g.dart';

@JsonSerializable()
class ScheduleDetail {


  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<BookingInfo> bookingInfo = [];
  bool? isBooked;

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) => _$ScheduleDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleDetailToJson(this);

  ScheduleDetail(
      this.startPeriodTimestamp,
      this.endPeriodTimestamp,
      this.id,
      this.scheduleId,
      this.startPeriod,
      this.endPeriod,
      this.createdAt,
      this.updatedAt,
      this.bookingInfo,
      this.isBooked);
}