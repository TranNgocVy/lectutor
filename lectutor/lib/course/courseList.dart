import 'package:flutter/material.dart';
import 'package:lectutor/model/course.dart';
import 'package:lectutor/model/topic.dart';
import '../const/constVar.dart';


class CourseList extends StatelessWidget {
  const CourseList({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Course List',
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: CourseListPage(),
        )
    );
  }
}

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});
  @override
  State<CourseListPage> createState() => _CourseListPage();
}

class _CourseListPage extends State<CourseListPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,30,10,10),
      child: Expanded(
        child: ListView(
          children: <Widget>[
            Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.school_sharp, color: Colors.blue,size: 80,),
                  SizedBox(width: ConstVar.mediumspace,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Discover Courses",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: ConstVar.mediumspace,),
                      // TextFormField(
                      //   autofocus: false,
                      //   initialValue: '',
                      //   decoration: InputDecoration(
                      //     hintText: 'Course',
                      //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(5.0),
                      //       // borderSide: BorderSide(color: Colors.black38)
                      //     ),
                      //     suffixIcon: IconButton(
                      //       onPressed: null,
                      //       icon: Icon(Icons.search, color: Colors.black54,),
                      //     ),
                      //   ),
                      // ),

                    ],
                  ),

                ]
            ),
            SizedBox(height: ConstVar.mediumspace,),

            Expanded(
                child: Text(
                  "LiveTutor has built the most quality, methodical and scientific courses in the fields of life for those who are in need of improving their knowledge of the fields.",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16
                  ),
                )
            ),

            SizedBox(height: ConstVar.mediumspace,),

            TextFormField(
              autofocus: false,
              initialValue: '',
              decoration: InputDecoration(
                hintText: 'Select level',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.expand_more_outlined),
                ),
              ),
            ),

            SizedBox(height: ConstVar.minspace,),

            TextFormField(
              autofocus: false,
              initialValue: '',
              decoration: InputDecoration(
                hintText: 'Select category',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.expand_more_outlined),
                ),
              ),
            ),

            SizedBox(height: ConstVar.minspace,),

            TextFormField(
              autofocus: false,
              initialValue: '',
              decoration: InputDecoration(
                hintText: 'Sort by level',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.expand_more_outlined),
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: getType(["Course", "E-Book", "Interactive E-book"], 0),
            ),

            SizedBox(height: ConstVar.largespace,),

            Text(
              "English For Traveling",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),

            // Expanded(
            //   child:
            // ),
            Column(
              children: getCourseList([
                Course("Life in the Internet Age",
                    "Let's discuss how technology is changing the way we live",
                    "Intermediate",
                    [Topic("The Internet"),
                      Topic("Artificial Intelligence (AI)"),
                      Topic("Social Media"),
                      Topic("Internet Privacy"),
                      Topic("Live Streaming"),
                      Topic("Coding"),
                      Topic("Technology Transforming Healthcare"),
                      Topic("Smart Home Technology"),
                      Topic("Remote Work - A Dream Job?"),
                    ]
                ),
                Course("Life in the Internet Age 11111111111111",
                    "Let's discuss how technology is changing the way we live",
                    "Intermediate",
                    [Topic("The Internet"),
                      Topic("Artificial Intelligence (AI)"),
                      Topic("Social Media"),
                      Topic("Internet Privacy"),
                      Topic("Live Streaming"),
                      Topic("Coding"),
                      Topic("Technology Transforming Healthcare"),
                      Topic("Smart Home Technology"),
                      Topic("Remote Work - A Dream Job?"),
                    ]
                )]),
            ),




            // Container(
            //     padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Row(
            //           mainAxisSize: MainAxisSize.max,
            //           children: <Column>[
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisSize: MainAxisSize.min,
            //               children: <Widget>[
            //                 Text(
            //                   "Find a tutor",
            //                   textAlign: TextAlign.left,
            //                   style: TextStyle(
            //                     fontSize: 25,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.red,
            //                   ),
            //                 ),
            //                 SizedBox(height: ConstVar.mediumspace),
            //
            //                 // TextField(
            //                 //   decoration: InputDecoration(
            //                 //     hintText: "1256",
            //                 //   ),
            //                 // ),
            //
            //                 SizedBox(height: ConstVar.minspace),
            //                 Text(
            //                   "Select availiable tutoring time:",
            //                   style: TextStyle(
            //                     fontSize: 15,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //                 // TextFormField(
            //                 //   decoration: InputDecoration(
            //                 //     hintText: "1345",
            //                 //   ),
            //                 // )
            //                 // TextField(
            //                 //   // keyboardType: TextInputType.text,
            //                 //   autofocus: false,
            //                 //   // initialValue: '',
            //                 //   decoration: InputDecoration(
            //                 //     hintText: 'Enter tutor name...',
            //                 //     hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
            //                 //     // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            //                 //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            //                 //   ),
            //                 // ),
            //                 // TextFormField(
            //                 //   keyboardType: TextInputType.text,
            //                 //   autofocus: false,
            //                 //   initialValue: '',
            //                 //   obscureText: true,
            //                 //   decoration: InputDecoration(
            //                 //     hintText: 'Select tutor nationality',
            //                 //     hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
            //                 //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            //                 //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            //                 //     suffixIcon: IconButton(
            //                 //       onPressed: null,
            //                 //       icon: Icon(Icons.visibility),
            //                 //     ),
            //                 //   ),
            //                 // ),
            //                 // Row(
            //                 //   children: <TextFormField>[
            //                 //     TextFormField(
            //                 //       keyboardType: TextInputType.text,
            //                 //       autofocus: false,
            //                 //       initialValue: '',
            //                 //       decoration: InputDecoration(
            //                 //         hintText: 'Enter tutor name...',
            //                 //         hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
            //                 //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            //                 //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            //                 //       ),
            //                 //     ),
            //                 //     TextFormField(
            //                 //       keyboardType: TextInputType.text,
            //                 //       autofocus: false,
            //                 //       initialValue: '',
            //                 //       obscureText: true,
            //                 //       decoration: InputDecoration(
            //                 //         hintText: 'Select tutor nationality',
            //                 //         hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
            //                 //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            //                 //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            //                 //         suffixIcon: IconButton(
            //                 //           onPressed: null,
            //                 //           icon: Icon(Icons.visibility),
            //                 //         ),
            //                 //       ),
            //                 //     ),
            //                 //   ],
            //                 // )
            //                 Row(
            //                   children: <Widget>[
            //                     getElevatedButton("All", selected: true),
            //                     getElevatedButton("English for kids"),
            //                     getElevatedButton("English for business"),
            //                     getElevatedButton("Conversational"),
            //                     getElevatedButton("STARTERS"),
            //                     getElevatedButton("MOVERS"),
            //                     getElevatedButton("FLYRS"),
            //                     getElevatedButton("KET"),
            //                     getElevatedButton("PET"),
            //                     getElevatedButton("IELTS"),
            //                     getElevatedButton("TOEFL"),
            //                     getElevatedButton("TOEIC"),
            //                   ],
            //                 ),
            //
            //
            //                 ElevatedButton(
            //                   onPressed: null,
            //                   child: Text(
            //                     "Reset Filters",
            //                     style: TextStyle(
            //                       color: Colors.blue,
            //                       fontSize: 16,
            //                     ),
            //                   ),
            //                   style: ElevatedButton.styleFrom(
            //                     // backgroundColor: Colors.white,
            //                     shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(50),
            //                         side: BorderSide(
            //                           color: Colors.blue,
            //                           style: BorderStyle.solid,
            //                         )
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(height: ConstVar.mediumspace),
            //               ],
            //             ),
            //           ],
            //         ),
            //
            //         Container(
            //           padding: EdgeInsets.only(top: ConstVar.largespace, bottom: ConstVar.minspace),
            //           decoration: BoxDecoration(
            //             border: Border(
            //               top: BorderSide(color: Colors.grey,),
            //             ),
            //           ),
            //           child: Row(
            //             mainAxisSize: MainAxisSize.max,
            //             children: <Text>[
            //               Text(
            //                 "Recommended Tutors",
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //
            //         Column(
            //           children: <Card>[
            //             Card(
            //               borderOnForeground: true,
            //               margin: EdgeInsets.all(10),
            //               child: Container(
            //                 padding: EdgeInsets.all(10),
            //                 child: Column(
            //                   mainAxisSize: MainAxisSize.min,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: <Widget>[
            //                     Row(
            //                       mainAxisSize: MainAxisSize.max,
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: <Widget>[
            //                         Container(
            //                           child: Icon(
            //                             Icons.account_circle_outlined,
            //                             size: 60,
            //                           ),
            //                         ),
            //
            //                         Container(
            //                           child: Column(
            //                             crossAxisAlignment: CrossAxisAlignment.start,
            //                             children: <Widget>[
            //                               Text(
            //                                 "Name of lettutor",
            //                                 style: TextStyle(
            //                                   fontSize: 18,
            //                                   fontWeight: FontWeight.bold,
            //                                 ),
            //                               ),
            //
            //                               Row(
            //                                 children: <Widget>[
            //                                   Container(
            //                                     padding: EdgeInsets.only(top: 5),
            //                                     child: Icon(
            //                                       Icons.south_america_sharp,
            //                                       size: 20,
            //                                     ),
            //                                   ),
            //                                   Container(
            //                                     padding: EdgeInsets.all(5),
            //                                     child: Text(
            //                                       "Nationality of lettutor",
            //                                       style: TextStyle(
            //                                           fontSize: 12
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ],
            //                               ),
            //                               Row(
            //                                 mainAxisAlignment: MainAxisAlignment.start,
            //                                 children: <Icon>[
            //                                   Icon(Icons.star, color: Colors.yellow, size: 15,),
            //                                   Icon(Icons.star, color: Colors.yellow, size: 15,),
            //                                   Icon(Icons.star, color: Colors.yellow, size: 15,),
            //                                   Icon(Icons.star, color: Colors.yellow, size: 15,),
            //                                   Icon(Icons.star, color: Colors.yellow, size: 15,),
            //
            //                                 ],
            //                               )
            //                             ],
            //                           ),
            //                         ),
            //
            //                         Container(
            //                             child: Row(
            //                               mainAxisAlignment: MainAxisAlignment.end,
            //                               mainAxisSize: MainAxisSize.max,
            //                               children: <Icon>[
            //                                 Icon(
            //                                   Icons.favorite_border,
            //                                   color: Colors.blue,
            //                                   size: 30,
            //                                 ),
            //                               ],
            //                             )
            //                         ),
            //                       ],
            //                     ),
            //
            //                     Row(
            //                       children: <Widget>[
            //                         getElevatedButton("English for Business", selected: true),
            //                         getElevatedButton("TEIC", selected: true),
            //                       ],
            //                     ),
            //
            //                     Container(
            //                       child: Text(
            //                         "Description about lettutor",
            //                         style: TextStyle(
            //                           fontSize: 12,
            //                         ),
            //                       ),
            //                     ),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       mainAxisSize: MainAxisSize.max,
            //
            //                       children: <Widget>[
            //                         ElevatedButton.icon(
            //
            //                           // style: const ButtonStyle(
            //                           //   backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
            //                           //
            //                           // ),
            //                           style: ElevatedButton.styleFrom(
            //                             backgroundColor: Colors.white,
            //                             shape: RoundedRectangleBorder(
            //                               borderRadius: BorderRadius.circular(32.0),
            //                               side: BorderSide(
            //                                   width: 1,
            //                                   color: Colors.blue
            //                               ),
            //                             ),
            //                           ),
            //
            //                           icon: Icon(Icons.calendar_month_sharp, size: 20,color: Colors.blue,),
            //                           label: Text(
            //                             'Book',
            //                             style: TextStyle(
            //                               color: Colors.blue,
            //                               fontSize: 13,
            //                             ),
            //                           ),
            //                           onPressed: null,
            //
            //                         ),
            //                       ],
            //                     )
            //                   ],
            //                 ),
            //               ),
            //
            //             )
            //           ],
            //         )
            //
            //
            //
            //
            //       ],
            //     )
            // ),
            // ),
          ],
        ),
      ),
    );

    // mainAxisSize: MainAxisSize.max,

    // );

  }
  
  List<Widget> getType(List<String> types, int selectId){
    List<Widget> list = [];
    for (var i = 0; i < types.length; i++){
      list.add(Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: i == selectId ? Colors.blue : Colors.white, width: 2)
          ),
        ),
        child: TextButton(
            onPressed: null,
            child: Text(
              types[i],
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: i == selectId?Colors.blue:Colors.black
              ),
            )),
      ));
    }
    return list;
  }

  List<Widget> getCourseList(List<Course> courseList){
    List<Widget> list = [];
    for (var i = 0; i < courseList.length; i++){
      list.add(SizedBox(height: 10,));
      list.add( Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                width: 300,
                height: 200,
                color: Colors.blue,
              ),

              Container(
                  padding: EdgeInsets.all(20),
                  child: Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                courseList[i].title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),


                        SizedBox(height: ConstVar.minspace,),

                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                courseList[i].description,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: ConstVar.mediumspace,),

                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                courseList[i].level + " -  ${courseList[i].topicList.length} Lessons",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  )
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

