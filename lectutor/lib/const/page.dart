import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lectutor/const/constVar.dart';



class TemplatePage {
  static Widget getHeader(BuildContext context, Widget page, {bool isMenu = false, bool isLogin = true}){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GestureDetector(
            onTap: null, //sửa sau
            child: SizedBox(
              child: Image(
                image: Svg('assets/icon/lettutor.svg'),
              ),
            )
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            child: SizedBox(
              width: 40,
              height: 40,
              child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: Image(
                        image: Svg("assets/icon/england.svg"),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 8,
                          color: Colors.grey.shade200,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            offset: Offset(0, 50),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'assets/icon/england.svg',
                child: Row(
                  children: [
                    SizedBox(
                        width: 30,
                        height: 30,
                        child: Image(
                          image: Svg(('assets/icon/england.svg'),),
                        )
                    ),
                    SizedBox(width: 20,),
                    Text('English')
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'assets/icon/vietnam.svg',
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image(
                        image: Svg("assets/icon/vietnam.svg"),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Text('Vietnamese')
                  ],
                ),
              ),
            ],
            // onSelected: (String value) {
            //   setState(() {
            //     _firstSelected = value;
            //   });
            // },
          ),
          SizedBox(width: ConstVar.minspace,),

          isLogin?IconButton(
            icon: Icon(Icons.menu_rounded, color: Colors.grey.shade400,),
            onPressed: () {
              if(!isMenu){
                Navigator.pushNamed(context, '/menu');
              }
              else{
                Navigator.pop(context);
              }
            },
            iconSize: 40,
          ) : SizedBox(),
        ],
        //automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: true,
      body: page,
      // body: getMenu(),
    );
  }
}


