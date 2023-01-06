import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:lectutor/config/const.dart';
import 'package:lectutor/model/category.dart';
import 'package:lectutor/model/language/language.dart';
import 'package:lectutor/model/level.dart';
import 'package:provider/provider.dart';
import '../../config/pkg.dart';
import '../../handle/course.dart';
import '../../model/course.dart';
import '../../model/language/provider.dart';
import '../../model/tokens.dart';
import '../const/constVar.dart';
import '../const/page.dart';


class CourseList extends StatelessWidget {
  const CourseList({super.key});


  @override
  Widget build(BuildContext context) {
    // return TemplatePage.getHeader(context, CourseListPage());
    return TemplatePage(widget: CourseListPage());

  }
}

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});
  @override
  State<CourseListPage> createState() => _CourseListPage();
}

class _CourseListPage extends State<CourseListPage> {
  List <String> category = [];
  List<int> selectedLevelId = [];
  List<String> selectedCategoryId = [];
  List<String> selectedLevel = [];
  List<String> selectedCategory = [];
  String sortby = "";
  String orderby = "";
  final FocusNode _lvlFocus = FocusNode();
  final FocusNode _catFocus = FocusNode();
  List<Course> courseList = [];
  List<Category> categoryList = [];
  int total = 0;
  int selectId = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void getCategory(String token) async{
    var data = await CourseService.getCategorylist(token);
    if (data != null){
      setState(() {
        categoryList = data;
        categoryList.forEach((element) { 
          category.add(element.title!);
        });
        
      });
    }
  }

  void getCourses(String token, int page, int size, {List<int> level = const [], List<String> categoryId = const [], String orderBy = ""}) async{
    var data = await CourseService.getCourselist(token, page, size, level: level, categoryId: categoryId,orderBy: orderBy );
    if (data != null){
      setState(() {
        updateLists(data);
      });
    }
  }
  void updateLists(dynamic data){
    total = data["data"]["count"];

    var courses = data["data"]["rows"];

    courseList.clear();

    try {
      for(int i = 0;; i ++){
        courseList.add(Course.fromJson(courses[i]));
      }
    } catch(e){}


  }



  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;

    final tokenProvider = Provider.of<Tokens>(context);
    final token = tokenProvider.access.token;

    getCourses(token, selectId, Const.perPageLarge);
    getCategory(token);

