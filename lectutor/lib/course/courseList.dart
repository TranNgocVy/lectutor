import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:lectutor/model/course.dart';
import 'package:lectutor/model/topic.dart';
import '../const/constVar.dart';
import '../const/page.dart';


class CourseList extends StatelessWidget {
  const CourseList({super.key});


  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, CourseListPage());
  }
}

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});
  @override
  State<CourseListPage> createState() => _CourseListPage();
}

class _CourseListPage extends State<CourseListPage> {
  String level = "";
  String category = "";
  String sortby = "";
  final FocusNode _lvlFocus = FocusNode();
  final FocusNode _catFocus = FocusNode();


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

            // DropdownButtonFormField(
            //   decoration: InputDecoration(
            //     enabledBorder: OutlineInputBorder( //<-- SEE HERE
            //       borderSide: BorderSide(color: Colors.grey, width: 1),
            //     ),
            //     focusedBorder: OutlineInputBorder( //<-- SEE HERE
            //       borderSide: BorderSide(color: Colors.grey, width: 1),
            //     ),
            //     filled: true,
            //     fillColor: Colors.white,
            //   ),
            //   dropdownColor: Colors.white,
            //   // value: level,
            //   hint: Text("Select level"),
            //
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       level = newValue!;
            //     });
            //   },
            //   items: (ConstVar.levelList).map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //         value: value,
            //         child: Expanded(
            //           child: Text(
            //             value,
            //           ),
            //         )
            //     );
            //   }).toList(),
            // ),

            Focus(
                focusNode: _lvlFocus,
                child: Listener(
                  onPointerDown: (_) {
                    FocusScope.of(context).requestFocus(_lvlFocus);
                  },
                  child: DropdownSearch<String>.multiSelection(
                    items: ConstVar.levelList,
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
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        hintText: 'Select level',
                      ),
                    ),
                    // selectedItems: ['Item1', 'Item2'],
                    onChanged: (val) {
                      setState(() {
                        _lvlFocus.requestFocus();
                      });
                    },
                  ),
                )
            ),
            SizedBox(height: ConstVar.minspace,),

            // TextFormField(
            //   autofocus: false,
            //   initialValue: '',
            //   decoration: InputDecoration(
            //     hintText: 'Select category',
            //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            //     suffixIcon: IconButton(
            //       onPressed: null,
            //       icon: Icon(Icons.expand_more_outlined),
            //     ),
            //   ),
            // ),
            Focus(
                focusNode: _catFocus,
                child: Listener(
                  onPointerDown: (_) {
                    FocusScope.of(context).requestFocus(_catFocus);
                  },
                  child: DropdownSearch<String>.multiSelection(
                    items: ConstVar.type,
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
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        hintText: 'Select category',
                      ),
                    ),
                    // selectedItems: ['Item1', 'Item2'],
                    onChanged: (val) {
                      setState(() {
                        _catFocus.requestFocus();
                      });
                    },
                  ),
                )
            ),

            // DropdownButtonFormField(
            //   decoration: InputDecoration(
            //     enabledBorder: OutlineInputBorder( //<-- SEE HERE
            //       borderSide: BorderSide(color: Colors.grey, width: 1),
            //     ),
            //     focusedBorder: OutlineInputBorder( //<-- SEE HERE
            //       borderSide: BorderSide(color: Colors.grey, width: 1),
            //     ),
            //     filled: true,
            //     fillColor: Colors.white,
            //   ),
            //   dropdownColor: Colors.white,
            //   hint: Text("Select category"),
            //   // value: level,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       category = newValue!;
            //     });
            //   },
            //   items: (ConstVar.type).map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //         value: value,
            //         child: Expanded(
            //           child: Text(
            //             value,
            //           ),
            //         )
            //     );
            //   }).toList(),
            // ),


            SizedBox(height: ConstVar.minspace,),

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
              hint: Text("Sort by level"),
              // value: level,
              onChanged: (String? newValue) {
                setState(() {
                  sortby = newValue!;
                });
              },
              items: <String>["level decreasing", "level assending"].map<DropdownMenuItem<String>>((String value) {
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
        child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/course/detail');
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  child: Image(image: AssetImage("assets/icon/course.png")),
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
        ),
        elevation: 5,
        shadowColor: Colors.grey,
      ));
    }
    return list;
  }


}

