import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lectutor/model/language/english.dart';
import 'package:lectutor/model/language/provider.dart';
import 'package:lectutor/model/language/vietnam.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constVar.dart';

class TemplatePage extends StatefulWidget {
  final Widget widget;
  final bool? isMenu;
  final bool? isLogin;
  const TemplatePage({super.key, required this.widget, this.isMenu, this.isLogin});
  @override
  State<TemplatePage> createState() => _TemplatePage();
}

class _TemplatePage extends State<TemplatePage>{
  late bool isMenu;
  late bool isLogin;
  String _firstSelected = "assets/icon/england.svg";



  @override
  void initState() {
    super.initState();
    if (widget.isMenu == null) {
      isMenu = false;
    } else {
      isMenu = widget.isMenu!;
    }
    if (widget.isLogin == null) {
      isLogin = true;
    }
    else {
      isLogin = widget.isLogin!;
    }
    _loadLanguage();
  }

  Future<void> _saveLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      String lang = prefs.getString('language') ?? "EN";

      if (lang == "EN"){
        _firstSelected = "assets/icon/england.svg";
      }
      else{
       _firstSelected = "assets/icon/vietnam.svg";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
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
                        image: Svg(_firstSelected),
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
                          image: Svg(("assets/icon/england.svg"),),
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
            onSelected: (String value) async{
              String lang = "";
              if(value == "assets/icon/vietnam.svg"){
                lang = "VN";
                context.read<LanguageProvider>().language = VietNamese();
              }else{
                lang = "EN";
                context.read<LanguageProvider>().language = English();
              }
              setState(() {
                _firstSelected = value;

              });
              await _saveLanguage(lang);

            },
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
      body: widget.widget,
      // body: getMenu(),
    );
  }
  // static Widget getHeader(BuildContext context, Widget page, {bool isMenu = false, bool isLogin = true}){
  //   return ;
  // }
}