    Pkg.getLanguage(languageProvider);
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
                        language.discoverCourse,
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
                  language.descriptionDiscoverCourse,
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
                    items: ConstVar.levelStringList,
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
                        hintText: language.selectLevel,
                      ),
                    ),
                    selectedItems: selectedLevel,
                    onChanged: (val) async {
                      setState(() {
                        selectedLevel = val;
                        _lvlFocus.requestFocus();
                        selectedLevelId.clear();

                        val.forEach((element) {
                          ConstVar.levelList.forEach((level) {
                            if(level.alias == element){
                              selectedLevelId.add(int.parse(level.id));
                            }
                          });
                        });

                        selectId = 1;
                      });


                      getCourses(token, selectId, Const.perPageLarge, level: selectedLevelId, categoryId: selectedCategoryId, orderBy: orderby);

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
                    items: category,
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
                        hintText: language.selectcCategory,
                      ),
                    ),
                    selectedItems: selectedCategory,
                    onChanged: (val) async {
                      setState(() {
                        selectedCategory = val;
                        _catFocus.requestFocus();
                        selectedCategoryId.clear();
                        val.forEach((element) {
                          for(int i = 0; i <categoryList.length; i++){
                            if(element == categoryList[i].title){
                              selectedCategoryId.add(categoryList[i].id!);
                              break;
                            }
                          }
                        });
                        selectId = 1;

                      });
                      getCourses(token, selectId, Const.perPageLarge, level: selectedLevelId, categoryId: selectedCategoryId, orderBy: orderby);

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
              hint: Text(language.sortByLevel),
              // value: level,
              onChanged: (String? newValue) {
                setState(() {
                  sortby = newValue!;
                  if(sortby == language.desc){
                    orderby = "DESC";
                  }
                  else{
                    if(sortby == language.asc){
                      orderby = "ASC";
                    }
                  }
                });
              },
              items: <String>[language.asc, language.desc].map<DropdownMenuItem<String>>((String value) {
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
              children: getType([language.course], 0),
            ),




            // Expanded(
            //   child:
            // ),
            Column(
              children: getCourseList(courseList, language),
            ),
            getPage(token, total),
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

  List<Widget> getCourseList(List<Course> courseList, Language language){
    Map<String, List<Course>> mapCategoryCourse ={};

    courseList.forEach((course) {
      course.categories!.forEach((category) {
        if(mapCategoryCourse[category.title!] == null){
          mapCategoryCourse[category.title!] = [course];
        }
        else{
          mapCategoryCourse[category.title!]!.add(course);
        }
      });
    });


    List<Widget> list = [];
    mapCategoryCourse.forEach((key, value) {
      if(value != null){
        list.add(SizedBox(height: ConstVar.largespace,),);
        list.add(Text(
          "$key",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 23,
          ),
        ));

        value.forEach((course) {
          list.add(SizedBox(height: 10,));
          list.add( Card(
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/course/detail', arguments: course);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Container(
                      // child: Image(image: AssetImage("assets/icon/course.png")),
                      child: Image.network(course.imageUrl!),
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
                                      course.name!,
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
                                      course.description!,
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
                                      "${Level.getLevelById(ConstVar.levelList, course.level!).name} -  ${course.topics!.length} ${language.course}",
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
        });


      }
    });


    // for (var i = 0; i < courseList.length; i++){
    //   list.add(SizedBox(height: 10,));
    //   list.add( Card(
    //     child: GestureDetector(
    //       onTap: (){
    //         Navigator.pushNamed(context, '/course/detail', arguments: courseList[i]);
    //       },
    //       child: Container(
    //         padding: EdgeInsets.all(10),
    //         child: Column(
    //           children: <Widget>[
    //             Container(
    //               // child: Image(image: AssetImage("assets/icon/course.png")),
    //               child: Image.network(courseList[i].imageUrl!),
    //             ),
    //
    //             Container(
    //                 padding: EdgeInsets.all(20),
    //                 child: Expanded(
    //                   child: Column(
    //                     children: <Widget>[
    //                       Row(
    //                         children: <Widget>[
    //                           Expanded(
    //                             child: Text(
    //                               courseList[i].name!,
    //                               style: TextStyle(
    //                                 fontSize: 20,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //
    //
    //                       SizedBox(height: ConstVar.minspace,),
    //
    //                       Row(
    //                         children: <Widget>[
    //                           Expanded(
    //                             child: Text(
    //                               courseList[i].description!,
    //                               style: TextStyle(
    //                                 fontSize: 16,
    //                                 color: Colors.grey,
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //
    //                       SizedBox(height: ConstVar.mediumspace,),
    //
    //                       Row(
    //                         children: <Widget>[
    //                           Expanded(
    //                             child: Text(
    //                              "${Level.getLevelById(ConstVar.levelList, courseList[i].level!).name} -  ${courseList[i].topics!.length} Lessons",
    //                               style: TextStyle(
    //                                 fontSize: 16,
    //                                 color: Colors.black87,
    //                               ),
    //                             ),
    //                           ),
    //
    //                         ],
    //                       ),
    //
    //                     ],
    //                   ),
    //                 )
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //     elevation: 5,
    //     shadowColor: Colors.grey,
    //   ));
    // }
    return list;
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
          getCourses(token, selectId, Const.perPageLarge, level: selectedLevelId, categoryId: selectedCategoryId, orderBy: orderby);

        }
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Icon(Icons.chevron_left_rounded),
      ),
    ));
    for(int i = 1; temp > 0; i++){
      if(i == 1 || i - 1 == (count - 1) ~/ Const.perPageLarge || ( selectId - 2 < i && i < selectId + 2 )) {
        list.add(GestureDetector(
          onTap: (){
            if (i != selectId){
              setState(() {
                selectId = i;
              });
              getCourses(token, selectId, Const.perPageLarge, level: selectedLevelId, categoryId: selectedCategoryId, orderBy: orderby);

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

      temp = temp - Const.perPageLarge;
    }

    list.add(GestureDetector(
      onTap: (){
        if (selectId <= (count - 1)~/ Const.perPageLarge){

          setState(() {
            selectId = selectId + 1;
          });
          getCourses(token, selectId, Const.perPageLarge, level: selectedLevelId, categoryId: selectedCategoryId, orderBy: orderby);


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

