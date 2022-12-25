import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:lectutor/model/bookingInfo.dart';
import 'package:lectutor/model/user.dart';

import '../config/const.dart';
import '../view/const/constVar.dart';

Future<int> getLearningTimeTotal(String token) async {
  int a = DateTime.now().millisecondsSinceEpoch;
  var dio = Dio();
  try{
    dio.options.headers["Authorization"] = "Bearer ${token}";
    final response = await dio.get(ConstVar.URL + "call/total");

    if (response.statusCode == 200) {
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
    final response = await dio.get(ConstVar.URL + "booking/next?dateTime=${now}");

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

Future<dynamic> getUserInfo(String token) async {
  var dio = Dio();
  try{
    dio.options.headers["Authorization"] = "Bearer ${token}";
    final response = await dio.get(ConstVar.URL + "user/info");

    if (response.statusCode == 200) {
      return response.data["user"];
    }
  }catch(e){
    print(e);
  }
  return null;
}

Future<int> getBalance(String token) async {
  var dio = Dio();
  try{
    dio.options.headers["Authorization"] = "Bearer ${token}";
    final response = await dio.get(ConstVar.URL + "user/info");

    if (response.statusCode == 200) {
      var user = User.fromJson(response.data["user"]);
      return int.parse(user.walletInfo!.amount!.substring(0, user.walletInfo!.amount!.length - 5));
    }
  }catch(e){
    print(e);
  }
  return 0;
}

Future<dynamic> updateProfile (String token, String name, String country, String phone, String birthday, String level, List<String> learnTopics, List<String>testPreparations, String studySchedule ) async{
  var dio = Dio();
  print("name: " + name);
  print("birthdaay: " + birthday);
  print("country: " + country);
  print("phone: " + phone);
  print("level: " + level);
  print("topic: " + learnTopics.toString());
  print("test: " + testPreparations.toString());
  try{
    dio.options.headers["Authorization"] = "Bearer ${token}";
    final response = await dio.put(ConstVar.URL + "user/info", data: {
      "name": name,
      "country": country,
      "phone": phone,
      "birthday": birthday,
      "level": level,
      "learnTopics": learnTopics,
      "testPreparations": testPreparations,
      "studySchedule": studySchedule

    }
    );

    if (response.statusCode == 200) {
      return response.data["user"];
    }
  }catch(e){
    print(e);
  }
  return null;
}