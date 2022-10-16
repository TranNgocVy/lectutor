import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lectutor/const/constVar.dart';
// import 'package:flutter_svg/svg.dart';
//
//
// class Page extends StatefulWidget {
//   const Page({super.key});
//   @override
//   State<Page> createState() => _Page();
// }
//
// class _Page extends State<Page> {
//   @override
//   Widget build(BuildContext context) {
//     // return Container(
//     return
//     // mainAxisSize: MainAxisSize.max,
//
//     // );
//
//   }
//
//
// }



class TemplatePage {
  static Widget getHeader(BuildContext context, Widget page, {bool isMenu = false, bool isLogin = true}){
    return Scaffold(
      // appBar: AppBar(
      //   shadowColor: Colors.grey,
      //   elevation: 3,
      //   title: Image(
      //     image: Svg('asset/icon/lettutor.svg'),
      //   ),
      //   actions: <Widget>[
      //     // Container(
      //     //   decoration: BoxDecoration(
      //     //     shape: BoxShape.circle,
      //     //   ),
      //     //   child: IconButton(
      //     //     icon: Image(
      //     //       image: Svg('asset/icon/england.svg'),
      //     //     ),
      //     //
      //     //     // icon: Icon(Icons.add),
      //     //     style: IconButton.styleFrom(
      //     //         shape: RoundedRectangleBorder(
      //     //             borderRadius: BorderRadius.circular(50.0),
      //     //             side: BorderSide(
      //     //               width: 10,
      //     //               color: Colors.grey.shade300,
      //     //             )
      //     //         )
      //     //     ),
      //     //
      //     //     iconSize: 30,
      //     //     onPressed: () {},
      //     //   ),
      //     // ),
      //
      //     Ink(
      //         decoration: ShapeDecoration(
      //           color: Colors.white,
      //           shape: CircleBorder(),
      //         ),
      //         child: Image(
      //           image: Svg('asset/icon/england.svg'),
      //           width: 50,
      //         ),
      //     ),
      //
      //     SizedBox(width: 10,),
      //
      //     Container(
      //       // padding: (EdgeInsets.all(10)),
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.all(Radius.circular(50)),
      //           color: Colors.grey.shade200
      //       ),
      //       child: IconButton(
      //         icon: Icon(Icons.menu_rounded, color: Colors.grey.shade400,),
      //         // style: IconButton.styleFrom(
      //         //   backgroundColor: Colors.black87,
      //         //   foregroundColor: Colors.black87,
      //         // ),
      //         onPressed: () {
      //           if(!isMenu){
      //             Navigator.pushNamed(context, '/menu');
      //           }
      //           else{
      //             Navigator.pop(context);
      //           }
      //         },
      //         iconSize: 40,
      //       ),
      //     ),
      //
      //     SizedBox(width: 10,),
      //
      //
      //
      //   ],
      //   backgroundColor: Colors.white,
      //
      //   // flexibleSpace: SizedBox(height: 20,),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GestureDetector(
            onTap: null, //sửa sau
            child: SizedBox(
              child: Image(
                image: Svg('asset/icon/lettutor.svg'),
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
                        image: Svg("asset/icon/england.svg"),
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
                value: 'asset/icon/england.svg',
                child: Row(
                  children: [
                    SizedBox(
                        width: 30,
                        height: 30,
                        child: Image(
                          image: Svg(('asset/icon/england.svg'),),
                        )
                    ),
                    SizedBox(width: 20,),
                    Text('English')
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'asset/icon/vietnam.svg',
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image(
                        image: Svg("asset/icon/vietnam.svg"),
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
  // final bool isMenu;
  // final bool isLogin;
  // final BuildContext context;
  // final Widget page;
  //
  //
  // TemplatePage(this.isMenu, this.isLogin, this.context, this.page);
  //
  // @override
  // State<StatefulWidget> createState() {
  //   return Scaffold(
  //     // appBar: AppBar(
  //     //   shadowColor: Colors.grey,
  //     //   elevation: 3,
  //     //   title: Image(
  //     //     image: Svg('asset/icon/lettutor.svg'),
  //     //   ),
  //     //   actions: <Widget>[
  //     //     // Container(
  //     //     //   decoration: BoxDecoration(
  //     //     //     shape: BoxShape.circle,
  //     //     //   ),
  //     //     //   child: IconButton(
  //     //     //     icon: Image(
  //     //     //       image: Svg('asset/icon/england.svg'),
  //     //     //     ),
  //     //     //
  //     //     //     // icon: Icon(Icons.add),
  //     //     //     style: IconButton.styleFrom(
  //     //     //         shape: RoundedRectangleBorder(
  //     //     //             borderRadius: BorderRadius.circular(50.0),
  //     //     //             side: BorderSide(
  //     //     //               width: 10,
  //     //     //               color: Colors.grey.shade300,
  //     //     //             )
  //     //     //         )
  //     //     //     ),
  //     //     //
  //     //     //     iconSize: 30,
  //     //     //     onPressed: () {},
  //     //     //   ),
  //     //     // ),
  //     //
  //     //     Ink(
  //     //         decoration: ShapeDecoration(
  //     //           color: Colors.white,
  //     //           shape: CircleBorder(),
  //     //         ),
  //     //         child: Image(
  //     //           image: Svg('asset/icon/england.svg'),
  //     //           width: 50,
  //     //         ),
  //     //     ),
  //     //
  //     //     SizedBox(width: 10,),
  //     //
  //     //     Container(
  //     //       // padding: (EdgeInsets.all(10)),
  //     //       decoration: BoxDecoration(
  //     //           borderRadius: BorderRadius.all(Radius.circular(50)),
  //     //           color: Colors.grey.shade200
  //     //       ),
  //     //       child: IconButton(
  //     //         icon: Icon(Icons.menu_rounded, color: Colors.grey.shade400,),
  //     //         // style: IconButton.styleFrom(
  //     //         //   backgroundColor: Colors.black87,
  //     //         //   foregroundColor: Colors.black87,
  //     //         // ),
  //     //         onPressed: () {
  //     //           if(!isMenu){
  //     //             Navigator.pushNamed(context, '/menu');
  //     //           }
  //     //           else{
  //     //             Navigator.pop(context);
  //     //           }
  //     //         },
  //     //         iconSize: 40,
  //     //       ),
  //     //     ),
  //     //
  //     //     SizedBox(width: 10,),
  //     //
  //     //
  //     //
  //     //   ],
  //     //   backgroundColor: Colors.white,
  //     //
  //     //   // flexibleSpace: SizedBox(height: 20,),
  //     // ),
  //     appBar: AppBar(
  //       backgroundColor: Colors.white,
  //       title: GestureDetector(
  //           onTap: null, //sửa sau
  //           child: SizedBox(
  //             child: Image(
  //               image: Svg('asset/icon/lettutor.svg'),
  //             ),
  //           )
  //       ),
  //       centerTitle: true,
  //       actions: [
  //         PopupMenuButton<String>(
  //           child: SizedBox(
  //             width: 40,
  //             height: 40,
  //             child: Stack(
  //               children: [
  //                 Center(
  //                   child: SizedBox(
  //                     width: 25,
  //                     height: 25,
  //                     child: Image(
  //                       image: Svg("asset/icon/england.svg"),
  //                     ),
  //                   ),
  //                 ),
  //                 Center(
  //                   child: Container(
  //                     width: 40,
  //                     height: 40,
  //                     decoration: BoxDecoration(
  //                       border: Border.all(
  //                         width: 8,
  //                         color: Colors.grey.shade200,
  //                       ),
  //                       shape: BoxShape.circle,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           offset: Offset(0, 50),
  //           itemBuilder: (context) => [
  //             PopupMenuItem(
  //               value: 'asset/icon/england.svg',
  //               child: Row(
  //                 children: [
  //                   SizedBox(
  //                       width: 30,
  //                       height: 30,
  //                       child: Image(
  //                         image: Svg(('asset/icon/england.svg'),),
  //                       )
  //                   ),
  //                   SizedBox(width: 20,),
  //                   Text('English')
  //                 ],
  //               ),
  //             ),
  //             PopupMenuItem(
  //               value: 'asset/icon/vietnam.svg',
  //               child: Row(
  //                 children: [
  //                   SizedBox(
  //                     width: 30,
  //                     height: 30,
  //                     child: Image(
  //                       image: Svg("asset/icon/vietnam.svg"),
  //                     ),
  //                   ),
  //                   SizedBox(width: 20,),
  //                   Text('Vietnamese')
  //                 ],
  //               ),
  //             ),
  //           ],
  //           // onSelected: (String value) {
  //           //   setState(() {
  //           //     _firstSelected = value;
  //           //   });
  //           // },
  //         ),
  //         SizedBox(width: ConstVar.minspace,),
  //
  //         isLogin?IconButton(
  //           icon: Icon(Icons.menu_rounded, color: Colors.grey.shade400,),
  //           onPressed: () {
  //             if(!isMenu){
  //               Navigator.pushNamed(context, '/menu');
  //             }
  //             else{
  //               Navigator.pop(context);
  //             }
  //           },
  //           iconSize: 40,
  //         ) : SizedBox(),
  //       ],
  //       //automaticallyImplyLeading: false,
  //     ),
  //     resizeToAvoidBottomInset: true,
  //     body: page,
  //     // body: getMenu(),
  //   );
  // }
}


