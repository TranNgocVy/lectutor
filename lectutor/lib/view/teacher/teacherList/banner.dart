
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:provider/provider.dart';
import '../../../config/pkg.dart';
import '../../../handle/user.dart';
import '../../../handle/videocall.dart';
import '../../../model/booking/bookingInfo.dart';
import '../../../model/language/provider.dart';
import '../../../model/user/tokens.dart';
import '../../const/constVar.dart';


class Banner extends StatefulWidget {
  const Banner({super.key});
  @override
  State<Banner> createState() => _Banner();

}

class _Banner extends State<Banner> {
  late CountdownController countdownController;
  List<BookingInfo> nextbookingList = [];
  int totalTime = 0;

  bool isLoadingTotalTime = true;
  bool isLoadingNextLesson =true;
  bool? startCallNextLesson;

  void getNextTotalTime(String token) async{
    var total = await UserService.getLearningTimeTotal(token);

    if(mounted){
      setState(() {
        //total tinme
        totalTime = total;
        isLoadingTotalTime = false;
      });
    }
  }

  void getNextBookingList(String token) async{
    if(startCallNextLesson == null || startCallNextLesson == false){
      startCallNextLesson = true;
      var list = await UserService.getLession(token);

      if(mounted){
        setState(() {
          nextbookingList = list;
          print(nextbookingList.length);

          if (nextbookingList.length > 0 ){
            int now = DateTime.now().millisecondsSinceEpoch;
            countdownController = CountdownController(duration: Duration(milliseconds: nextbookingList[0].scheduleDetailInfo!.startPeriodTimestamp - now));
            countdownController.start();
          }
          else{
            countdownController = CountdownController(duration: Duration(seconds: 0));
          }
          isLoadingNextLesson = false;

        });
      }
    }
    startCallNextLesson = false;
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;
    Pkg.getLanguage(languageProvider);

    final tokenProvider = Provider.of<Tokens>(context);
    final token = tokenProvider.access.token;

    if(startCallNextLesson == null){
      getNextBookingList(token);
    }
    if(isLoadingTotalTime){
      getNextTotalTime(token);
    }



    return Container(
      color: Colors.blue,
      padding: EdgeInsets.fromLTRB(10,30,10,10),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Column>[
            Column(
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      nextbookingList.length != 0 ? language.nextLesson : language.noUpComing,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: ConstVar.mediumspace),
                if(nextbookingList.length != 0)
                  Column(
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: " ${Pkg.getDate(nextbookingList[0].scheduleDetailInfo!.startPeriodTimestamp)} ${Pkg.getDurationLession(nextbookingList[0].scheduleDetailInfo!.startPeriodTimestamp, nextbookingList[0].scheduleDetailInfo!.endPeriodTimestamp)}",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          // children: <TextSpan>[
                          //   TextSpan(text: ' (start in 65:65:51)',
                          //     style: TextStyle(color: Colors.yellow, fontSize: 12),
                          //     // recognizer: TapGestureRecognizer()
                          //     //   ..onTap = () {}
                          //   )
                          // ]
                        ),
                        // loginButton,
                        // forgotLabel
                      ),
                      Countdown(
                          countdownController: countdownController,
                          builder: (_, Duration time) {
                            return Text(
                              '${language.startIn} ${time.inHours < 10 ? "0${time.inHours}":time.inHours}:${time.inMinutes % 60 < 10 ? "0${time.inMinutes % 60}":time.inMinutes % 60}:${time.inSeconds % 60 < 10 ? "0${time.inSeconds % 60}" : time.inSeconds % 60}',
                              style: TextStyle(color: Colors.yellow, fontSize: 12),
                            );
                          }),
                      SizedBox(height: ConstVar.minspace),
                      ElevatedButton.icon(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        ),
                        // style: ElevatedButton.styleFrom(
                        //   shape: RoundedRectangleBorder(borderRadius: );
                        // ),

                        icon: Icon(Icons.video_library, size: 20,color: Colors.blue,),
                        label: Text(
                          language.enterroom,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                          ),
                        ),
                        onPressed: ()async {
                          String room = "${nextbookingList[0].userId}-${nextbookingList[0].scheduleDetailInfo!.scheduleInfo.tutorId!}";

                          await VideoCall.videoCall(ConstVar.meetServer, room, "Phhaiii", "student@lettutor.com");
                        },
                      ),
                    ],
                  ),
                SizedBox(height: ConstVar.minspace),
                Text(
                  totalTime < 60 ? "${language.totalLessonTimeIs} ${totalTime} ${language.minutes}" : "${language.totalLessonTimeIs} ${totalTime ~/ 60} ${language.hour} ${totalTime % 60} ${language.minutes}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ]
      ),
    );
  }
}