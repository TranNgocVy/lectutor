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

Future <dynamic> getScheduleByTutorId(BuildContext context, String id) async{
  var dio = Dio();
  try{
    // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
    dio.options.headers["Authorization"] = "Bearer ${Const.token}";
    var response = await dio.post(ConstVar.ULR + 'schedule', data: {"tutorId": id});
    if(response.statusCode == 200){
      return response.data["data"];
    }
  }catch(e){
    print(e);
  }
  return null;
}