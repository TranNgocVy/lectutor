
import 'package:flutter/material.dart';
import 'package:lectutor/config/const.dart';
import 'package:lectutor/handle/schedule.dart';
import 'package:lectutor/handle/videocall.dart';
import 'package:lectutor/model/argument.dart';
import 'package:lectutor/model/courses.dart';
import 'package:lectutor/model/schedule.dart';
import '../../config/pkg.dart';
import '../../model/bookingInfo.dart';
import '../../model/teacher.dart';
import '../const/constVar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../const/page.dart';


class ScheduleList extends StatelessWidget {
  final ScheduleArg scheduleArg;
  const ScheduleList({super.key, required this.scheduleArg});

  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, ScheduleListPage(scheduleArg: scheduleArg));

  }
}

class ScheduleListPage extends StatefulWidget {
  final ScheduleArg scheduleArg;
  const ScheduleListPage({super.key, required this.scheduleArg});
  @override
  State<ScheduleListPage> createState() => _ScheduleListPage();

}

class _ScheduleListPage extends State<ScheduleListPage> {
  late ScheduleArg scheduleArg;
  int index = 0;
  // bool isValid = true;
  TextEditingController noteController = TextEditingController();
  String reason = "";

  int selectId = 1;
  @override
  void initState() {
    super.initState();
    scheduleArg = widget.scheduleArg;
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
                    image: Svg('assets/icon/schedule.svg'),
                  ),

