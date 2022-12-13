import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import '../model/auth.dart';
import '../view/const/constVar.dart';
import 'dart:async';

Future <dynamic> login(Auth auth) async{
  var dio = Dio();
  try{
    var response = await dio.post(ConstVar.ULR + 'auth/login', data: auth.toJson());

    if(response.statusCode == 200){
      return response.data;
    }
  }catch(e){
    print(e);
  }
  return false;
}