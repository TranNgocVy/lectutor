
import 'package:flutter/material.dart';
import 'package:lectutor/model/course.dart';
import 'package:lectutor/model/schedule.dart';
import '../const/constVar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../model/teacher.dart';



class ScheduleList extends StatelessWidget {
  const ScheduleList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Schedule List',
        // theme: ThemeData(
        //   primarySwatch: Colors.green,
        // ),

        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(title: const Text("123456")),
          body: ScheduleListPage(),
        )
    );
  }
}

class ScheduleListPage extends StatefulWidget {
  const ScheduleListPage({super.key});
  @override
  State<ScheduleListPage> createState() => _ScheduleListPage();

}

class _ScheduleListPage extends State<ScheduleListPage> {


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
                    image: Svg('asset/icon/schedule.svg'),
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
                getScheduleList([Schedule("Fri, 30 Sep 22","01:30", "01:55", "finish",1), Schedule("Fri, 30 Sep 22", "02:", "02:25", "finish",1)],
                    [Teacher(1, "Keengan", "France", [], []), Teacher(1, "Keengan", "France", [], [])]),
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
          color: Colors.grey.shade200,
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
                      "1 lesson",
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
                                Image(
                                  image: Svg('asset/icon/nationality.svg'),
                                  height: 25,

                                ),
                                // Icon(
                                //   Icons.south_america_sharp,
                                //   size: 25,
                                // ),
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
                padding: EdgeInsets.fromLTRB(5,0,5,0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(child: Text(
                          scheduleList[i].start + " - " + scheduleList[i].end,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )),
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
                          onPressed: null,
                        ),

                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              initialValue: '',
                              decoration: InputDecoration(
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
                      backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey.shade50),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.grey.shade400)
                            )
                        )
                    ),
                    onPressed: null,
                    child: Text(
                      "Go to meeting",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade400
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

}