
import 'package:flutter/material.dart';
import 'package:lectutor/handle/schedule.dart';
import 'package:lectutor/model/argument.dart';
import 'package:lectutor/model/bookingInfo.dart';
import 'package:lectutor/model/courses.dart';
import 'package:lectutor/model/schedule.dart';
import 'package:provider/provider.dart';
import '../../config/const.dart';
import '../../config/pkg.dart';
import '../../model/feedBack.dart';
import '../../model/language/language.dart';
import '../../model/language/provider.dart';
import '../../model/teacher.dart';
import '../const/constVar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../const/page.dart';



class ScheduleHistory extends StatelessWidget {
  final ScheduleArg historyScheduleArg;
  const ScheduleHistory({super.key, required this.historyScheduleArg});

  @override
  Widget build(BuildContext context) {
    // return TemplatePage.getHeader(context, ScheduleHistoryPage(historyScheduleArg: historyScheduleArg));
    return TemplatePage(widget: ScheduleHistoryPage(historyScheduleArg: historyScheduleArg));

  }
}

class ScheduleHistoryPage extends StatefulWidget {
  final ScheduleArg historyScheduleArg;
  const ScheduleHistoryPage({super.key, required this.historyScheduleArg});
  @override
  State<ScheduleHistoryPage> createState() => _ScheduleHistoryPage();

}

class _ScheduleHistoryPage extends State<ScheduleHistoryPage> {
  late ScheduleArg historyBookingList;
  int selectId = 1;

  @override
  void initState() {
    super.initState();
    historyBookingList = widget.historyScheduleArg;
  }


  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;

    Pkg.getLanguage(languageProvider);
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
                    language.history,
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
                              language.descriptionHistory,
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 16
                              ),
                            ),
                          )
                        ],
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     Expanded(
                      //       child: Text(
                      //         "You can review the details of the lessons you have attended",
                      //         style: TextStyle(
                      //             color: Colors.black38,
                      //             fontSize: 16
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: ConstVar.largespace),

              Column(
                children:
                getScheduleList(historyBookingList.bookingList, language),
              ),
              SizedBox(height: ConstVar.mediumspace,),

              getPage(historyBookingList.count),
            ]
        )
    );



  }

  List<Widget> getScheduleList(List<BookingInfo> scheduleList, Language language){
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
                            // Row(
                            //   children: <Widget>[
                            //     Icon(
                            //       Icons.messenger_outline_outlined,
                            //       color: Colors.blue,
                            //       size: 25,
                            //     ),
                            //     Expanded(
                            //       child: TextButton(
                            //         onPressed: null,
                            //         child: Text(
                            //           "Direct Message",
                            //           style: TextStyle(
                            //             fontSize: 16,
                            //             color: Colors.blue,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //
                            //   ],
                            // ),
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
                          "${language.LessonTime} ${Pkg.getDurationLession(scheduleList[i].scheduleDetailInfo!.startPeriodTimestamp, scheduleList[i].scheduleDetailInfo!.endPeriodTimestamp)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),

                        // SizedBox(height: 2,),
                        // if(scheduleList[i].showRecordUrl != null && scheduleList[i]!.showRecordUrl == true)
                        //   ElevatedButton.icon(
                        //     style: const ButtonStyle(
                        //       backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        //     ),
                        //     icon: Icon(Icons.video_library, size: 20,color: Colors.white),
                        //     label: Text(
                        //       'Record',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 20,
                        //       ),
                        //     ),
                        //     onPressed: null,
                        //   ),
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
                              scheduleList[i].studentRequest != null && scheduleList[i].studentRequest!.isNotEmpty ? language.requestForLesson : language.noRequestForLesson,
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
                              language.tutorHaveNotReviewed,
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
                        children: getRatingList(scheduleList[i].feedbacks!, language)

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

  List<Widget> getRatingList(List<FeedBack> feedbackList, Language language){
    List<Widget> list = [];
    if(feedbackList.length == 0){
      list.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(
            onPressed: null,
            child: Text(
              language.addRating,
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
              language.report,
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
                    Text(language.Rating, style: TextStyle(fontSize: 18,
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
                        language.report,
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
                        language.report,
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

  Widget getPage(int count){
    int preId = 1;
    // bool isContinuous = true;
    List<Widget> list = [];
    int temp = count;
    list.add(GestureDetector(
      onTap: ()async{
        if (selectId > 1){
          setState(() {
            selectId = selectId - 1;
          });
          ScheduleArg newScheduleArg = await getStudentBookedClass(Const.token, selectId);
          setState(() {
            historyBookingList = newScheduleArg;
          });

        }
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Icon(Icons.chevron_left_rounded),
      ),
    ));
    for(int i = 1; temp > 0; i++){
      if(i == 1 || i - 1 == (count - 1) ~/ Const.perPage || ( selectId - 2 < i && i < selectId + 2 )) {
          list.add(GestureDetector(
            onTap: ()async{
              if (i != selectId){
                setState(() {
                  selectId = i;
                });
                ScheduleArg newScheduleArg = await getStudentBookedClass(Const.token, selectId);
                setState(() {
                  historyBookingList = newScheduleArg;
                });
              }
            },
            child: Container(
              color: i == selectId ? Colors.blue.shade100: Colors.white,
              padding: EdgeInsets.all(5),
              child: Text("$i"),
            ),
          ));

          preId = i;
      }
      else{
        if(preId + 1 == i){
          list.add(Container(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.more_horiz),
          ));
        }

      }

      temp = temp - Const.perPage;
    }

    list.add(GestureDetector(
      onTap: ()async{
        if (selectId <= (count - 1)~/ Const.perPage){

          setState(() {
            selectId = selectId + 1;
          });
          ScheduleArg newScheduleArg = await getStudentBookedClass(Const.token, selectId);
          setState(() {
            historyBookingList = newScheduleArg;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Icon(Icons.chevron_right_rounded),
      ),
    ));

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
    );
  }

}