import 'package:dio/dio.dart';
import 'package:lectutor/model/bookingInfo.dart';

import '../config/const.dart';
import '../view/const/constVar.dart';

Future<int> getLearningTimeTotal(String token) async {
  int a = DateTime.now().millisecondsSinceEpoch;
  print(a);
  var dio = Dio();
  try{
    dio.options.headers["Authorization"] = "Bearer ${token}";
    final response = await dio.get(ConstVar.ULR + "call/total");

    if (response.statusCode == 200) {
      print(response.data);
      return response.data["total"];
    }

  }catch(e){
    print(e);
  }

  return 0;

}
Future<List<BookingInfo>> getLession(String token) async {
  int a = DateTime.now().millisecondsSinceEpoch;
  print(a);
  var dio = Dio();
  try{
    int now = DateTime.now().millisecondsSinceEpoch;
    dio.options.headers["Authorization"] = "Bearer ${token}";
    final response = await dio.get(ConstVar.ULR + "booking/next?dateTime=${now}");

    if (response.statusCode == 200) {
      List<BookingInfo> list = [];
      try {
        for(int i = 0;;i ++){
          var lessons = BookingInfo.fromJson(response.data["data"][i]);
          list.add(lessons);
        }
      }catch(e){}

      list.sort((a, b) => a.scheduleDetailInfo!.startPeriodTimestamp.compareTo(b.scheduleDetailInfo!.startPeriodTimestamp));

      list = list.where((element) => element.scheduleDetailInfo!.startPeriodTimestamp > now).toList();
      return list;
    }

  }catch(e){
    print(e);
  }

  return [];
}