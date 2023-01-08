import 'dart:core';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lectutor/handle/teacher.dart';
import 'package:lectutor/model/tutor/tutorDetail.dart';
import 'package:lectutor/view/teacher/teacherList/teacherCard.dart';
import 'package:provider/provider.dart';
import 'package:time_range_picker/time_range_picker.dart';
import '../../../config/const.dart';
import '../../../config/pkg.dart';
import '../../../model/language/language.dart';
import '../../../model/language/provider.dart';
import '../../../model/schedule/schedule.dart';
import '../../../model/user/tokens.dart';
import '../../../model/tutor/tutor.dart';
import '../../const/choicechip.dart';
import '../../const/constVar.dart';
import '../../const/page.dart';
import '../../const/specialtieschoiceschip.dart';
import './banner.dart' as banner;


class TeacherList extends StatelessWidget {
  const TeacherList({super.key});


  // const TeacherList({super.key, required this.user});

  // final User user;

  @override
  Widget build(BuildContext context) {
    // return TemplatePage.getHeader(context, TeacherListPage());
    return TemplatePage(widget: TeacherListPage(),);
  }
}

class TeacherListPage extends StatefulWidget {
  const TeacherListPage({super.key});

  @override
  State<TeacherListPage> createState() => _TeacherListPage();
}

