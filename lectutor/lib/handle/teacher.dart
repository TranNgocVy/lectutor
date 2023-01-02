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

Future <List<Tutor>> searchTeacher(String token, int page, int perPage, {String name = "", List<String> nationnality = const [], List<String> specialities = const []}) async{
  var dio = Dio();
  List<Tutor> list = [];
  List<String> spec = [];
  for(int i = 0; i< specialities.length; i++){
    for(int j = 0; j < ConstVar.topicList.length; j ++){
      print("${ConstVar.topicList[j].name} = ${specialities[i]}");
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
  print(specialities);

  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${token}";
    dio.options.headers["Content-type"] = "application/json;encoding=utf-8";

    var response = await dio.post(ConstVar.URL + 'tutor/search', data: {
      "page": page,
      "perPage": perPage,
      "search": name,
      "filters": {
        "specialties": spec,
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