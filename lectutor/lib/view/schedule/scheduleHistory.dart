
import 'package:flutter/material.dart';
import 'package:lectutor/model/bookingInfo.dart';
import 'package:lectutor/model/courses.dart';
import 'package:lectutor/model/schedule.dart';
import '../../config/pkg.dart';
import '../../model/feedBack.dart';
import '../../model/teacher.dart';
import '../const/constVar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../const/page.dart';



class ScheduleHistory extends StatelessWidget {
  final List<BookingInfo> bookingList;
  const ScheduleHistory({super.key, required this.bookingList});

  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, ScheduleHistoryPage(bookingList: bookingList));

  }
}

class ScheduleHistoryPage extends StatefulWidget {
  final List<BookingInfo> bookingList;
  const ScheduleHistoryPage({super.key, required this.bookingList});
  @override
  State<ScheduleHistoryPage> createState() => _ScheduleHistoryPage();

}

class _ScheduleHistoryPage extends State<ScheduleHistoryPage> {
  late List<BookingInfo> bookingList;

  @override
  void initState() {
    super.initState();
    bookingList = widget.bookingList;
    print(bookingList.length);
  }


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
                getScheduleList(bookingList),
              )
            ]
        )
    );



  }

  List<Widget> getScheduleList(List<BookingInfo> scheduleList){
    List<Widget> list = [];
    for (var i = 0; i < scheduleList.length ; i++){
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
                      //Todo
                      "${Pkg.getDate(scheduleList[i].scheduleDetailInfo!.startPeriodTimestamp)}",
                      // scheduleList[i].day,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      "${Pkg.getDayPast(scheduleList[i].scheduleDetailInfo!.startPeriodTimestamp)}",
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
                    Pkg.setAvatar(scheduleList[i].scheduleDetailInfo!.scheduleInfo.tutorInfo.avatar, scheduleList[i].scheduleDetailInfo!.scheduleInfo.tutorInfo.name),

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
                                    "${scheduleList[i].scheduleDetailInfo!.scheduleInfo.tutorInfo.name}",
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
                                    "${scheduleList[i].scheduleDetailInfo!.scheduleInfo.tutorInfo.country}",
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

              // Container(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //
              //     children: <Widget>[
              //       Text(
              //         "Learned Books",
              //         textAlign: TextAlign.left,
              //         style: TextStyle(
              //           color: Colors.black87,
              //           fontSize: 18,
              //         ),
              //       ),
              //       SizedBox(height: 1,),
              //       Container(
              //         padding: EdgeInsets.all(10),
              //         color: Colors.white,
              //         child: Expanded(
              //           child: Text(
              //             "Book list of this lesson in this day, you can read",
              //             style: TextStyle(
              //               fontSize: 18,
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(height: ConstVar.minspace,),

              Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(child: Text(
                          "Lesson time: ${Pkg.getDurationLession(scheduleList[i].scheduleDetailInfo!.startPeriodTimestamp, scheduleList[i].scheduleDetailInfo!.endPeriodTimestamp)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),

                        SizedBox(height: 2,),
                        if(scheduleList[i].showRecordUrl != null && scheduleList[i]!.showRecordUrl == true)
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
                      // mainAxisAlignment: MainAxisAlignment.center,
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
                              scheduleList[i].studentRequest != null && scheduleList[i].studentRequest!.isNotEmpty ? "Request for lesson" : "No request for lesson",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (scheduleList[i].studentRequest != null && scheduleList[i].studentRequest!.isNotEmpty )
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "${scheduleList[i].studentRequest}",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.left,
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
                      child: Column(
                        children: getRatingList(scheduleList[i].feedbacks!)

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

  List<Widget> getRatingList(List<FeedBack> feedbackList){
    List<Widget> list = [];
    if(feedbackList.length == 0){
      list.add(Row(
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
      ));
    }
    else{
      for(int i =0 ;i< feedbackList.length; i++){
        list.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Rating", style: TextStyle(fontSize: 18,
                      color: Colors.black87,),),
                    SizedBox(width: 5,),
                    Row(
                      children: Pkg.getRating(feedbackList[i].rating!),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                )

              ],
            )
        );

      }
    }
    return list;
  }

}