class _TeacherListPage extends State<TeacherListPage> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _ntFocus = FocusNode();
  final TextEditingController _dController = TextEditingController();
  final FocusNode _dFocus = FocusNode();
  final TextEditingController _tController = TextEditingController();
  final FocusNode _tFocus = FocusNode();
  final FocusNode _tgFocus = FocusNode();

  List<ChoiceChipData> specialtiesChoiceChips = SpecialtiesChoiceChips.getSpecialties(ConstVar.type, false);

  TimeOfDay initS = TimeOfDay(hour: 7, minute: 0);
  TimeOfDay initE = TimeOfDay(hour: 8, minute: 0);
  DateTime selectedDate = DateTime.now();

  List<String> nationality = [];

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
  List<String> specialities = [];


  int selectId = 1;
  int countTotal = 0;

  bool? isLoadingTutors = null;


  void getTutor(String token, int page) async{
    if(isLoadingTutors == null || isLoadingTutors == false){
      isLoadingTutors = true;
      var data = await TeacherService.getTeacherList(token, page);
      setState(() {
        if (data != null && mounted){
          updateLists(data);
        }
      });
      isLoadingTutors = false;


    }
  }

  void updateLists(dynamic data){
    var tutors = data["tutors"]["rows"];
    var favoriteTutor = data["favoriteTutor"];

    countTotal = data["tutors"]["count"];
    tutorList.clear();

    try{
      for(int i = 0; i < Const.perPage; i++){
        tutorList.add(Tutor.fromJson(tutors[i]));
        if(tutorList[i].rating == null){
          tutorList[i].rating = 0;
        }
      }
    }catch(e){}

    try{
      favoriteTutorList.clear();
      for(int i = 0;; i++){
        favoriteTutorList.add(Tutor.fromJson(favoriteTutor[i]));
      }

    }catch(e){}


    for(int i = 0; i< tutorList.length - 1; i++){
      for(int j = i + 1; j < tutorList.length; j++){
        if((isContain(tutorList[i], favoriteTutorList) == -1 && isContain(tutorList[j], favoriteTutorList) != -1) ||
            ((isContain(tutorList[i], favoriteTutorList) == -1 && isContain(tutorList[j], favoriteTutorList) == -1) || ((isContain(tutorList[i], favoriteTutorList) != -1 && isContain(tutorList[j], favoriteTutorList) != -1))) && (tutorList[j].rating! > tutorList[i].rating! ) ){
          Tutor temp = tutorList[i];
          tutorList[i] = tutorList[j];
          tutorList[j] = temp;
        }

      }
    }
  }


  @override
  void initState() {
    super.initState();
    // getTotalTime();
    // getNextBookingList();

    // getTutor(selectId);
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;
    Pkg.getLanguage(languageProvider);


    final tokenProvider = Provider.of<Tokens>(context);
    final token = tokenProvider.access.token;

    // if(isLoadingTotalTime){
    //   getTotalTime(token);
    // }

    if(isLoadingTutors == null){
      getTutor(token, selectId);
    }


    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          banner.Banner(),

          // Container(
          //   color: Colors.blue,
          //   padding: EdgeInsets.fromLTRB(10,30,10,10),
          //   child: Row(
          //       mainAxisSize: MainAxisSize.max,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: <Column>[
          //         Column(
          //           children: <Widget>[
          //             Row(
          //               children: [
          //                 Text(
          //                   nextbookingList.length != 0 ? language.nextLesson : language.noUpComing,
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 30,
          //                   ),
          //                   textAlign: TextAlign.center,
          //                 ),
          //               ],
          //             ),
          //             SizedBox(height: ConstVar.mediumspace),
          //             if(nextbookingList.length != 0)
          //               Column(
          //                 children: <Widget>[
          //                   RichText(
          //                     textAlign: TextAlign.center,
          //                     text: TextSpan(
          //                         text: " ${Pkg.getDate(nextbookingList[0].scheduleDetailInfo!.startPeriodTimestamp)} ${Pkg.getDurationLession(nextbookingList[0].scheduleDetailInfo!.startPeriodTimestamp, nextbookingList[0].scheduleDetailInfo!.endPeriodTimestamp)}",
          //                         style: TextStyle(color: Colors.white, fontSize: 14),
          //                         // children: <TextSpan>[
          //                         //   TextSpan(text: ' (start in 65:65:51)',
          //                         //     style: TextStyle(color: Colors.yellow, fontSize: 12),
          //                         //     // recognizer: TapGestureRecognizer()
          //                         //     //   ..onTap = () {}
          //                         //   )
          //                         // ]
          //                     ),
          //                     // loginButton,
          //                     // forgotLabel
          //                   ),
          //                   Countdown(
          //                       countdownController: countdownController,
          //                       builder: (_, Duration time) {
          //                         return Text(
          //                           '${language.startIn} ${time.inHours < 10 ? "0${time.inHours}":time.inHours}:${time.inMinutes % 60 < 10 ? "0${time.inMinutes % 60}":time.inMinutes % 60}:${time.inSeconds % 60 < 10 ? "0${time.inSeconds % 60}" : time.inSeconds % 60}',
          //                           style: TextStyle(color: Colors.yellow, fontSize: 12),
          //                         );
          //                       }),
          //                   SizedBox(height: ConstVar.minspace),
          //                   ElevatedButton.icon(
          //                     style: const ButtonStyle(
          //                       backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
          //                     ),
          //                     // style: ElevatedButton.styleFrom(
          //                     //   shape: RoundedRectangleBorder(borderRadius: );
          //                     // ),
          //
          //                     icon: Icon(Icons.video_library, size: 20,color: Colors.blue,),
          //                     label: Text(
          //                       language.enterroom,
          //                       style: TextStyle(
          //                         color: Colors.blue,
          //                         fontSize: 13,
          //                       ),
          //                     ),
          //                     onPressed: ()async {
          //                       String room = "${nextbookingList[0].userId}-${nextbookingList[0].scheduleDetailInfo!.scheduleInfo.tutorId!}";
          //
          //                       await VideoCall.videoCall(ConstVar.meetServer, room, "Phhaiii", "student@lettutor.com");
          //                     },
          //                   ),
          //                 ],
          //               ),
          //             SizedBox(height: ConstVar.minspace),
          //             Text(
          //               totalTime < 60 ? "${language.totalLessonTimeIs} ${totalTime} ${language.minutes}" : "${language.totalLessonTimeIs} ${totalTime ~/ 60} ${language.hour} ${totalTime % 60} ${language.minutes}",
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 12,
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //           ],
          //         ),
          //       ]
          //   ),
          // ),

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
                          language.findATutor,
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
                          focusNode: _nameFocus,
                          decoration: InputDecoration(
                            hintText: language.enterTutorName,
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
                                      hintText: language.selectcCategory,
                                    ),
                                  ),
                                  // selectedItems: ['Item1', 'Item2'],
                                  onChanged: (val) {
                                    setState(() {
                                      nationality = val;
                                      _ntFocus.requestFocus();
                                    });
                                  },
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: ConstVar.minspace),

                        SizedBox(height: ConstVar.minspace),
                        Text(
                          "${language.selectAvailableTime}:",
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
                              hintText: language.selectDate,
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
                              hintText: language.selectTime,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            ElevatedButton(

                              onPressed: () async{
                                _nameFocus.unfocus();
                                final data = await TeacherService.searchTeacher(token, selectId, Const.perPage, name: _nameController.text, nationality:nationality,date: _dController.text, time: _tController.text,specialities:specialities);
                                setState((){
                                  tutorList = data;
                                  countTotal = tutorList.length!;
                                });
                              },
                              child: Text(
                                language.search,
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
                        Wrap(
                          runSpacing: 5,
                          spacing: 5,

                          children: getSpecialitiesChoiceChip(token),
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
                                  specialities = [];
                                });

                                getTutor(token, 1);

                              },
                                child: Text(
                                  language.resetFilters,
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
                          language.recommendedTutor,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: getTutorList(token, tutorList, language),
                    // [true, false])
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getPage(token, countTotal),
                    ],
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



  // Container getElevatedButton(String txt, {bool selected = false}){
  //   Container btn = Container(
  //     padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
  //     child: ElevatedButton(
  //       onPressed: null,
  //       child: Text(
  //         txt,
  //         style: TextStyle(
  //           color: selected? Colors.blue:Colors.grey,
  //           fontSize: 14,
  //         ),
  //       ),
  //       style: ElevatedButton.styleFrom(
  //         // backgroundColor: Colors.white,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(50),
  //         ),
  //       ),
  //     ),
  //   );
  //
  //   return btn;
  // }
  List<Widget> getTutorList(String token, List<Tutor> tutorList, Language language){
    List<Widget> list = [];

    if (tutorList.length == 0){
      list.add(Center(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Text(
            language.noResult,
            style: TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
              fontSize: 20
            ),
          ),
        ),
      ));
    }
    else{
      for(var i = 0; i < tutorList.length; i++){
        List<String> specialtyList = tutorList[i].specialties.toString().split(",");
        String alias = "";
        List<String> nameSplit = tutorList[i].name.toString().split(" ");
        for(int i = 0; i < nameSplit.length && i < 2; i++){
          alias = alias + nameSplit[i][0];
        }

        list.add(Card(
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

                    var data = await  TeacherService.getTeacherDetail(token, tutorList[i].userId.toString());
                    if (data != null){
                      tutorDetail = TutorDetail.fromJson(data);
                    }
                    tutorDetail.feedlist = tutorList[i].feedbacks!;

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
                                    var data = await TeacherService.addFavoriteTeacher(token, tutorList[i].userId.toString());
                                    if (data == 1){
                                      setState(() {
                                        favoriteTutorList.removeAt(index);
                                      });
                                    }
                                    else {
                                      setState(() {
                                        favoriteTutorList.add(Tutor.fromJson(data));
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
                        language.book,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                        ),
                      ),
                      onPressed: ()async{
                        late TutorDetail tutorDetail;
                        List<Schedule> schedules = [];

                        var data = await  TeacherService.getTeacherDetail(token, tutorList[i].userId.toString());
                        if (data != null){
                          tutorDetail = TutorDetail.fromJson(data);
                        }
                        tutorDetail.feedlist = tutorList[i].feedbacks!;

                        Navigator.pushNamed(context, '/tutor/detail', arguments: tutorDetail);
                      },

                    ),
                  ],
                )
              ],
            ),
          ),
        ));

        // list.add(
        //     Card(
        //       borderOnForeground: true,
        //       elevation: 3,
        //       shadowColor: Colors.grey.shade100,
        //       margin: EdgeInsets.all(10),
        //       child: Container(
        //         padding: EdgeInsets.all(10),
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             GestureDetector(
        //               onTap:  ()  async {
        //                 late TutorDetail tutorDetail;
        //                 List<Schedule> schedules = [];
        //
        //                 var data = await  TeacherService.getTeacherDetail(token, tutorList[i].userId.toString());
        //                 if (data != null){
        //                   tutorDetail = TutorDetail.fromJson(data);
        //                 }
        //                 tutorDetail.feedlist = tutorList[i].feedbacks!;
        //
        //                 Navigator.pushNamed(context, '/tutor/detail', arguments: tutorDetail);
        //
        //               },
        //               child: Row(
        //                 mainAxisSize: MainAxisSize.max,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: <Widget>[
        //                   Container(
        //                     child: tutorList[i].avatar != null?
        //                     CircleAvatar(
        //                       // backgroundImage: ,
        //                       backgroundImage: NetworkImage(tutorList[i].avatar.toString()),
        //                       // backgroundImage: NetworkImage('${context.watch<User>().avatar}'),
        //                       // maxRadius: 30,
        //                     ):
        //                     CircleAvatar(
        //                       backgroundColor: Colors.blue.shade200,
        //                       child: Text(
        //                         alias,
        //                         style: TextStyle(
        //                             fontSize: 25,
        //                             color: Colors.white
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                   SizedBox(width: 10,),
        //
        //                   Container(
        //                     child: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: <Widget>[
        //                         Text(
        //                           tutorList[i].name.toString(),
        //                           style: TextStyle(
        //                             fontSize: 18,
        //                             fontWeight: FontWeight.bold,
        //                           ),
        //                         ),
        //
        //                         Row(
        //                           children: <Widget>[
        //                             Container(
        //                                 padding: EdgeInsets.only(top: 5),
        //                                 child: Image(image: Svg("assets/icon/nationality.svg"),width: 30,)
        //                             ),
        //                             Container(
        //                               padding: EdgeInsets.all(5),
        //                               alignment: Alignment.centerLeft,
        //                               child: Text(
        //                                 tutorList[i].country.toString(),
        //                                 style: TextStyle(
        //                                     fontSize: 14
        //                                 ),
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.start,
        //                           children: Pkg.getRating(tutorList[i].rating),
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //
        //                   Container(
        //                       child: Expanded(
        //                         child: Row(
        //                           mainAxisAlignment: MainAxisAlignment.end,
        //                           mainAxisSize: MainAxisSize.max,
        //                           children: <IconButton>[
        //                             IconButton(
        //                               onPressed: ()async {
        //                                 int index = isContain(tutorList[i], favoriteTutorList);
        //                                 var data = await TeacherService.addFavoriteTeacher(token, tutorList[i].userId.toString());
        //                                 if (data == 1){
        //                                   setState(() {
        //                                     favoriteTutorList.removeAt(index);
        //                                   });
        //                                 }
        //                                 else {
        //                                   setState(() {
        //                                     favoriteTutorList.add(Tutor.fromJson(data));
        //                                   });
        //
        //                                 }
        //
        //                               },
        //                               icon: isContain(tutorList[i], favoriteTutorList) != -1 ? Icon( Icons.favorite,
        //                                 color:  Colors.red,
        //                                 size: 30,
        //                               ) :  Icon( Icons.favorite_border,
        //                                 color:  Colors.blue,
        //                                 size: 30,
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       )
        //                   ),
        //                 ],
        //               ),
        //             ),
        //
        //
        //             Container(
        //               child: Wrap(
        //                 runSpacing: 5,
        //
        //                 spacing: 5,
        //                 children: SpecialtiesChoiceChips.getSpecialties(specialtyList, true).map((value) => ChoiceChip(
        //                   label: Text(value.label,),
        //
        //                   selected: value.isSelected,
        //                   selectedColor: Colors.blue.shade100,
        //                   focusNode: _tgFocus,
        //                   labelStyle: TextStyle(
        //                       fontSize: 15,
        //                       color: Colors.black
        //                   ),
        //                 )).toList(),
        //               ),
        //
        //             ),
        //
        //             Container(
        //               child: Text(
        //                 tutorList[i].bio.toString(),
        //                 style: TextStyle(
        //                   fontSize: 16,
        //                 ),
        //               ),
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               mainAxisSize: MainAxisSize.max,
        //
        //               children: <Widget>[
        //                 ElevatedButton.icon(
        //
        //                   // style: const ButtonStyle(
        //                   //   backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
        //                   //
        //                   // ),
        //                   style: ElevatedButton.styleFrom(
        //                     backgroundColor: Colors.white,
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(32.0),
        //                       side: BorderSide(
        //                           width: 1,
        //                           color: Colors.blue
        //                       ),
        //                     ),
        //                   ),
        //
        //                   icon: Icon(Icons.calendar_month_sharp, size: 20,color: Colors.blue,),
        //                   label: Text(
        //                     language.book,
        //                     style: TextStyle(
        //                       color: Colors.blue,
        //                       fontSize: 13,
        //                     ),
        //                   ),
        //                   onPressed: ()async{
        //                     late TutorDetail tutorDetail;
        //                     List<Schedule> schedules = [];
        //
        //                     var data = await  TeacherService.getTeacherDetail(token, tutorList[i].userId.toString());
        //                     if (data != null){
        //                       tutorDetail = TutorDetail.fromJson(data);
        //                     }
        //                     tutorDetail.feedlist = tutorList[i].feedbacks!;
        //
        //                     Navigator.pushNamed(context, '/tutor/detail', arguments: tutorDetail);
        //                   },
        //
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //
        //     )
        // );
      }

    }

    return list;
  }

  int isContain(Tutor tutor, List<Tutor> favoriteList){
    for(int i = 0; i < favoriteList.length; i++){
      if (tutor.userId == favoriteList[i].userId || tutor.userId == favoriteList[i].firstId || tutor.userId == favoriteList[i].secondId ){
        return i;
      }
    }
    return -1;
  }

  Widget getPage(String token, int count){
    int preId = 1;
    // bool isContinuous = true;
    List<Widget> list = [];
    int temp = count;
    list.add(GestureDetector(
      onTap: (){
        if (selectId > 1){
          setState(() {
            selectId = selectId - 1;
          });
          getTutor(token, selectId);

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
          onTap: (){
            if (i != selectId){
              setState(() {
                selectId = i;
              });
              getTutor(token, selectId);

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
      onTap: (){
        if (selectId <= (count - 1)~/ Const.perPage){

          setState(() {
            selectId = selectId + 1;
          });
          getTutor(token, selectId);

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
  
  
  List<ChoiceChip>  getSpecialitiesChoiceChip(String token) {
    List<ChoiceChip> list = [];
    for(int i =0; i< specialtiesChoiceChips.length; i++){
      list.add(ChoiceChip(
        label: Text(specialtiesChoiceChips[i].label),
        selected: specialities.contains(specialtiesChoiceChips[i].label),
        selectedColor: Colors.blue.shade100,
        focusNode: _tgFocus,
        labelStyle: TextStyle(
          fontSize: 15,
        ),
        onSelected: (isSltd)async{
          setState(() {
            _tgFocus.requestFocus();
            if(specialtiesChoiceChips[i].isSelected){
              specialtiesChoiceChips[i].isSelected = false;
              specialities.remove(specialtiesChoiceChips[i].label);
            }else{
              specialtiesChoiceChips[i].isSelected = true;
              specialities.add(specialtiesChoiceChips[i].label);
            }
          });
          setState(() {
            selectId = 1;
          });

          final data = await TeacherService.searchTeacher(token, selectId, Const.perPage, name: _nameController.text, nationality:nationality, date:_dController.text, time:  _tController.text, specialities:specialities);
          setState((){
            tutorList = data;
            countTotal = tutorList.length!;
          });

        },
      ));
    }
    return list;
  }
}
