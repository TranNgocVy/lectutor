
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import '../../../config/pkg.dart';
import '../../../handle/user.dart';
import '../../../handle/videocall.dart';
import '../../../model/booking/bookingInfo.dart';
import '../../../model/language/provider.dart';
import '../../../model/user/tokens.dart';
import '../../const/constVar.dart';


class LessonCard extends StatefulWidget {
  final BookingInfo bookingInfo;
  final List<Widget> lessonListWidget;
  final String request;
  const LessonCard({super.key, required this.bookingInfo, required this.lessonListWidget, required this.request});
  @override
  State<LessonCard> createState() => _LessonCard();

}

class _LessonCard extends State<LessonCard> {
  late BookingInfo bookingInfo;
  late List<Widget> lessonListWidget;
  late String request;
  @override
  void initState() {
    bookingInfo = widget.bookingInfo;
    lessonListWidget = widget.lessonListWidget;
    request = widget.request;
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;
    Pkg.getLanguage(languageProvider);

    final tokenProvider = Provider.of<Tokens>(context);
    final token = tokenProvider.access.token;

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${Pkg.getDate(bookingInfo.scheduleDetailInfo!.startPeriodTimestamp)}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    lessonListWidget.length == 1 ?"1 ${language.lesson}" : "${lessonListWidget.length - 1} ${language.lesson}",
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
                  Pkg.setAvatar(bookingInfo.scheduleDetailInfo!.scheduleInfo.tutorInfo.avatar, bookingInfo.scheduleDetailInfo!.scheduleInfo.tutorInfo.name),
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
                                  "${bookingInfo.scheduleDetailInfo!.scheduleInfo.tutorInfo.name}",
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
                              Image(
                                image: Svg('assets/icon/nationality.svg'),
                                height: 25,

                              ),
                              // Icon(
                              //   Icons.south_america_sharp,
                              //   size: 25,
                              // ),
                              SizedBox(width: 5,),
                              Expanded(
                                child: Text(
                                  "${bookingInfo.scheduleDetailInfo!.scheduleInfo.tutorInfo.country}",
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

            Container(
              padding: EdgeInsets.fromLTRB(5,0,5,0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Column(
                    children: lessonListWidget,
                  ),
                  SizedBox(height: 2,),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400, width: 1),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0,0,5,0),
                          color: Colors.grey.shade200,
                          child: Row(
                            children: <Widget>[
                              TextButton.icon(     // <-- TextButton
                                onPressed: () {},
                                icon: Icon(
                                  Icons.expand_more_outlined,
                                  size: 24.0,
                                  color: Colors.black87,
                                ),
                                label: Text(
                                  language.requestForLesson,
                                  // textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.grey.shade400, width: 1),
                              )
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 4,
                            autofocus: false,
                            enabled: false,
                            initialValue: request,
                            decoration: InputDecoration(
                              hintMaxLines: 3,
                              hintText: language.requestForLessonHint,
                              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                              // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0,0,5,0),
                          color: Colors.grey.shade200,
                          child: Row(
                            children: <Widget>[
                              TextButton(
                                onPressed: null,
                                child: Text(
                                  language.edit,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ConstVar.minspace,)



                ],
              ),
            ),

            SizedBox(height: ConstVar.minspace,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.grey.shade400)
                          )
                      )
                  ),
                  onPressed:  ()async {
                    String room = "${bookingInfo.userId}-${bookingInfo.scheduleDetailInfo!.scheduleInfo.tutorId!}";
                    print("room $room");
                    // print("name ${context.read()<User>().name}");

                    await VideoCall.videoCall(ConstVar.meetServer, room, "Phhaiii", "student@lettutor.com");
                  },
                  child: Text(
                    language.goToMeeting,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),

                ),
              ],
            ),

            SizedBox(height: ConstVar.mediumspace,)


          ],
        ),
      ),
      elevation: 5,
      shadowColor: Colors.grey,
    );
  }
  String getRequests(List<BookingInfo> bookingList, int start, int end){
    String request = "";
    for(int i = start; i<= end; i++){
      if(bookingList[i].studentRequest != null && bookingList[i].studentRequest!.isNotEmpty){
        request = request + "${bookingList[i].studentRequest}\n";
      }
    }
    return request;
  }
}