
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lectutor/model/course.dart';
import 'package:lectutor/model/topic.dart';
import '../const/constVar.dart';
import '../const/page.dart';


class TopicDetail extends StatelessWidget {
  const TopicDetail({super.key});


  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, TopicDetailPage());

  }
}

class TopicDetailPage extends StatefulWidget {
  const TopicDetailPage({super.key});
  @override
  State<TopicDetailPage> createState() => _TopicDetailPage();
}

class _TopicDetailPage extends State<TopicDetailPage> {
  Course course = Course("Life in the Internet Age",
      "Let's discuss how technology is changing the way we live",
      "Intermediate",
      [Topic("The Internet"),
        Topic("Artificial Intelligence (AI)"),
        Topic("Social Media"),
        Topic("Internet Privacy"),
        Topic("Live Streaming"),
        Topic("Coding"),
        Topic("Technology Transforming Healthcare"),
        Topic("Smart Home Technology"),
        Topic("Remote Work - A Dream Job?"),
      ]
  );
  int selectIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,5,10,10),
      child: Expanded(
        child: ListView(
          children: <Widget>[
            Container(
              child: Image(image: AssetImage("assets/icon/course.png"),),
            ),

            Container(
                padding: EdgeInsets.fromLTRB(0,10,0,10),
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              course.title,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: ConstVar.minspace,),

                      Row(
                        children: <Widget>[
                          SizedBox(width: 10,),
                          Expanded(
                            child: Text(
                              course.description,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),

            Container(
                padding: EdgeInsets.fromLTRB(0,10,0,10),
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "List Topics",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: getTopicList(course.topicList),
                      ),
                      SizedBox(height: ConstVar.minspace,),
                    ],
                  ),
                )
            ),

            SizedBox(height: ConstVar.mediumspace,),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: null,
                                child: Icon(Icons.expand_less, size: 30,),
                              ),
                              Container(
                                width: 50,
                                color: Colors.white,
                                // padding: EdgeInsets.only(top:5, bottom: 5),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  autofocus: false,
                                  initialValue: '1',
                                  decoration: InputDecoration(
                                    // hintText: 'Enter your email...',
                                    // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ),

                              Text(("/17")),
                              GestureDetector(
                                onTap: null,
                                child: Icon(Icons.expand_more, size: 30,),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: null,
                                child: Icon(Icons.zoom_out, size: 30,),
                              ),
                              // TextField(
                              //   keyboardType: TextInputType.number,
                              //   autofocus: false,
                              //   cursorWidth: 10,
                              // ),
                              Text(("50%")),
                              GestureDetector(
                                onTap: null,
                                child: Icon(Icons.zoom_in, size: 30,),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: null,
                                child: Icon(Icons.search, size: 30,),
                              ),
                              GestureDetector(
                                onTap: null,
                                child: Icon(Icons.fullscreen_rounded, size: 30,),
                              ),

                              GestureDetector(
                                onTap: null,
                                child: Icon(Icons.file_download_rounded, size: 30,),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getTopicList(List<Topic> topicList){
    List<Widget> list = [];
    for (var i = 0; i < topicList.length; i++){
      list.add(GestureDetector(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selectIndex == i ? Colors.grey.shade300 : Colors.white,

          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${i + 1}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                  child: Text(
                    topicList[i].title,
                    style: TextStyle(
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  )
              ),
            ],
          ),
        ),
        onTap: (){
          setState(() {
            selectIndex = i;
          });
        },
      ));
    }
    return list;
  }



}


