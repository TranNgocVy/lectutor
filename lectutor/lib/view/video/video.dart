
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class Video extends StatelessWidget {
  const Video({super.key});



  @override
  Widget build(BuildContext context) {
    // return TemplatePage.getHeader(context, VideoPage());
    return new TemplatePage(widget: VideoPage());
  }
}

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});
  @override
  State<VideoPage> createState() => _VideoPage();

}

class _VideoPage extends State<VideoPage> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey,
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 5,
              right: 0,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 70,
                    color: Colors.black,
                  ),
                  Positioned(
                    child: Icon(Icons.circle_outlined,size: 20,color: Colors.green,),
                    top: 2,
                    left: 2,
                  ),
                  Positioned(
                    child: Icon(Icons.more_vert,size: 20,color: Colors.white,),
                    bottom: 2,
                    left: 2,
                  ),
                  Positioned(
                    child: Icon(Icons.more_vert,size: 20,color: Colors.white,),
                    bottom: 2,
                    left: 2,
                  ),
                  Positioned.fill(child: Icon(Icons.account_circle, size: 30, color: Colors.purple,)),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.videocam_off_sharp, color: Colors.white, size: 20,),
                        SizedBox(width: 3,),
                        Icon(Icons.star_border, color: Colors.white, size: 20,),
                      ]
                    )
                  ),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Icon(Icons.account_circle,size: 30, color: Colors.purple,),
                  //
                  // )
                ],
              ),
            ),
            Positioned.fill(child: Icon(Icons.account_circle, size: 100,)),

            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Text(
                  "17:41:48 until lesson start (Fri, 30 Sep 22 19:30)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),

            Align(
                alignment: Alignment.bottomCenter,
                child:Container(
                  color: Colors.black,
                  // alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.all(3),
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.mic,
                              size: 30,
                              color: Colors.white,
                            ),

                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                color: Colors.grey,
                                // alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.expand_less,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                            )



                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.all(3),
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.videocam_off_outlined,
                              size: 30,
                              color: Colors.white,
                            ),

                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                color: Colors.grey,
                                // alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.expand_less,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                            )



                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.all(3),
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.tv,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.all(3),
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.all(3),
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.front_hand_outlined,
                              size: 30,
                              color: Colors.white,
                            ),

                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                color: Colors.grey,
                                // alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.expand_less,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                            )



                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.all(3),
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.fullscreen,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.all(3),
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.more_horiz,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.redAccent,
                        padding: EdgeInsets.all(3),
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.call_end,
                              size: 30,
                              color: Colors.white,
                            ),

                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                color: Colors.grey,
                                // alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.expand_less,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              ),
                            )



                          ],
                        ),
                      ),

                    ],
                  ),
                )
            ),




          ],
        ),
        //
        // child: Expanded(
        // ),
      ),
    );



  }


}