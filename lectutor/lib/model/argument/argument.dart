import '../booking/bookingInfo.dart';

class BookingLessonArg{
  int balance;
  int startTime;
  int endTime;
  String scheduleDetailIds;

  BookingLessonArg(this.balance, this.startTime, this.endTime, this.scheduleDetailIds);
}

class ScheduleArg{
  List<BookingInfo> bookingList;
  int count;

  ScheduleArg(this.bookingList, this.count);
}