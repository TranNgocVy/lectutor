import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import '../model/auth.dart';
import '../view/const/constVar.dart';
import 'dart:async';

Future <dynamic> login(Auth auth) async{
  var dio = Dio();
  try{
    var response = await dio.post(ConstVar.URL + 'auth/login', data: auth.toJson());

    if(response.statusCode == 200){
      return response.data;
    }
  }catch(e){
    print(e);
  }
  return false;
}

Future <dynamic> register(Auth auth) async{
  var dio = Dio();
  try{
    var response = await dio.post(ConstVar.URL + 'auth/register', data: {
      "email": auth.email,
      "password": auth.password,
      "source": null
    });
    if(response.statusCode == 201){
      return response.data;
    }
  }catch(e){
    print(e);
  }
  return null;
}

Future <dynamic> changePasword(String password, String newPassword, String accessToken) async{
  var dio = Dio();
  try{
    dio.options.headers["Authorization"] = "Bearer ${accessToken}";
    var response = await dio.post(ConstVar.URL + 'auth/change-password', data: {
      "password": password,
      "newPassword": newPassword
    });

    if(response.statusCode == 200){
      return true;
    }
    return response.statusMessage;
  }catch(e){
    print(e);
  }
  return false;
}

Future<bool> forgotPassword(String email) async {
  var dio = Dio();
  try{
    final response = await dio.post(ConstVar.URL + "user/forgotPassword", data:{"email": email});

  if (response.statusCode == 200) {
    return true;
  }

  }catch(e){
    print(e);
  }

  return false;

}

Future <dynamic> loginByFaceBook(String token) async{
  var dio = Dio();
  try{
    var response = await dio.post(ConstVar.URL + 'auth/facebook', data: {
      "access_token": token
    });

    if(response.statusCode == 200){
      print(response.data);
      return response.data;
    }
  }catch(e){
    print(e);
  }
  return false;
}

Future <dynamic> loginByGoogle(String token) async{
  var dio = Dio();
  try{
    var response = await dio.post(ConstVar.URL + 'auth/google', data: {
      "access_token": token
    });

    if(response.statusCode == 200){
      print(response.data);
      return response.data;
    }
  }catch(e){
    print(e);
  }
  return false;
}