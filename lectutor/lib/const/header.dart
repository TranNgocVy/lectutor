import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
// import 'package:flutter_svg/svg.dart';

class Header{
  static Widget getHeader(BuildContext context, Widget page, {bool isMenu = false}){
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.grey,
        elevation: 3,
        title: Image(
          image: Svg('asset/icon/lettutor.svg'),
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Image(
                image: Svg('asset/icon/england.svg'),
              ),

              // icon: Icon(Icons.add),
              style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(
                        width: 10,
                        color: Colors.grey.shade300,
                      )
                  )
              ),

              iconSize: 30,
              onPressed: () {},
            ),
          ),

          SizedBox(width: 10,),

          Container(
            // padding: (EdgeInsets.all(10)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.grey.shade200
            ),
            child: IconButton(
              icon: Icon(Icons.menu_rounded, color: Colors.grey.shade400,),
              // style: IconButton.styleFrom(
              //   backgroundColor: Colors.black87,
              //   foregroundColor: Colors.black87,
              // ),
              onPressed: () {
                if(!isMenu){
                  Navigator.pushNamed(context, '/menu');
                }
                else{
                  Navigator.pop(context);
                }
              },
              iconSize: 40,
            ),
          ),

          SizedBox(width: 10,),



        ],
        backgroundColor: Colors.white,

        // flexibleSpace: SizedBox(height: 20,),
      ),
      resizeToAvoidBottomInset: true,
      body: page,
      // body: getMenu(),
    );
  }
}