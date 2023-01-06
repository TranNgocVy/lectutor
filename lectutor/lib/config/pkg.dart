import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lectutor/model/language/language.dart';
import 'package:lectutor/model/language/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/language/english.dart';
import '../model/language/vietnam.dart';
import 'const.dart';
class Pkg {
  static List<Widget> getRating(double? rating){
    if (rating == null){
      return [Text(
        "No reviews yet",
        style: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),
      )];
    }
    List<Icon> icons = [];
    for (int i = 1; i <= 5; i++){
      if (rating >= i){
        icons.add(Icon(Icons.star, color: Colors.yellow, size: 20,));
      }
      else{
        icons.add(Icon(Icons.star_border, color: Colors.grey, size: 20,));
      }
    }
    return icons;
  }

  static Container getElevatedButton(String txt){
    Container btn = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
      child: ElevatedButton(
        onPressed: null,
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
          ),
        ),
        style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );

    return btn;
  }

  static int diffDay(DateTime start, DateTime end){
    DateTime tempStart = DateTime(start.year, start.month, start.day);
    DateTime tempEnd = DateTime(end.year, end.month, end.day);

    return tempEnd.difference(tempStart).inDays;
  }
  static int diffMonth(DateTime start, DateTime end){
    DateTime tempStart = DateTime(start.year, start.month);
    DateTime tempEnd = DateTime(end.year, end.month);

    return (tempEnd.difference(tempStart).inDays / 30).toInt();
  }

  static int diffYear(DateTime start, DateTime end){
    DateTime tempStart = DateTime(start.year);
    DateTime tempEnd = DateTime(end.year);

    return (tempEnd.difference(tempStart).inDays / 365).toInt();
  }

  static CircleAvatar setAvatar(String? avatar,String? name){
    String alias = "";
    List<String> nameSplit = name.toString().split(" ");
    for(int i = 0; i < nameSplit.length && i < 2; i++){
      alias = alias + nameSplit[i][0];
    }

    return avatar != null?
    CircleAvatar(
      // backgroundImage: ,
      backgroundImage: NetworkImage(avatar),
      maxRadius: 50,
    ):
    CircleAvatar(
      backgroundColor: Colors.blue.shade200,
      maxRadius: 50,
      child: Text(
        alias,
        style: TextStyle(
            fontSize: 45,
            color: Colors.white
        ),
      ),
    );

  }

  static String getDurationLession (int startTimestamp, int endTimestamp){
    DateTime startDateTime = Const.time.add(Duration(milliseconds: startTimestamp));
    DateTime endDateTime = Const.time.add(Duration(milliseconds: endTimestamp));


    return "${startDateTime.hour < 10 ? "0${startDateTime.hour}": startDateTime.hour}:${startDateTime.minute < 10 ? "0${startDateTime.minute}": startDateTime.minute} - ${endDateTime.hour < 10 ? "0${endDateTime.hour }": endDateTime.hour }:${endDateTime.minute < 10 ? "0${endDateTime.minute }": endDateTime.minute }";
  }

  static String getDate (int startTimestamp){
    DateTime startDateTime = Const.time.add(Duration(milliseconds: startTimestamp));
    String dayInWeek = Const.weekday[startDateTime.weekday - 1];
    String month = Const.months[startDateTime.month - 1];
  return "${dayInWeek}, ${startDateTime.day} ${month} ${startDateTime.year} ";
  }

  static String getDayPast(int start){
    int now = DateTime.now().millisecondsSinceEpoch;
    int diff = (now - start) ~/ 60000;
    if (diff < 60){
      return "${diff} minute(s) ago";
    }
    diff = diff ~/ 60;
    if (diff < 24){
      return "${diff} hour(s) ago";
    }
    diff = diff ~/ 24;
    if (diff < 7){
      return "${diff} day(s) ago";
    }

    if (diff < 30){
      return "${diff~/7} week(s) ago";
    }

    diff = diff ~/ 30;
    if (diff < 12){
      return "${diff} month(s) ago";
    }

    diff = diff ~/ 12;
    return "${diff} years(s) ago";
  }

  static String getPeriodTime (int startTimestamp, int endTimestamp){
    DateTime startPeriodTime = DateTime.fromMillisecondsSinceEpoch(startTimestamp);
    DateTime endPeriodTime = DateTime.fromMillisecondsSinceEpoch(endTimestamp);
    String startTime = "${startPeriodTime.hour < 10 ? "0${startPeriodTime.hour}" : startPeriodTime.hour}:${startPeriodTime.minute < 10 ? "0${startPeriodTime.minute}" : startPeriodTime.minute}";
    String endTime = "${endPeriodTime.hour < 10 ? "0${endPeriodTime.hour}" : endPeriodTime.hour}:${endPeriodTime.minute < 10 ? "0${endPeriodTime.minute}" : endPeriodTime.minute}";

    return "${startTime} - ${endTime}";
  }

  static Future<XFile?> getImgae(ImageSource source) async {
    XFile? pickedFile;

    final ImagePicker _picker = ImagePicker();

    try {
      pickedFile = await _picker.pickImage(
        source: source,
      );
    } catch (e) {
    }
    return pickedFile;
  }

  static Future<void> getLanguage(LanguageProvider languageProvider) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('language') ?? "EN";
    if (lang == "EN") {
      languageProvider.language = English();
    } else {
      languageProvider.language = VietNamese();
    }
  }






}