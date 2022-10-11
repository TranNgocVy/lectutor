import 'package:flutter/material.dart';
import '../const/constVar.dart';


class TeacherList extends StatelessWidget {
  const TeacherList({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Teacher List',
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: TeacherListPage(),
        )
    );
  }
}

class TeacherListPage extends StatefulWidget {
  const TeacherListPage({super.key});
  @override
  State<TeacherListPage> createState() => _TeacherListPage();
}

class _TeacherListPage extends State<TeacherListPage> {


  @override
  Widget build(BuildContext context) {
    // return Container(
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
                      const Text(
                        "Upconming lesson",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: ConstVar.mediumspace),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Fri, 30 Sep 22 18:30 - 18:55',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(text: ' (start in 65:65:51)',
                                style: TextStyle(color: Colors.yellow, fontSize: 12),
                                // recognizer: TapGestureRecognizer()
                                //   ..onTap = () {}
                              )
                            ]
                        ),
                        // loginButton,
                        // forgotLabel
                      ),
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
                      SizedBox(height: ConstVar.minspace),
                      const Text(
                        "Total lesson is 1 hours 15 minutes",
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Column>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Find a tutor",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: ConstVar.mediumspace),

                        // TextField(
                        //   decoration: InputDecoration(
                        //     hintText: "1256",
                        //   ),
                        // ),

                        SizedBox(height: ConstVar.minspace),
                        Text(
                          "Select availiable tutoring time:",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //     hintText: "1345",
                        //   ),
                        // )
                        // TextField(
                        //   // keyboardType: TextInputType.text,
                        //   autofocus: false,
                        //   // initialValue: '',
                        //   decoration: InputDecoration(
                        //     hintText: 'Enter tutor name...',
                        //     hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                        //     // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        //   ),
                        // ),
                        // TextFormField(
                        //   keyboardType: TextInputType.text,
                        //   autofocus: false,
                        //   initialValue: '',
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //     hintText: 'Select tutor nationality',
                        //     hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                        //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        //     suffixIcon: IconButton(
                        //       onPressed: null,
                        //       icon: Icon(Icons.visibility),
                        //     ),
                        //   ),
                        // ),
                        // Row(
                        //   children: <TextFormField>[
                        //     TextFormField(
                        //       keyboardType: TextInputType.text,
                        //       autofocus: false,
                        //       initialValue: '',
                        //       decoration: InputDecoration(
                        //         hintText: 'Enter tutor name...',
                        //         hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                        //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        //       ),
                        //     ),
                        //     TextFormField(
                        //       keyboardType: TextInputType.text,
                        //       autofocus: false,
                        //       initialValue: '',
                        //       obscureText: true,
                        //       decoration: InputDecoration(
                        //         hintText: 'Select tutor nationality',
                        //         hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                        //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        //         suffixIcon: IconButton(
                        //           onPressed: null,
                        //           icon: Icon(Icons.visibility),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // )
                        Row(
                          children: <Widget>[
                            getElevatedButton("All", selected: true),
                            getElevatedButton("English for kids"),
                            getElevatedButton("English for business"),
                            getElevatedButton("Conversational"),
                            getElevatedButton("STARTERS"),
                            getElevatedButton("MOVERS"),
                            getElevatedButton("FLYRS"),
                            getElevatedButton("KET"),
                            getElevatedButton("PET"),
                            getElevatedButton("IELTS"),
                            getElevatedButton("TOEFL"),
                            getElevatedButton("TOEIC"),
                          ],
                        ),


                        ElevatedButton(
                          onPressed: null,
                          child: Text(
                            "Reset Filters",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            // backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid,
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: ConstVar.mediumspace),
                      ],
                    ),
                  ],
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
                  children: <Card>[
                    Card(
                      borderOnForeground: true,
                      margin: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Icon(
                                  Icons.account_circle_outlined,
                                  size: 60,
                                ),
                              ),

                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Name of lettutor",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Icon(
                                            Icons.south_america_sharp,
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            "Nationality of lettutor",
                                            style: TextStyle(
                                                fontSize: 12
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Icon>[
                                        Icon(Icons.star, color: Colors.yellow, size: 15,),
                                        Icon(Icons.star, color: Colors.yellow, size: 15,),
                                        Icon(Icons.star, color: Colors.yellow, size: 15,),
                                        Icon(Icons.star, color: Colors.yellow, size: 15,),
                                        Icon(Icons.star, color: Colors.yellow, size: 15,),

                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Icon>[
                                      Icon(
                                        Icons.favorite_border,
                                        color: Colors.blue,
                                        size: 30,
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              getElevatedButton("English for Business", selected: true),
                              getElevatedButton("TEIC", selected: true),
                            ],
                          ),

                          Container(
                            child: Text(
                              "Description about lettutor",
                              style: TextStyle(
                                fontSize: 12,
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
                                onPressed: null,

                              ),
                            ],
                          )
                        ],
                      ),
                      ),

                    )
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

}

