import 'package:json_annotation/json_annotation.dart';
import 'package:lectutor/model/scheduleDetailInfo.dart';
part 'bookingInfo.g.dart';

@JsonSerializable()
class BookingInfo {


  int createdAtTimeStamp;
  int updatedAtTimeStamp;
  String id;
  String userId;
  String scheduleDetailId;
  String tutorMeetingLink;
  String studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  double? scoreByTutor;
  String? createdAt;
  String? updatedAt;
  String? recordUrl;
  String? cancelReasonId;
  String? lessonPlanId;
  String? cancelNote;
  String? calendarId;
  bool? isDeleted;
  ScheduleDetailInfo? scheduleDetailInfo;

  factory BookingInfo.fromJson(Map<String, dynamic> json) => _$BookingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BookingInfoToJson(this);

  BookingInfo(
      this.createdAtTimeStamp,
      this.updatedAtTimeStamp,
      this.id,
      this.userId,
      this.scheduleDetailId,
      this.tutorMeetingLink,
      this.studentMeetingLink,
      this.studentRequest,
      this.tutorReview,
      this.scoreByTutor,
      this.createdAt,
      this.updatedAt,
      this.recordUrl,
      this.cancelReasonId,
      this.lessonPlanId,
      this.cancelNote,
      this.calendarId,
      this.isDeleted,
      this.scheduleDetailInfo
      );
}