                  Text(
                    "Schedule",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

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
                              "Here is a list of the sessions you have booked",
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
                              "You can track when the meeting starts, join the meeting with one click or can cancel the meeting before 2 hours",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Last Book",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: ConstVar.mediumspace,),


                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                      color: Colors.grey.shade100,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.grey.shade200, width: 1),
                            // ),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.grey.shade200, width: 1),
                                color: Colors.white
                            ),
                            child: Text(
                              "Name of the book",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      color: Colors.grey.shade100,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.grey.shade200, width: 1),
                            // ),
                            child: Text(
                              "Page",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.grey.shade200, width: 1),
                              color: Colors.white,
                            ),
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87 ,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 1),
                        color: Colors.grey.shade100
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.grey.shade200, width: 1),
                            // ),
                            child: Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.grey.shade200, width: 1),
                                color: Colors.white

                            ),
                            child: Text(
                              "Description about this book.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87 ,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

              SizedBox(height: ConstVar.mediumspace,),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200, width: 1)
                    )
                ),
              ),
              SizedBox(height: ConstVar.largespace,),

              Column(
                children:
                getScheduleList(scheduleArg.bookingList),
              ),
              SizedBox(height: ConstVar.mediumspace,),

              getPage(scheduleArg.count),

            ]
        )
    );



  }

  List<Widget> getScheduleList(List<BookingInfo> scheduleList){
    List<Widget> list = [];
    for (index = 0; index < scheduleList.length; index++){
      int tempIndex = index;
      List<Widget> lessonList = getLesson(scheduleList);
      list.add(SizedBox(height: 10,));
      list.add( Card(
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
                      "${Pkg.getDate(scheduleList[tempIndex].scheduleDetailInfo!.startPeriodTimestamp)}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      lessonList.length == 1 ?"1 lesson" : "${lessonList.length - 1} consecutive lessons",
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
                    Pkg.setAvatar(scheduleList[tempIndex].scheduleDetailInfo!.scheduleInfo.tutorInfo.avatar, scheduleList[tempIndex].scheduleDetailInfo!.scheduleInfo.tutorInfo.name),
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
                                    "${scheduleList[tempIndex].scheduleDetailInfo!.scheduleInfo.tutorInfo.name}",
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
                                    "${scheduleList[tempIndex].scheduleDetailInfo!.scheduleInfo.tutorInfo.country}",
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
                padding: EdgeInsets.fromLTRB(5,0,5,0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: lessonList,
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
                                    "Request for lesson",
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
                              initialValue: getRequests(scheduleList, tempIndex, index),
                              decoration: InputDecoration(
                                hintMaxLines: 3,
                                hintText: 'Currently there are no requests for this class. Please write down any requests for the teacher.',
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
                                    "Edit request",
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
                      String room = "${scheduleList[tempIndex].userId}-${scheduleList[tempIndex].scheduleDetailInfo!.scheduleInfo.tutorId!}";
                      print("room $room");
                      // print("name ${context.read()<User>().name}");

                      await VideoCall.videoCall(ConstVar.meetServer, room, "Phhaiii", "student@lettutor.com");
                    },
                    child: Text(
                      "Go to meeting",
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
      ));
    }
    return list;
  }

  List<Widget> getLesson (List<BookingInfo> bookinglist){
    List<Widget> list = [];
    int endIndex = index;
    for(endIndex;; endIndex++){
      list.add(Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(
              //ToDo
              "${Pkg.getDurationLession(bookinglist[endIndex].scheduleDetailInfo!.startPeriodTimestamp, bookinglist[endIndex].scheduleDetailInfo!.endPeriodTimestamp)}",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            )),
            if(bookinglist[endIndex].scheduleDetailInfo!.startPeriodTimestamp - DateTime.now().millisecondsSinceEpoch > Const.preTimeToCancel)
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.red)
                      )
                  ),
                ),
                icon: Icon(Icons.cancel_presentation, size: 20,color: Colors.red),
                label: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
                onPressed: (){
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>  Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height - 20,
                        child: ListView(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(onPressed:() {
                                  Navigator.pop(context);
                                }, icon: Icon(Icons.close, color: Colors.red,))
                              ],
                            ),
                            SizedBox(height: ConstVar.minspace),
                            Center(
                              child: Container(

                                child: Column(
                                  children:<Widget> [
                                    Pkg.setAvatar(bookinglist[endIndex].scheduleDetailInfo!.scheduleInfo.tutorInfo.avatar, bookinglist[endIndex].scheduleDetailInfo!.scheduleInfo.tutorInfo.name),
                                    SizedBox(height: ConstVar.minspace,),
                                    Text(bookinglist[endIndex].scheduleDetailInfo!.scheduleInfo.tutorInfo.name!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                                    SizedBox(height: ConstVar.mediumspace,),
                                    const Text("Lesson Time", style: TextStyle(color: Colors.black54, fontSize: 20),),
                                    SizedBox(height: ConstVar.minspace,),
                                    Text(Pkg.getDate(bookinglist[endIndex].scheduleDetailInfo!.startPeriodTimestamp), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: ConstVar.largespace),
                            Container(
                              padding: EdgeInsets.all( ConstVar.largespace),
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(color: Colors.grey.shade200, width: 1)
                                  )
                              ),
                              child: Column(

                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        "* ",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                        ),
                                      ),

                                      new Expanded(
                                        child: Text(
                                          "What was the reason you cancel this booking?",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: ConstVar.mediumspace,),
                                  DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder( //<-- SEE HERE
                                        borderSide: BorderSide(color: Colors.grey, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder( //<-- SEE HERE
                                        borderSide: BorderSide(color: Colors.grey, width: 1),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    dropdownColor: Colors.white,
                                    // onTap: (){
                                    //   setIsValid(true);
                                    // },
                                    // value: ConstVar.levelMap[user.level.toString()],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        reason = newValue!;
                                      });
                                    },

                                    items: (ConstVar.reasonCancel).map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                          value: value,
                                          child: Expanded(
                                            child: Text(
                                              value,
                                            ),
                                          )
                                      );
                                    }).toList(),
                                  ),
                                  SizedBox(height: ConstVar.minspace,),
                                  // isValid == false ? Text("The reason cannot be empty!", style: TextStyle(color: Colors.red),) : Container(),
                                  SizedBox(height: ConstVar.largespace),
                                  TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    autofocus: false,
                                    minLines: 4,
                                    maxLines: null,
                                    controller: noteController,
                                    decoration: InputDecoration(
                                      hintText: 'Additional Notes',
                                      hintStyle: TextStyle(color: Colors.grey.shade200),
                                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                    ),
                                  ),
                                  SizedBox(height: ConstVar.largespace),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                        onPressed:() {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Later", style: TextStyle(color: Colors.black54),),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.grey.shade200,
                                        ),
                                      ),
                                      SizedBox(width: ConstVar.mediumspace,),
                                      ElevatedButton(onPressed:() async {
                                        print("Reason: " + reason);
                                        if(reason == ""){
                                          // setIsValid(false);
                                        }
                                        else{
                                          print(bookinglist[endIndex].scheduleDetailInfo!.id);
                                          var result = await cancelAClass(Const.token, bookinglist[endIndex].id);
                                          print(result);
                                          Navigator.pop(context);
                                          if (result == true){
                                            ScheduleArg newScheduleArg = await getUpcomingClass(Const.token, index);
                                            setState(() {
                                              scheduleArg = newScheduleArg;
                                            });
                                          }
                                        }

                                      }, child: Text("Submit")),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ));

      if(endIndex + 1 >= scheduleArg.bookingList.length ||
          scheduleArg.bookingList[endIndex].scheduleDetailInfo!.startPeriodTimestamp + 1800000 != scheduleArg.bookingList[endIndex + 1].scheduleDetailInfo!.startPeriodTimestamp  ||
          bookinglist[endIndex].scheduleDetailInfo!.scheduleInfo.tutorId != bookinglist[endIndex + 1].scheduleDetailInfo!.scheduleInfo.tutorId){
        break;
      }
    }

    if(list.length > 1) {
      list.insertAll(0, [Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(
              //ToDo
              "Lesson Time: ${Pkg.getDurationLession(bookinglist[index].scheduleDetailInfo!.startPeriodTimestamp, bookinglist[endIndex].scheduleDetailInfo!.endPeriodTimestamp)}",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.bold
              ),
            )),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      )]);
    }
    index = endIndex;
    return list;
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

  // void setIsValid (bool _isValid){
  //   setState(() {
  //     isValid = _isValid;
  //   });
  // }


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
            scheduleArg = newScheduleArg;
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
                scheduleArg = newScheduleArg;
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
            scheduleArg = newScheduleArg;
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