import 'dart:math';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:lectutor/model/tokens.dart';
import 'package:provider/provider.dart';
import '../config/const.dart';
import '../model/auth.dart';
import '../model/bookingInfo.dart';
import '../model/tutor.dart';
import '../view/const/constVar.dart';
import 'dart:async';

Future <dynamic> getScheduleByTutorId(BuildContext context, String id, int startTime, int endTime) async{
  print(startTime);
  print(endTime);
  var dio = Dio();
  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${Const.token}";
    // var response = await dio.post(ConstVar.URL + 'schedule', data: {"tutorId": id});
    var response = await dio.get("${ConstVar.URL}schedule?tutorId=$id&startTimestamp=$startTime&endTimestamp=$endTime");
    if(response.statusCode == 200){
      return response.data["scheduleOfTutor"];
    }
  }catch(e){
    print(e);
  }
  return null;
}

Future<List<BookingInfo>> getStudentBookedClass(String token, int page) async {
  var dio = Dio();
  final current = DateTime.now().millisecondsSinceEpoch;
  List<BookingInfo> list = [];
  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    var response = await dio.get(ConstVar.URL + 'booking/list/student?page=$page&perPage=${Const.perPage}&dateTimeLte=$current&orderBy=meeting&sortBy=desc');
    if(response.statusCode == 200){
      for(int i = 0;; i++){
        list.add(BookingInfo.fromJson(response.data["data"]["rows"][i]));
      }
    }
  }catch(e){
    print(e);
  }
  return list;
}

Future<List<BookingInfo>> getUpcomingClass(String token, int page) async {
  var dio = Dio();
  final current = DateTime.now().millisecondsSinceEpoch;
  print(current);
  List<BookingInfo> list = [];
  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    var response = await dio.get(ConstVar.URL + "booking/list/student?page=$page&perPage=${Const.perPage}&dateTimeGte=$current&orderBy=meeting&sortBy=asc");
    if(response.statusCode == 200){
      for(int i = 0;; i++){
        list.add(BookingInfo.fromJson(response.data["data"]["rows"][i]));
      }
    }
  }catch(e){
    print(e);
  }
  return list;
}

Future<bool> bookingAClass(String token, String id, String note) async {
  var dio = Dio();
  try{
    dio.options.headers["Authorization"] = "Bearer ${token}";
    var response = await dio.post(ConstVar.URL + "booking", data: {
      "scheduleDetailIds":[id],
      "note": note
    });
    if(response.statusCode == 200){
      print(response.data);
      return true;
    }
  }catch(e){
    print(e);
  }
  return false;
}

Future<bool> cancelAClass(String token, String id) async {
  var dio = Dio();
  try{
    dio.options.headers["Authorization"] = "Bearer ${token}";
    var response = await dio.delete(ConstVar.URL + "booking", data: {
      "scheduleDetailIds":[id],
    });
    if(response.statusCode == 200){
      print(response.data);
      return true;
    }
  }catch(e){
    print(e);
  }
  return false;
}
