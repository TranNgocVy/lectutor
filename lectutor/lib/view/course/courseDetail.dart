import 'dart:async';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lectutor/model/course.dart';
// import 'package:lectutor/course/temp.dart';
import 'package:lectutor/model/courses.dart';
import 'package:lectutor/model/level.dart';
import 'package:lectutor/model/topics.dart';
import '../../model/topic.dart';
import '../const/constVar.dart';
import '../const/page.dart';
// import 'package:path_provider/path_provider.dart';



class CourseDetail extends StatelessWidget {
  final Course course;
  const CourseDetail({super.key, required this.course});


  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, CourseDetailPage(course:  course,));

  }
}

class CourseDetailPage extends StatefulWidget {
  final Course course;
  const CourseDetailPage({super.key, required this.course});
  @override
  State<CourseDetailPage> createState() => _CourseDetailPage();
}

class _CourseDetailPage extends State<CourseDetailPage> {
  String pathPDF = "";
  late Course course;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    course = widget.course;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   fromAsset('assets/file/the_internet.pdf', 'demo.pdf').then((f) {
  //     setState(() {
  //       pathPDF = f.path;
  //     });
  //   });
  //
  // }

  // Future<File> fromAsset(String asset, String filename) async {
  //   // To open from assets, you can copy them to the app storage folder, and the access them "locally"
  //   Completer<File> completer = Completer();
  //
  //   try {
  //     var dir = await getApplicationDocumentsDirectory();
  //     File file = File("${dir.path}/$filename");
  //     var data = await rootBundle.load(asset);
  //     var bytes = data.buffer.asUint8List();
  //     await file.writeAsBytes(bytes, flush: true);
  //     completer.complete(file);
  //   } catch (e) {
  //     throw Exception('Error parsing asset file!');
  //   }
  //
  //   return completer.future;
  // }



  // Courses course = Courses("Life in the Internet Age",
  //     "Let's discuss how technology is changing the way we live",
  //     "Intermediate",
  //     [Topics("The Internet"),
  //       Topics("Artificial Intelligence (AI)"),
  //       Topics("Social Media"),
  //       Topics("Internet Privacy"),
  //       Topics("Live Streaming"),
  //       Topics("Coding"),
  //       Topics("Technology Transforming Healthcare"),
  //       Topics("Smart Home Technology"),
  //       Topics("Remote Work - A Dream Job?"),
  //     ]
  // );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,5,10,10),
      child: Expanded(
        child: ListView(
          children: <Widget>[
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.network(course.imageUrl!),
                    ),

                    Container(
                        padding: EdgeInsets.all(20),
                        child: Expanded(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      course.name!,
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
                                  Expanded(
                                    child: Text(
                                      course.description!,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: ConstVar.mediumspace,),

                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: (){
                                      Navigator.pushNamed(context, '/course/detail/topic');
                                      // if (pathPDF.isNotEmpty) {
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => PDFScreen(path: pathPDF),
                                      //     ),
                                      //   );
                                      // }
                                    },
                                    style: ButtonStyle(
                                      // backgroundColor: Colors.blue,
                                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                                    ),
                                    child: Text(
                                      "Discover",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
              elevation: 5,
              shadowColor: Colors.grey,
            ),

            SizedBox(height: ConstVar.largespace,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black12, width: 1),
                        )
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Overview",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: ConstVar.minspace,),

                  Row(
                    children: <Widget>[
                      Icon(Icons.question_mark_rounded, color: Colors.red,),
                      SizedBox(width: 5,),
                      Text(
                        "Why take this course",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      )


                    ],
                  ),
                  SizedBox(height: ConstVar.minspace,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20,),
                      Expanded(child: Text(
                        "${course.reason}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ))
                    ],
                  ),

                  SizedBox(height: ConstVar.mediumspace,),

                  Row(
                    children: <Widget>[
                      Icon(Icons.question_mark_rounded, color: Colors.red,),
                      SizedBox(width: 5,),
                      Text(
                        "What will you be able to do",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      )


                    ],
                  ),
                  SizedBox(height: ConstVar.minspace,),

                  Row(
                    children: <Widget>[
                      SizedBox(width: 20,),
                      Expanded(
                        child: Text(
                          "${course.purpose}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: ConstVar.mediumspace,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 1),
                      )
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Experience Level",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ConstVar.minspace,),

                Row(
                  children: <Widget>[
                    Icon(Icons.supervisor_account_outlined, color: Colors.blue,),
                    SizedBox(width: 5,),
                    Text(
                      "${Level.getLevelById(ConstVar.levelList, course.level!).name}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    )


                  ],
                ),
              ],
            ),

            SizedBox(height: ConstVar.mediumspace,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 1),
                      )
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Course Length",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ConstVar.minspace,),

                Row(
                  children: <Widget>[
                    Icon(Icons.topic_outlined, color: Colors.blue,),
                    SizedBox(width: 5,),
                    Text(
                      "${course.topics!.length} ${course.topics!.length > 1 ? "topics" : "topic"}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              ],
            ),

            SizedBox(height: ConstVar.mediumspace,),

            // Expanded(
            //   child:
            // ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 1),
                      )
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "List Topics",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ConstVar.minspace,),

                // Expanded(
                //     child:
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: getTopicList(course.topics!),
                ),
              ],
            ),

            SizedBox(height: ConstVar.mediumspace,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 1),
                      )
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Suggested Tutors",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ConstVar.minspace,),

                RichText(
                  text: TextSpan(
                      text: "Keegan ",
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: 'More info',
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/tutor/detail');

                              }
                        )
                      ]
                  ),
                  // loginButton,
                  // forgotLabel
                )
              ],
            ),
            SizedBox(height: ConstVar.mediumspace,),


          ],
        ),
      ),
    );
  }

  List<Widget> getTopicList(List<Topic> topicList){
    topicList.sort((a, b) => a.orderCourse!..compareTo(b.orderCourse!));
    List<Widget> list = [];
    for (var i = 0; i < topicList.length; i++){
      list.add(SizedBox(height: 10,));
      list.add( Card(
        child: Container(
            padding: EdgeInsets.fromLTRB(20,40,10,20),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${i+1}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            "${topicList[i].name}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      )
                    ],
                  ),


                ],
              ),
            )
        ),
        elevation: 5,
        shadowColor: Colors.grey,
      ));
    }
    return list;
  }



}

