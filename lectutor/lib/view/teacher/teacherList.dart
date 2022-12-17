import 'dart:core';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lectutor/handle/schedule.dart';
import 'package:lectutor/handle/teacher.dart';
import 'package:lectutor/handle/user.dart';
import 'package:lectutor/model/bookingInfo.dart';
import 'package:lectutor/model/teacher.dart';
import 'package:lectutor/model/tutorDetail.dart';
import 'package:lectutor/model/user.dart';
import 'package:provider/provider.dart';
import 'package:time_range_picker/time_range_picker.dart';
import '../../config/const.dart';
import '../../config/pkg.dart';
import '../../model/schedule.dart';
import '../../model/tokens.dart';
import '../../model/tutor.dart';
import '../const/choicechip.dart';
import '../const/constVar.dart';
import '../const/page.dart';
import '../const/specialtieschoiceschip.dart';


class TeacherList extends StatelessWidget {
  const TeacherList({super.key});


  // const TeacherList({super.key, required this.user});

  // final User user;

  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, TeacherListPage());

  }
}

class TeacherListPage extends StatefulWidget {
  const TeacherListPage({super.key});

  @override
  State<TeacherListPage> createState() => _TeacherListPage();
}

class _TeacherListPage extends State<TeacherListPage> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _ntFocus = FocusNode();
  final TextEditingController _dController = TextEditingController();
  final FocusNode _dFocus = FocusNode();
  final TextEditingController _tController = TextEditingController();
  final FocusNode _tFocus = FocusNode();
  final FocusNode _tgFocus = FocusNode();
  late CountdownController countdownController;

  List<ChoiceChipData> specialtiesChoiceChips = SpecialtiesChoiceChips.getSpecialties(ConstVar.type, false);

  TimeOfDay initS = TimeOfDay(hour: 7, minute: 0);
  TimeOfDay initE = TimeOfDay(hour: 8, minute: 0);
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      setState(() {
        _dController.text = "${selectedDate.toLocal()}".split(' ')[0];
        _dFocus.requestFocus();
      });
    }
    else if (picked == selectedDate) {
      return;
    }
    else {
      setState(() {
        _dController.clear();
        selectedDate = DateTime.now();
      });
    }
  }

  List<Tutor>  tutorList = [];
  List<Tutor>  favoriteTutorList = [];
  List<BookingInfo> nextbookingList = [];

  int totalTime = 0;

  void getTutor() async{
    var data = await getTeacherList(context);
    if (data != null){
      setState(() {
        updateLists(data);
      });
    }
  }
  void getNextBookingList() async{
    var list = await getLession(Const.token);
    if (list != []){
      setState(() {
        nextbookingList = list;
        print(nextbookingList.length);

        if (nextbookingList.length > 0 ){
          print(nextbookingList[0].scheduleDetailInfo?.scheduleInfo.date);
          print(nextbookingList[0].scheduleDetailInfo?.scheduleInfo.startTime);
          print(nextbookingList[0].scheduleDetailInfo?.scheduleInfo.endTime);
          int now = DateTime.now().millisecondsSinceEpoch;
          countdownController = CountdownController(duration: Duration(milliseconds: nextbookingList[0].scheduleDetailInfo!.startPeriodTimestamp - now));
          countdownController.start();
        }
        else{
          countdownController = CountdownController(duration: Duration(seconds: 0));
        }
      });
    }
  }
  void getTotalTime() async{
    var total = await getLearningTimeTotal(Const.token);
    setState(() {
      totalTime = total;
    });
  }
  void updateLists(dynamic data){
    var tutors = data["tutors"]["rows"];
    var favoriteTutor = data["favoriteTutor"];
    for(int i = 0; i < Const.perPage; i++){
      tutorList.add(Tutor.fromJson(tutors[i]));
    }

    try{
      for(int i = 0;; i++){
        favoriteTutorList.add(Tutor.fromJson(favoriteTutor[i]));
      }

    }catch(e){}
  }


  @override
  void initState() {
    super.initState();
    getTotalTime();
    getNextBookingList();

    getTutor();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(10,30,10,10),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Column>[
                  Column(
                    children: <Widget>[
                      Text(
                        nextbookingList.length != 0 ? "Upconming lesson" : "No upcoming lesson.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
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
                                    'Start in ${time.inHours < 10 ? "0${time.inHours}":time.inHours}:${time.inMinutes % 60 < 10 ? "0${time.inMinutes % 60}":time.inMinutes % 60}:${time.inSeconds % 60 < 10 ? "0${time.inSeconds % 60}" : time.inSeconds % 60}',
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
                                'Enter lesson room',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                ),
                              ),
                              onPressed: null,
                            ),
                          ],
                        ),
                      SizedBox(height: ConstVar.minspace),
                      Text(
                        totalTime < 60 ? "Total lesson time is ${totalTime} minutes" : "Total lesson time is ${totalTime ~/ 60} hours ${totalTime % 60} minutes",
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
          ),

          Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Find a tutor",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: ConstVar.mediumspace),

                        TextFormField(
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Enter tutor name ...',
                            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                          ),
                        ),
                        SizedBox(height: ConstVar.minspace),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Focus(
                              focusNode: _ntFocus,
                              child: Listener(
                                onPointerDown: (_) {
                                  FocusScope.of(context).requestFocus(_ntFocus);
                                },
                                child: DropdownSearch<String>.multiSelection(
                                  items: ConstVar.tutornationalityList,
                                  popupProps: PopupPropsMultiSelection.menu(
                                    showSelectedItems: true,
                                    showSearchBox: true,
                                  ),
                                  clearButtonProps: ClearButtonProps(
                                    isVisible: true,
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.zero,
                                  ),
                                  dropdownButtonProps: DropdownButtonProps(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(right: 12),
                                  ),
                                  dropdownDecoratorProps: DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(50)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.blue),
                                        borderRadius: BorderRadius.all(Radius.circular(50)),
                                      ),
                                      hintText: 'Select tutor nationnality',
                                    ),
                                  ),
                                  // selectedItems: ['Item1', 'Item2'],
                                  onChanged: (val) {
                                    setState(() {
                                      _ntFocus.requestFocus();
                                    });
                                  },
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: ConstVar.minspace),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            ElevatedButton(

                              onPressed: () async{
                                final data = await searchTeacher(context, _nameController.text, [],[]);

                                setState((){
                                  updateLists(data);
                                });
                              },
                              child: const Text(
                                'Search',
                                style: TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                              ),
                              style: ButtonStyle(
                                // backgroundColor: Colors.blue,
                                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: ConstVar.minspace),
                        Text(
                          "Select availiable tutoring time:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: ConstVar.minspace),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            focusNode: _dFocus,
                            controller: _dController,
                            autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                              hintText: 'Select a day',
                              suffixIcon: (_dController.text.isNotEmpty && _dFocus.hasFocus) ?
                              IconButton(onPressed: () {setState(() {
                                _dController.clear();
                                selectedDate = DateTime.now();
                                _dFocus.unfocus();
                              });}, icon: Icon(Icons.clear)) :
                              Icon(Icons.calendar_month_outlined),
                            ),
                            readOnly: true,
                            onTap: () => _selectDate(context),
                          ),
                        ),
                        SizedBox(height: ConstVar.minspace),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _tController,
                            focusNode: _tFocus,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Colors.blue),
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                              ),
                              hintText: 'Time range',
                              suffixIcon: (_tController.text.isNotEmpty && _tFocus.hasFocus) ?
                              IconButton(
                                  onPressed: ()
                                  {
                                    setState(()
                                    {
                                      _tController.clear();
                                      initS = TimeOfDay(hour: 7, minute: 0);
                                      initE = TimeOfDay(hour: 8, minute: 0);
                                      _tFocus.unfocus();
                                    });
                                  }, icon: Icon(Icons.clear)) :
                              Container(
                                  width: 42,
                                  child: Center(
                                    child: SizedBox(
                                      width: 21,
                                      height: 21,
                                      child: Icon(Icons.access_time_rounded, color: _tFocus.hasFocus ? Colors.blue : Colors.grey,),
                                    ),
                                  )
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              TimeRange? result = await showTimeRangePicker(
                                context: context,
                                strokeWidth: 4,
                                timeTextStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                                activeTimeTextStyle: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 26,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                                ticks: 12,
                                ticksOffset: 2,
                                ticksLength: 8,
                                handlerRadius: 8,
                                ticksColor: Colors.grey,
                                rotateLabels: false,
                                interval: const Duration(minutes: 30),
                                minDuration: const Duration(minutes: 30),
                                labels: [
                                  "24 h",
                                  "3 h",
                                  "6 h",
                                  "9 h",
                                  "12 h",
                                  "15 h",
                                  "18 h",
                                  "21 h"
                                ].asMap().entries.map((e) {
                                  return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
                                }).toList(),
                                // disabledTime: TimeRange(
                                //     startTime: const TimeOfDay(hour: 0, minute: 0),
                                //     endTime: const TimeOfDay(hour: 7, minute: 0)),
                                disabledColor: Colors.red,
                                labelOffset: 30,
                                padding: 55,
                                labelStyle: const TextStyle(fontSize: 18, color: Colors.grey,),
                                start: initS,
                                end: initE,
                                clockRotation: 180.0,
                              );
                              if (result != null)  {
                                var sh = result.startTime.hour > 9 ? result.startTime.hour.toString() : ('0' + result.startTime.hour.toString());
                                var sm = result.startTime.minute > 9 ? result.startTime.minute.toString() : ('0' + result.startTime.minute.toString());
                                var eh = result.endTime.hour > 9 ? result.endTime.hour.toString() : ('0' + result.endTime.hour.toString());
                                var em = result.endTime.minute > 9 ? result.endTime.minute.toString() : ('0' + result.endTime.minute.toString());
                                setState(() {
                                  _tController.text = sh + ':' + sm + ' --> ' + eh + ':' + em;
                                  _tFocus.requestFocus();
                                  initS = TimeOfDay(hour: result.startTime.hour, minute: result.startTime.minute);
                                  initE = TimeOfDay(hour: result.endTime.hour, minute: result.endTime.minute);
                                });
                              }
                              else if (result == null) setState(() {
                                _tController.clear();
                                initS = TimeOfDay(hour: 0, minute: 0);
                                initE = TimeOfDay(hour: 0, minute: 0);
                                _tFocus.requestFocus();
                              });
                            },
                          ),
                        ),
                        SizedBox(height: ConstVar.minspace),

                        Wrap(
                          runSpacing: 5,
                          spacing: 5,

                          children: specialtiesChoiceChips.map((value) => ChoiceChip(
                            label: Text(value.label),
                            selected: value.isSelected,
                            selectedColor: Colors.blue.shade100,
                            focusNode: _tgFocus,
                            labelStyle: TextStyle(
                              fontSize: 15,
                            ),
                            onSelected: (isSltd) => setState(() {
                              _tgFocus.requestFocus();
                              value.isSelected = value.isSelected?false: true;
                            }),
                          )).toList(),
                        ),

                        SizedBox(height: ConstVar.mediumspace),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                setState(() {
                                  _nameController.text = "";
                                  _dController.text = "";
                                  _tController.text = "";

                                });
                              },
                                child: Text(
                                  "Reset Filters",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                  ),
                                ),

                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.blue)
                                    )
                                ),
                                backgroundColor:  MaterialStateProperty.all(Colors.white),

                              ),
                            )
                          ],
                        ),
                        SizedBox(height: ConstVar.mediumspace),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: ConstVar.largespace, bottom: ConstVar.minspace),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey,),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Text>[
                        Text(
                          "Recommended Tutors",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: getTutorList(),
                    // [true, false])
                  )
                ],
              )
          ),
          // ),
        ],
      ),
    );
    // mainAxisSize: MainAxisSize.max,

    // );

  }



  Container getElevatedButton(String txt, {bool selected = false}){
    Container btn = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: ElevatedButton(
        onPressed: null,
        child: Text(
          txt,
          style: TextStyle(
            color: selected? Colors.blue:Colors.grey,
            fontSize: 14,
          ),
        ),
        style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );

    return btn;
  }
  List<Widget> getTutorList(){
    List<Widget> list = [];
    for(var i = 0; i < tutorList.length; i++){
      List<String> specialtyList = tutorList[i].specialties.toString().split(",");
      String alias = "";
      List<String> nameSplit = tutorList[i].name.toString().split(" ");
      for(int i = 0; i < nameSplit.length && i < 2; i++){
        alias = alias + nameSplit[i][0];
      }

      list.add(
          Card(
            borderOnForeground: true,
            elevation: 3,
            shadowColor: Colors.grey.shade100,
            margin: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap:  ()  async {
                      late TutorDetail tutorDetail;
                      List<Schedule> schedules = [];

                      var data = await  getTeacherDetail(context, tutorList[i].userId.toString());
                      print(data);
                      if (data != null){
                        tutorDetail = TutorDetail.fromJson(data);
                      }
                      tutorDetail.feedlist = tutorList[i].feedbacks!;
                      print(tutorDetail.User.id);

                      Navigator.pushNamed(context, '/tutor/detail', arguments: tutorDetail);

                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: tutorList[i].avatar != null?
                            CircleAvatar(
                              // backgroundImage: ,
                              backgroundImage: NetworkImage(tutorList[i].avatar.toString()),
                              // backgroundImage: NetworkImage('${context.watch<User>().avatar}'),
                              // maxRadius: 30,
                            ):
                          CircleAvatar(
                            backgroundColor: Colors.blue.shade200,
                            child: Text(
                              alias,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                tutorList[i].name.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Row(
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Image(image: Svg("assets/icon/nationality.svg"),width: 30,)
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      tutorList[i].country.toString(),
                                      style: TextStyle(
                                          fontSize: 14
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: Pkg.getRating(tutorList[i].rating),
                                // children: <Icon>[
                                //   Icon(Icons.star, color: Colors.yellow, size: 15,),
                                //   Icon(Icons.star, color: Colors.yellow, size: 15,),
                                //   Icon(Icons.star, color: Colors.yellow, size: 15,),
                                //   Icon(Icons.star, color: Colors.yellow, size: 15,),
                                //   Icon(Icons.star, color: Colors.yellow, size: 15,),
                                //
                                // ],
                              )
                            ],
                          ),
                        ),

                        Container(
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: <IconButton>[
                                  IconButton(
                                    onPressed: ()async {
                                      int index = isContain(tutorList[i], favoriteTutorList);
                                      if(index != -1){
                                        var data = await addFavoriteTeacher(context, tutorList[i].userId.toString());
                                        if (data == true){
                                          setState(() {
                                            favoriteTutorList.add(tutorList[i]);

                                          });
                                        }
                                      }else{
                                        setState(() {
                                          favoriteTutorList.remove(index);
                                        });
                                      }

                                    },
                                    icon: isContain(tutorList[i], favoriteTutorList) != -1 ? Icon( Icons.favorite,
                                      color:  Colors.red,
                                      size: 30,
                                    ) :  Icon( Icons.favorite_border,
                                      color:  Colors.blue,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  ),


                  Container(
                    child: Wrap(
                      runSpacing: 5,

                      spacing: 5,
                      children: SpecialtiesChoiceChips.getSpecialties(specialtyList, true).map((value) => ChoiceChip(
                        label: Text(value.label,),

                        selected: value.isSelected,
                        selectedColor: Colors.blue.shade100,
                        focusNode: _tgFocus,
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.black
                        ),
                      )).toList(),
                    ),

                  ),

                  Container(
                    child: Text(
                      tutorList[i].bio.toString(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[
                      ElevatedButton.icon(

                        // style: const ButtonStyle(
                        //   backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        //
                        // ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            side: BorderSide(
                                width: 1,
                                color: Colors.blue
                            ),
                          ),
                        ),

                        icon: Icon(Icons.calendar_month_sharp, size: 20,color: Colors.blue,),
                        label: Text(
                          'Book',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                          ),
                        ),
                        onPressed: ()async{
                          late TutorDetail tutorDetail;
                          List<Schedule> schedules = [];

                          var data = await  getTeacherDetail(context, tutorList[i].userId.toString());
                          if (data != null){
                            tutorDetail = TutorDetail.fromJson(data);
                          }
                          tutorDetail.feedlist = tutorList[i].feedbacks!;
                          print(tutorDetail.User.id);

                          Navigator.pushNamed(context, '/tutor/detail', arguments: tutorDetail);
                        },

                      ),
                    ],
                  )
                ],
              ),
            ),

          )
      );
    }
    return list;
  }

  int isContain(Tutor tutor, List<Tutor> favoriteList){
    for(int i = 0; i < favoriteList.length; i++){
      if (tutor.userId == favoriteList[i].userId){
        return i;
      }
    }
    return -1;
  }


  // String getWaitTime(BookingInfo lession){
  //   String second =
  //
  //   return "(Start in ${}:${}:${})";
  // }



}

