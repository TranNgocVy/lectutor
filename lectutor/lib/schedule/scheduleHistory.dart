
import 'package:flutter/material.dart';
import 'package:lectutor/model/course.dart';
import 'package:lectutor/model/schedule.dart';
import '../const/constVar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../const/page.dart';
import '../model/teacher.dart';



class ScheduleHistory extends StatelessWidget {
  const ScheduleHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, ScheduleHistoryPage());

  }
}

class ScheduleHistoryPage extends StatefulWidget {
  const ScheduleHistoryPage({super.key});
  @override
  State<ScheduleHistoryPage> createState() => _ScheduleHistoryPage();

}

class _ScheduleHistoryPage extends State<ScheduleHistoryPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: ListView(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image(
                    image: Svg('assets/icon/history.svg'),
                  ),

                  Text(
                    "History",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                  // Expanded(
                  //   child: Container(
                  //     padding: EdgeInsets.only(left: 5,top: 5),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: <Widget>[
                  //         SizedBox(height: ConstVar.minspace),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                ],
              ),

              SizedBox(height: ConstVar.minspace),

              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.black12, width: 3),
                  ),
                ),
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "The following is a list of lessons you have attended",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 16
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "You can review the details of the lessons you have attended",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 16
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: ConstVar.largespace),

              Column(
                children:
                getScheduleList([Schedule("Fri, 30 Sep 22","01:30", "01:55", "finish",1), Schedule("Fri, 30 Sep 22", "02:", "02:25", "finish",1)],
                    [Teacher(1, "Keengan", "France", "Description about him", [], [],[]), Teacher(1, "Keengan", "France", "Description about him", [], [],[])]),
              )
            ]
        )
    );



  }

  List<Widget> getScheduleList(List<Schedule> scheduleList, List<Teacher> teacherList){
    List<Widget> list = [];
    for (var i = 0; i < scheduleList.length; i++){
      list.add(SizedBox(height: 10,));
      list.add( Card(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      scheduleList[i].day,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      "Khoảng thời gian",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: ConstVar.mediumspace,),

              Container(
                padding: EdgeInsets.fromLTRB(10,5,10,5),
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.account_circle_outlined,
                      size: 80,
                      color: Colors.blue,
                    ),

                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5,top: 5),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    teacherList[i].name,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),)
                              ],
                              mainAxisSize: MainAxisSize.min,
                            ),
                            // SizedBox(height: 1),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.south_america_sharp,
                                  size: 25,
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: Text(
                                    teacherList[i].natioonality,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            // SizedBox(height: 1),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.messenger_outline_outlined,
                                  color: Colors.blue,
                                  size: 25,
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: null,
                                    child: Text(
                                      "Direct Message",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: ConstVar.mediumspace,),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                    Text(
                      "Learned Books",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 1,),
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Expanded(
                        child: Text(
                          "Book list of this lesson in this day, you can read",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: ConstVar.minspace,),

              Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(

                      children: <Widget>[
                        Expanded(child: Text(
                          "Lesson time: " + scheduleList[i].start + " - " + scheduleList[i].end,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(height: 2,),
                    ElevatedButton.icon(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                      ),
                      icon: Icon(Icons.video_library, size: 20,color: Colors.white),
                      label: Text(
                        'Record',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: null,
                    ),

                  ],
                ),
              ),

              SizedBox(height: ConstVar.mediumspace,),

              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "No request for lesson",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey.shade100, width: 1),
                            bottom: BorderSide(color: Colors.grey.shade100, width: 1),
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Tutor haven't reviewed yet",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Add a Rating",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: null,
                            child: Text(
                              "Report",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
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
        elevation: 5,
        shadowColor: Colors.grey,
      ));
    }
    return list;
  }

}