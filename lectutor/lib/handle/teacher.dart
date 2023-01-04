import 'dart:math';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:lectutor/model/tokens.dart';
import 'package:provider/provider.dart';
import '../config/const.dart';
import '../model/auth.dart';
import '../model/tutor.dart';
import '../view/const/constVar.dart';
import 'dart:async';

Future <dynamic> getTeacherList(BuildContext context, int page) async{
  var dio = Dio();
  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${Const.token}";
    var response = await dio.get(ConstVar.URL + 'tutor/more?perPage=9&page=$page');

    if(response.statusCode == 200){
      return response.data;
    }
  }catch(e){
    print(e);
  }
  return null;
}

Future <List<Tutor>> searchTeacher(String token, int page, int perPage, {String name = "", List<String> nationality = const [], String date = "", String time = "", List<String> specialities = const []}) async{
  var dio = Dio();
  List<Tutor> list = [];
  List<String> spec = [];
  for(int i = 0; i< specialities.length; i++){
    for(int j = 0; j < ConstVar.topicList.length; j ++){
      if(ConstVar.topicList[j].name == specialities[i]){
        spec.add(ConstVar.topicList[j].key!);
        continue;
      }
    }
    for(int j = 0; j < ConstVar.testPreparationList.length; j ++){
      if(ConstVar.testPreparationList[j].name == specialities[i]){
        spec.add(ConstVar.testPreparationList[j].key!);
        continue;
      }
    }
  }
  dynamic _date = null;
  dynamic _time = [null, null];
  dynamic _nationality = {};
  if(date != ""){
    var dateList = date.split("-");
    _date = DateTime(int.parse(dateList[0]), int.parse(dateList[1]),int.parse(dateList[2]));

    if(time != ""){
      int startHour = int.parse(time.split(" --> ")[0].split(":")[0]);
      int startMinute = int.parse(time.split(" --> ")[0].split(":")[1]);
      int endHour = int.parse(time.split(" --> ")[1].split(":")[0]);
      int endMinute = int.parse(time.split(" --> ")[1].split(":")[1]);

      int startTime = DateTime(_date).millisecondsSinceEpoch + (startHour * 60 + startMinute) * 60 * 1000;
      int endTime = DateTime(_date).millisecondsSinceEpoch + (endHour * 60 + endMinute) * 60 * 1000;
      _time = [startTime, endTime];
    }
  }
  if(nationality.length >  0 && nationality.length < 3){
    if(nationality.contains("Foreign Tutor")){
      if(nationality.length == 1){
        _nationality = {"isNative": false, "isVietNamese": false};
      }
      else {
        if (nationality.contains("Vietnamese Tutor")) {
          _nationality = {"isNative": false};
        }
        else {
          _nationality = {"isVietNamese": false};
        }
      }
    }
    else{
      if (nationality.contains("Vietnamese Tutor")) {
        _nationality["isVietNamese"] = true;
      }
      if (nationality.contains("Native English Tutor")) {
        _nationality["isNative"] = true;
      }
    }
  }

  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Content-type"] = "application/json;encoding=utf-8";

    var response = await dio.post(ConstVar.URL + 'tutor/search', data: {
      "page": page,
      "perPage": perPage,
      "search": name,
      "filters": {
        "date": _date,
        "nationality": _nationality,
        "tutoringTimeAvailable": _time,
        "specialties": spec
      },
    });

    if(response.statusCode == 200){
      int count = response.data["count"];
      for (int i = 0; i < count; i ++){
        list.add(Tutor.fromJson(response.data["rows"][i]));
      }
      return response.data;
    }
  }catch(e){
    print(e);
  }
  return list;
}

Future <dynamic> getTeacherDetail(BuildContext context, String id) async{
  var dio = Dio();
  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${Const.token}";
    var response = await dio.get(ConstVar.URL + 'tutor/$id');

    if(response.statusCode == 200){
      return response.data;
    }
  }catch(e){
    // print(e);
  }
  return null;
}

Future<dynamic> getTutorSchedule(String token, String tutorId) async {
  var dio = Dio();
  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${Const.token}";
    var response =  await dio.post("${ConstVar.URL}/schedule", data: {
      "tutorId": tutorId,
    });
    if(response.statusCode == 200){
      print(response.data);
      return response.data;
    }
  }catch(e){
    // print(e);
  }
  return null;
}

Future <dynamic> addFavoriteTeacher(String token, String id) async{
  var dio = Dio();
  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.post(ConstVar.URL + 'user/manageFavoriteTutor', data: {"tutorId": id});

    if(response.statusCode == 200){
      return response.data["result"];
    }
  }catch(e){
    // print(e);
  }
  return false;
}

Future <bool> reportTeacher(String token, String id, String reason) async{
  var dio = Dio();
  try{
    dio.options.headers["Authorization"] = "Bearer $token";
    var response = await dio.post(ConstVar.URL + 'report', data: {"tutorId": id, "content": reason});

    if(response.statusCode == 200){
      return true;
    }
  }catch(e){
  }
  return false;
}

