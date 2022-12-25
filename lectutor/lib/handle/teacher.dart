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

Future <dynamic> searchTeacher(BuildContext context, String name, List<String> nationnality, List<String> specialities) async{
  var dio = Dio();
  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${Const.token}";
    var response = await dio.post(ConstVar.URL + 'tutor/search');

    if(response.statusCode == 200){
      print(response.data);
      return response.data;
    }
  }catch(e){
    print(e);
  }
  return null;
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

Future <dynamic> addFavoriteTeacher(BuildContext context, String id) async{
  var dio = Dio();
  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${Const.token}";
    var response = await dio.post(ConstVar.URL + 'tutor/$id');

    if(response.statusCode == 200){
      return true;
    }
  }catch(e){
    // print(e);
  }
  return false;
}