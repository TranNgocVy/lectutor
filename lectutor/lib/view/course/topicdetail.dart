
// import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:lectutor/model/topic.dart';
import '../const/page.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class TopicDetail extends StatelessWidget {
  final Topic topic;
  const TopicDetail({super.key, required this.topic});


  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, TopicDetailPage(topic: topic,));
  }
}

class TopicDetailPage extends StatefulWidget {
  final Topic topic;
  const TopicDetailPage({super.key, required this.topic});
  @override
  State<TopicDetailPage> createState() => _TopicDetailPage();
}

class _TopicDetailPage extends State<TopicDetailPage> {
  String urlPDFPath = "";
  bool exists = true;
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  late PDFViewController _pdfViewController;
  bool loaded = false;

  Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = 'testonline';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + fileName + ".pdf");
      print(dir.path);
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  // void requestPersmission() async {
  //   await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  // }

  @override
  void initState() {
    // requestPersmission();
    getFileFromUrl(widget.topic.nameFile!).then(
          (value) => {
        setState(() {
          if (value != null) {
            urlPDFPath = value.path;
            loaded = true;
            exists = true;
          } else {
            exists = false;
          }
        })
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loaded) {
      return Scaffold(
        // appBar: AppBar(
        //   title: Text("${widget.topic.name}"),
        // ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${widget.topic.orderCourse}. ${widget.topic.name}",

                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              child:  PDFView(
                filePath: urlPDFPath,
                autoSpacing: true,
                enableSwipe: true,
                pageSnap: true,
                swipeHorizontal: true,
                nightMode: false,
                onError: (e) {
                  //Show some error message or UI
                },
                onRender: (_pages) {
                  setState(() {
                    _totalPages = _pages!;
                    pdfReady = true;
                  });
                },
                onViewCreated: (PDFViewController vc) {
                  setState(() {
                    _pdfViewController = vc;
                  });
                },
                onPageChanged: (int? page, int? total) {
                  setState(() {
                    _currentPage = page!;
                  });
                },
                onPageError: (page, e) {},
              ),
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chevron_left),
              iconSize: 50,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  if (_currentPage > 0) {
                    _currentPage--;
                    _pdfViewController.setPage(_currentPage);
                  }
                });
              },
            ),
            Text(
              "${_currentPage + 1}/$_totalPages",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            IconButton(
              icon: Icon(Icons.chevron_right),
              iconSize: 50,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  if (_currentPage < _totalPages - 1) {
                    _currentPage++;
                    _pdfViewController.setPage(_currentPage);
                  }
                });
              },
            ),
          ],
        ),
      );
    } else {
      if (exists) {
        //Replace with your loading UI
        return Scaffold(
          // appBar: AppBar(
          //   title: Text("${widget.topic.name}"),
          // ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${widget.topic.orderCourse}. ${widget.topic.name}",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child:  Text(
                  "Loading..",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )



        );
      } else {
        //Replace Error UI
        return Scaffold(
          // appBar: AppBar(
          //   title: Text("${widget.topic.name}"),
          // ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${widget.topic.orderCourse}. ${widget.topic.name}",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child:  Text(
                  "PDF Not Available",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )
        );
      }
    }
  }




  // Courses course = Courses("Life in the Internet Age",
  //     "Let's discuss how technology is changing the way we live",
  //     "Intermediate",
  //     [Topics("The Internet"),
  //       Topics("Artificial Intelligence (AI)"),
  //       Topics("Social Media"),
  //       Topics("Internet Privacy"),
  //       Topics("Live Streaming"),
  //       Topics("Coding"),
  //       Topics("Technology Transforming Healthcare"),
  //       Topics("Smart Home Technology"),
  //       Topics("Remote Work - A Dream Job?"),
  //     ]
  // );
  // int selectIndex = 0;
  //
  //
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.fromLTRB(10,5,10,10),
  //     child: Expanded(
  //       child: ListView(
  //         children: <Widget>[
  //           Container(
  //             child: Image(image: AssetImage("assets/icon/course.png"),),
  //           ),
  //
  //           Container(
  //               padding: EdgeInsets.fromLTRB(0,10,0,10),
  //               child: Expanded(
  //                 child: Column(
  //                   children: <Widget>[
  //                     Row(
  //                       children: <Widget>[
  //                         Expanded(
  //                           child: Text(
  //                             course.title,
  //                             style: TextStyle(
  //                               fontSize: 25,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //
  //                     SizedBox(height: ConstVar.minspace,),
  //
  //                     Row(
  //                       children: <Widget>[
  //                         SizedBox(width: 10,),
  //                         Expanded(
  //                           child: Text(
  //                             course.description,
  //                             style: TextStyle(
  //                               fontSize: 18,
  //                               color: Colors.black,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               )
  //           ),
  //
  //           Container(
  //               padding: EdgeInsets.fromLTRB(0,10,0,10),
  //               child: Expanded(
  //                 child: Column(
  //                   children: <Widget>[
  //                     Row(
  //                       children: <Widget>[
  //                         Expanded(
  //                           child: Text(
  //                             "List Topics",
  //                             style: TextStyle(
  //                               fontSize: 25,
  //                               fontWeight: FontWeight.bold,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     Column(
  //                       children: getTopicList(course.topicList),
  //                     ),
  //                     SizedBox(height: ConstVar.minspace,),
  //                   ],
  //                 ),
  //               )
  //           ),
  //
  //           SizedBox(height: ConstVar.mediumspace,),
  //
  //           Container(
  //             decoration: BoxDecoration(
  //               border: Border.all(color: Colors.grey, width: 1),
  //             ),
  //             child: Column(
  //               children: <Widget>[
  //                 Container(
  //                   color: Colors.grey.shade200,
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                     children: <Widget>[
  //                       Container(
  //                         alignment: Alignment.centerLeft,
  //                         child: Row(
  //                           children: <Widget>[
  //                             GestureDetector(
  //                               onTap: null,
  //                               child: Icon(Icons.expand_less, size: 30,),
  //                             ),
  //                             Container(
  //                               width: 50,
  //                               color: Colors.white,
  //                               // padding: EdgeInsets.only(top:5, bottom: 5),
  //                               child: TextFormField(
  //                                 keyboardType: TextInputType.number,
  //                                 autofocus: false,
  //                                 initialValue: '1',
  //                                 decoration: InputDecoration(
  //                                   // hintText: 'Enter your email...',
  //                                   // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  //                                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  //                                 ),
  //                               ),
  //                             ),
  //
  //                             Text(("/17")),
  //                             GestureDetector(
  //                               onTap: null,
  //                               child: Icon(Icons.expand_more, size: 30,),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       Container(
  //                         alignment: Alignment.center,
  //                         child: Row(
  //                           children: <Widget>[
  //                             GestureDetector(
  //                               onTap: null,
  //                               child: Icon(Icons.zoom_out, size: 30,),
  //                             ),
  //                             // TextField(
  //                             //   keyboardType: TextInputType.number,
  //                             //   autofocus: false,
  //                             //   cursorWidth: 10,
  //                             // ),
  //                             Text(("50%")),
  //                             GestureDetector(
  //                               onTap: null,
  //                               child: Icon(Icons.zoom_in, size: 30,),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //
  //                       Container(
  //                         alignment: Alignment.centerRight,
  //                         child: Row(
  //                           children: <Widget>[
  //                             GestureDetector(
  //                               onTap: null,
  //                               child: Icon(Icons.search, size: 30,),
  //                             ),
  //                             GestureDetector(
  //                               onTap: null,
  //                               child: Icon(Icons.fullscreen_rounded, size: 30,),
  //                             ),
  //
  //                             GestureDetector(
  //                               onTap: null,
  //                               child: Icon(Icons.file_download_rounded, size: 30,),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // List<Widget> getTopicList(List<Topics> topicList){
  //   List<Widget> list = [];
  //   for (var i = 0; i < topicList.length; i++){
  //     list.add(GestureDetector(
  //       child: Container(
  //         padding: EdgeInsets.all(10),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           color: selectIndex == i ? Colors.grey.shade300 : Colors.white,
  //
  //         ),
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text(
  //               "${i + 1}",
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.black87,
  //               ),
  //             ),
  //             SizedBox(width: 10,),
  //             Expanded(
  //                 child: Text(
  //                   topicList[i].title,
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     // fontWeight: FontWeight.bold,
  //                     color: Colors.black87,
  //                   ),
  //                 )
  //             ),
  //           ],
  //         ),
  //       ),
  //       onTap: (){
  //         setState(() {
  //           selectIndex = i;
  //         });
  //       },
  //     ));
  //   }
  //   return list;
  // }



}


