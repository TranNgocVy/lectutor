
import 'package:chewie/chewie.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lectutor/config/pkg.dart';
import 'package:lectutor/handle/schedule.dart';
import 'package:lectutor/handle/teacher.dart';
import 'package:lectutor/model/bookingInfo.dart';
import 'package:lectutor/model/schedule.dart';
import 'package:lectutor/model/tutorCourseList.dart';
import 'package:lectutor/model/tutorDetail.dart';
import 'package:lectutor/test.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../../config/const.dart';
import '../../model/courses.dart';
import '../../model/feedBack.dart';
import '../../model/user.dart';
import '../const/constVar.dart';
import '../const/page.dart';
import '../const/specialtieschoiceschip.dart';

class TeacherDetail extends StatelessWidget {
  final TutorDetail tutorDetail;

  const TeacherDetail({super.key, required this.tutorDetail});



  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, TeacherDetailPage(tutorDetail: tutorDetail));

  }
}

class TeacherDetailPage extends StatefulWidget {
  final TutorDetail tutorDetail;
  const TeacherDetailPage({super.key, required this.tutorDetail});
  @override
  State<TeacherDetailPage> createState() => _TeacherDetailPage();

}

class _TeacherDetailPage extends State<TeacherDetailPage> {

  final FocusNode _tgFocus = FocusNode();
  TargetPlatform? _platform;
  late VideoPlayerController _videoPlayerController1;
  // late VideoPlayerController _videoPlayerController2;
  ChewieController? _chewieController;
  int? bufferDelay;
  // TutorDetail tutorDetail = widget.teacherDetail;
  List<Schedule> schedules = [];
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    // getTutorDetail(widget.id);
    getScedule(widget.tutorDetail.User.id);
    print(schedules.length);
    print(widget.tutorDetail.feedlist.length);
    print("----------------------");

    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    // _videoPlayerController2.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  List<String> srcs = [
    "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4"
  ];

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        // VideoPlayerController.network((tutorDetail?.video).toString());
    VideoPlayerController.network(srcs[currPlayIndex]);
    // _videoPlayerController2 =
    // VideoPlayerController.network(srcs[currPlayIndex]);
    await Future.wait([
      _videoPlayerController1.initialize(),
      // _videoPlayerController2.initialize()
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      progressIndicatorDelay:
      bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            // onTap: toggleVideo,
            onTap: null,
            iconData: Icons.live_tv_sharp,
            title: 'Toggle Video Src',
          ),
        ];
      },
      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle is InlineSpan
            ? RichText(
          text: subtitle,
        )
            : Text(
          subtitle.toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),

      hideControlsTimer: const Duration(seconds: 1),

      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  int currPlayIndex = 0;

  // Future<void> toggleVideo() async {
  //   await _videoPlayerController1.pause();
  //   currPlayIndex += 1;
  //   if (currPlayIndex >= srcs.length) {
  //     currPlayIndex = 0;
  //   }
  //   await initializePlayer();
  // }

  // void getTutorDetail(String id) async{
  //   var data = await getTeacherDetail(context, id);
  //   if (data != null){
  //     setState(() {
  //       updateTutorDetail(data);
  //     });
  //   }
  // }

  void getScedule (String id) async{
    var data = await getScheduleByTutorId(context, id);
    if (data != null){
      setState(() {
        updateSchedule(data);
      });
    }
  }

  // void updateTutorDetail (dynamic data){
  //   tutorDetail = TutorDetail.fromJson(data);
  // }
  void updateSchedule (dynamic data){
    try{
      for(int i = 0;; i++){
        schedules.add(Schedule.fromJson(data[i]));
      }
    }catch(e){}
  }


  @override
  Widget build(BuildContext context) {
    List<String> specialtyList = (widget.tutorDetail?.User?.name).toString().split(",");
    String alias = "";
    List<String> nameSplit = (widget.tutorDetail?.User?.name).toString().split(" ");
    for(int i = 0; i < nameSplit.length && i < 2; i++){
      alias = alias + nameSplit[i][0];
    }
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 5),
                child: widget.tutorDetail.User?.avatar != null?
                CircleAvatar(
                  // backgroundImage: ,
                  // backgroundImage: NetworkImage((tutorDetail?.User?.avatar).toString()),
                  backgroundImage: NetworkImage('${context.watch<User>().avatar}'),
                  maxRadius: 50,
                ):
                CircleAvatar(
                  backgroundColor: Colors.blue.shade200,
                  maxRadius: 50,
                  child: Text(
                    alias,
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              // CircleAvatar(
              //   backgroundImage: AssetImage('assets/icon/avatar.jpg'),
              //   maxRadius: 50,
              // ),

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
                            flex: 1,
                            child: Text(
                                (widget.tutorDetail.User?.name).toString(),
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),)
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                      SizedBox(height: ConstVar.minspace),
                      Row(
                        children: <Widget>[

                          Container(
                              child: Image(image: Svg("assets/icon/nationality.svg"), width: 30,)
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                (widget.tutorDetail?.User?.country).toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black38,
                                ),
                              ),
                            ),),

                        ],
                      ),

                      SizedBox(height: ConstVar.minspace),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Row(
                          children: Pkg.getRating((widget.tutorDetail?.rating)),
                        ),
                          Text(
                            "(${(widget.tutorDetail?.totalFeedback).toString()})",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black38,
                                fontStyle: FontStyle.italic
                            ),
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),

          SizedBox(height: ConstVar.mediumspace),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                    (widget.tutorDetail?.bio).toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
                ),),
            ],
          ),

          SizedBox(height: ConstVar.mediumspace),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  (widget.tutorDetail?.isFavorite != true) ?
                  IconButton(
                    onPressed: (){
                      setState(() {
                        widget.tutorDetail?.isFavorite = true;
                      });
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ):
                  IconButton(
                    onPressed: (){
                      setState(() {
                        widget.tutorDetail?.isFavorite = false;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 25,
                    ),
                  ),
                  SizedBox(height: ConstVar.minspace),
                  Text(
                    "Favorite",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),

                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.report_gmailerrorred,
                    color: Colors.blue,
                    size: 25,
                  ),
                  SizedBox(height: ConstVar.minspace),
                  Text(
                    "Report",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),

                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Container(
                                      // height: MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width - 20,

                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "Others review",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                            ),),
                                          IconButton(
                                            icon: Icon(Icons.cancel, color: Colors.red,),
                                            onPressed: () => Navigator.pop(context),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                    child: ListView(
                                        children: getReviewList(widget.tutorDetail.feedlist)
                                    )),
                              ],
                            ),
                          );
                        },
                      );
                    },
                      icon: Icon(
                        Icons.star_border,
                        color: Colors.blue,
                        size: 25,
                      ),),
                  SizedBox(height: ConstVar.minspace),
                  Text(
                    "Review",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),

                ],
              )
            ],
          ),

          SizedBox(height: ConstVar.largespace),

          Container(
            height: 200,
            child: _chewieController != null &&
                _chewieController!
                    .videoPlayerController.value.isInitialized
                ? Chewie(
              controller: _chewieController!,
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading'),
              ],
            ),
          ),

          // Container(
          //   // color: Colors.blue,
          //   // height: 300,
          //   child: Stack(
          //       children:[
          //         AspectRatio(
          //           aspectRatio: controller.value.aspectRatio,
          //           child: VideoPlayer(controller),
          //         ),
          //
          //         // Container( //duration of video
          //         //   child: Text("Total Duration: " + controller.value.duration.toString()),
          //         // ),
          //
          //         Positioned(
          //           bottom: 15,
          //           right: 0,
          //           child: Row(
          //             children: <Widget>[
          //               IconButton(onPressed: null, icon: Icon(Icons.volume_up,size: 30,color: Colors.white,),),
          //
          //               IconButton(onPressed: null, icon: Icon(Icons.fullscreen_rounded,size: 30,color: Colors.white,),),
          //
          //             ],
          //           ),
          //         ),
          //
          //         // Positioned(
          //         //   bottom: 7,
          //         //   child: Container(
          //         //     child: VideoProgressIndicator(
          //         //         controller,
          //         //         allowScrubbing: true,
          //         //         colors:VideoProgressColors(
          //         //           backgroundColor: Colors.redAccent,
          //         //           playedColor: Colors.green,
          //         //           bufferedColor: Colors.purple,
          //         //         )
          //         //     )
          //         // ),
          //         // ),
          //
          //
          //
          //
          //         Positioned(
          //           left: 0,
          //           bottom: 15,
          //           child: Row(
          //             children: [
          //               IconButton(
          //                   onPressed: (){
          //                     if(controller.value.isPlaying){
          //                       controller.pause();
          //                     }else{
          //                       controller.play();
          //                     }
          //
          //                     setState(() {
          //
          //                     });
          //                   },
          //                   icon:Icon(controller.value.isPlaying?Icons.pause:Icons.play_arrow, color: Colors.white,size: 30,)
          //               ),
          //               Text(controller.value.duration.toString(), style: TextStyle(color: Colors.white, fontSize: 18),),
          //
          //               // IconButton(
          //               //     onPressed: (){
          //               //       controller.seekTo(Duration(seconds: 0));
          //               //
          //               //       setState(() {
          //               //
          //               //       });
          //               //     },
          //               //     icon:Icon(Icons.stop)
          //               // )
          //             ],
          //           ),
          //         )
          //       ]
          //   ),
          // ),

          SizedBox(height: ConstVar.largespace),

          Text(
            "Language",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Row(
                    children: <Widget>[
                      Pkg.getElevatedButton((widget.tutorDetail?.User?.language).toString()),
                    ],
                  ))
            ],
          ),

          SizedBox(height: ConstVar.largespace),

          Text(
            "Specialties",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),


          Container(
            child: Wrap(
              runSpacing: 2,
              spacing: 5,
              children: SpecialtiesChoiceChips.getSpecialties((widget.tutorDetail?.specialties).toString().split(","), true).map((value) => ChoiceChip(
                label: Text(value.label),
                selected: value.isSelected,
                selectedColor: Colors.blue.shade200,
                focusNode: _tgFocus,
                labelStyle: TextStyle(
                  fontSize: 15,
                ),
                // onSelected: (isSltd) => setState(() {
                //   _tgFocus.requestFocus();
                //   value.isSelected = value.isSelected?false: true;
                // }),
              )).toList(),
            ),),

          SizedBox(height: ConstVar.largespace),

          Text(
            "Suggested courses",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Column(
            children: getSuggestedCourse(widget.tutorDetail!.User.courses),
          ),


          SizedBox(height: ConstVar.largespace),

          Text(
            "Interests",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(width: 10,),
              Expanded(
                flex: 1,
                child: Text(
                    (widget.tutorDetail?.interests).toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
                ),),
            ],
          ),

          SizedBox(height: ConstVar.largespace),

          Text(
            "Teaching experience",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(width: 10,),
              Expanded(
                flex: 1,
                child: Text(
                  (widget.tutorDetail?.experience).toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
                ),),
            ],
          ),

          SizedBox(height: ConstVar.largespace),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: null,
                child: const Text(
                  'Today',
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

              SizedBox(width: ConstVar.minspace),

              IconButton(
                onPressed: (){
                  DateTime now = DateTime.now();
                  setState(() {
                    date = date.subtract(Duration(days: 7));
                    if (date.isBefore(now)){
                      date = now;
                    }
                  });
                },
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.black38,
                ),
              ),

              SizedBox(width: ConstVar.minspace),

              IconButton(
                onPressed: (){
                  setState(() {
                    date = date.add(Duration(days: 7));
                  });
                },
                icon: Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.black38,
                ),
              ),

              SizedBox(width: ConstVar.minspace),

              Text(
                date.add(Duration(days: 6)).month == date.month ?
                  "${Const.months[date.month - 1]}, ${date.year}":
                    date.add(Duration(days: 6)).year == date.year ?
                      "${Const.months[date.month - 1]} - ${Const.months[date.add(Duration(days: 6)).month - 1]}, ${date.year}":
                      "${Const.months[date.month - 1]}, ${date.year} - ${Const.months[date.add(Duration(days: 6)).month - 1]}, ${date.add(Duration(days: 6)).year}",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20
                ),
              ),
            ],
          ),

          SizedBox(height: ConstVar.mediumspace),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    border: TableBorder.all(color: Colors.black12),
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: IntrinsicColumnWidth(),
                      2: IntrinsicColumnWidth(),
                      3: IntrinsicColumnWidth(),
                      4: IntrinsicColumnWidth(),
                      5: IntrinsicColumnWidth(),
                      6: IntrinsicColumnWidth(),
                      7: IntrinsicColumnWidth(),

                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: getTableRow(date, schedules, '${context.watch<User>().id}')
                    // <TableRow>[
                    //   TableRow(
                    //     children: getDayHeader(date),
                    //   ),
                    //   getTableRow("00:00 - 00:25", ["Booked", "","", "", "Book","", ""]),
                    //   getTableRow("00:30 - 00:55", ["Booked", "","", "", "Book","", ""]),
                    //   getTableRow("01:00 - 01:25", ["UnBook", "","", "", "Book","", ""]),
                    //   getTableRow("01:30 - 01:55", ["Book", "","", "", "Book","", ""]),
                    //   getTableRow("02:00 - 02:25", ["Book", "Booked","Book", "Reserved", "Book","", ""]),
                    //   getTableRow("02:30 - 02:55", ["Reserved", "","", "", "","", ""]),
                    //   getTableRow("03:00 - 03:25", ["", "","", "", "Reserved","", ""]),
                    //   getTableRow("03:30 - 03:55", ["Booked", "Reserved","", "", "","", ""]),
                    //   getTableRow("04:00 - 04:25", ["Book", "UnBook","", "", "","", ""]),
                    //   getTableRow("04:30 - 04:55", ["", "","", "", "Book","", ""]),
                    //   getTableRow("05:00 - 05:25", ["", "UnBook","", "", "Book","", ""]),
                    //   getTableRow("05:30 - 05:55", ["", "","", "", "Book","", ""]),
                    //
                    //
                    // ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );



  }

  List<Widget> getDayHeader(DateTime start){
    List<Widget> list = [];
    list.add(TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        color: Colors.grey,
      ),
    ),);

    for (int i = 0; i < 7; i++){
      DateTime temp = start.add(Duration(days: i));
      list.add(TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: getDate("${temp.day}/${temp.month}", Const.weekday[temp.weekday - 1]),
      ),);
    }

    return list;
  }


  Container getDate(String day_month, String date){
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Text>[
          Text(
            day_month,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
          Text(
            date,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget getBookCell(String status){
    if (status == "Booked")
    {
      return TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Text(
            status,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          ),
        ),
      );

    }
    else{
      if (status == "Reserved"){
        return TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            padding: EdgeInsets.all(5),
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black38,
                fontSize: 16,
              ),
            ),
          ),
        );
      }
      else{
        if(status == "Book") {
          return TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: Container(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/tutor/detail/bookclass');
                },
                child: const Text(
                  'Book',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
                style: ButtonStyle(
                  // backgroundColor: Colors.blue,
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder( borderRadius: BorderRadius.circular(40) ),),
                ),
              ),
            ),
          );
        }
        else{
          if (status == "UnBook"){
            return TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: null,

                  child: const Text(
                    'Book',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                    ),
                  ),
                  style: ButtonStyle(
                    // backgroundColor: Colors.blue,
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.black12),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder( borderRadius: BorderRadius.circular(40) ),),
                  ),
                ),
              ),
            );
          }
          else{
            if(status == ""){
              return TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(),
              );
            }
            else{
              return TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  color: Colors.black12,
                  padding: EdgeInsets.all(5),
                  height: 60,
                  child: Text(
                    status,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            }
          }
        }

      }
    }
  }

  // TableRow getTableRow(String time, List<String> date){
  //   List<Widget> row = [];
  //   row.add(getBookCell(time));
  //   for (var i = 0; i < 7; i++){
  //     row.add(getBookCell(date[i]));
  //   }
  //
  //   return TableRow(
  //     children: row,
  //   );
  // }
  List<TableRow> getTableRow(DateTime start, List<Schedule> schedules, String userId){

    List<TableRow> list = [];
    list.add(TableRow(
      children: getDayHeader(start),
    ),);
    Map<String, List<String>> map = {};

    for(int i = 0 ; i < schedules.length; i++){
      for (int j = 0; j < schedules[i].scheduleDetails.length; j++){
        DateTime startTime = Const.time.add(Duration(milliseconds: schedules[i].scheduleDetails[j].startPeriodTimestamp));
        int difDay = Pkg.diffDay(start, startTime);
        if (startTime.isAfter(start) && Pkg.diffDay(start, startTime) < 7){
          String key = "${schedules[i].scheduleDetails[j].startPeriod} - ${schedules[i].scheduleDetails[j].endPeriod}";
          if (schedules[i].scheduleDetails[j].isBooked == false){
            if (!map.containsKey(key)){
              map[key] = ["", "", "", "", "", "", ""];
            }
            map[key]![difDay] = "Book";
          }else{
            for (int k = 0; k < schedules[i].scheduleDetails[j].bookingInfo.length; k ++){
              if (schedules[i].scheduleDetails[j].bookingInfo[k].isDeleted != true){
                if (!map.containsKey(key)){
                  map[key] = ["", "", "", "", "", "", ""];
                }
                if(schedules[i].scheduleDetails[j].bookingInfo[k].userId == userId){
                  map[key]![difDay] = "Booked";
                }
                else{
                  map[key]![difDay] = "Reserved";
                }
              }
            }
          }
        }
      }
    }
    map.forEach((key, value) {
      List<Widget> row = [];
      row.add(getBookCell(key));
      for (var i = 0; i < value.length; i++){
        row.add(getBookCell(value[i]));


      }
      list.add(TableRow(
        children: row,
      ));
    });

    if (list.length == 1){
      for (var i = 0 ; i < Const.defualtTimeRange.length; i++){
        List<Widget> row = [];
        row.add(getBookCell(Const.defualtTimeRange[i]));
        for (var i = 0; i < 7; i++){
          row.add(getBookCell(""));
        }
        list.add(TableRow(
          children: row,
        ));
      }
    }
    return list;
  }

  List<Widget> getSuggestedCourse(List<TutorCourseList> courseList){
    List<Widget> list = [];

    for (var i = 0; i < courseList.length; i++){
      list.add(Row(
        children: <Widget>[
          SizedBox(width: 10),
          RichText(
            text: TextSpan(
                text: "${courseList![i].name.toString() }: ",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(text: 'Link',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/course/detail');

                        }
                  )
                ]
            ),
            // loginButton,
            // forgotLabel
          )

        ],
      ),);
      list.add(SizedBox(height: ConstVar.minspace),);
    }
    return list;

  }
  
  List<Widget> getReviewList(List<FeedBack> feedbackList){
    List<Widget> list = [];
    for(int i = 0; i < feedbackList.length; i++){
      list.add(Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              // backgroundImage: ,
              // backgroundImage: NetworkImage((tutorDetail?.User?.avatar).toString()),
              backgroundImage: NetworkImage('${context.watch<User>().avatar}'),
              // maxRadius: 50,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5,top: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            feedbackList[i].firstInfo!.name.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black26
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            Pkg.diffDay(feedbackList[i].createdAt!, DateTime.now()) ==  0 ?
                              "Today" :
                              Pkg.diffDay(feedbackList[i].createdAt!, DateTime.now()) <= 31 ?
                                "${Pkg.diffDay(feedbackList[i].createdAt!, DateTime.now())} days ago":
                                  Pkg.diffMonth(feedbackList[i].createdAt!, DateTime.now()) < 12 ?
                                    "${Pkg.diffMonth(feedbackList[i].createdAt!, DateTime.now())} months ago":
                                    "${Pkg.diffYear(feedbackList[i].createdAt!, DateTime.now())} year(s) ago",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                        ),

                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                    SizedBox(height: ConstVar.minspace),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: getRated(feedbackList[i].rating!),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            feedbackList[i].content.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ));
    }
    return list;
  }

  Container getReviewItem(Icon icon, String name, String time, int rated, String review){
    Container container = Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          icon,
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 5,top: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black26
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          time,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          ),
                        ),
                      ),

                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  SizedBox(height: ConstVar.minspace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: getRated(rated),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          review,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );

    return container;
  }

  List<Widget> getRated(int rated){
    List<Widget> icon = [];
    for (var i = 0; i < rated && i < 5; i++){
      icon.add(Icon(Icons.star, color: Colors.yellow, size: 20,));
    }
    for (var i = rated; i < 5; i++){
      icon.add(Icon(Icons.star, color: Colors.grey, size: 20,));
    }

    return icon;
  }



}