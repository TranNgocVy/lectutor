import 'package:flutter/material.dart';
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
        icons.add(Icon(Icons.star, color: Colors.yellow, size: 15,));
      }
      else{
        icons.add(Icon(Icons.star_border, color: Colors.grey, size: 15,));
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


}