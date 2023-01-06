
import 'package:flutter/material.dart';
import 'package:lectutor/handle/schedule.dart';
import 'package:lectutor/main.dart';
import 'package:provider/provider.dart';
import '../../config/const.dart';
import '../../config/pkg.dart';
import '../../model/argument.dart';
import '../../model/language/provider.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class BookAClass extends StatelessWidget {
  final BookingLessonArg bookingLessonArg;
  const BookAClass({super.key, required this.bookingLessonArg});



  @override
  Widget build(BuildContext context) {
    // return TemplatePage.getHeader(context, BookAClassPage(bookingLessonArg: bookingLessonArg,));
    return TemplatePage(widget:  BookAClassPage(bookingLessonArg: bookingLessonArg,));

  }
}

class BookAClassPage extends StatefulWidget {
  final BookingLessonArg bookingLessonArg;
  const BookAClassPage({super.key, required this.bookingLessonArg});
  @override
  State<BookAClassPage> createState() => _BookAClassPage();

}

class _BookAClassPage extends State<BookAClassPage> {
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;

    Pkg.getLanguage(languageProvider);
    return Container(
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
          child: Container(
            // height: 300.0,
            // width: 300.0,
            padding: EdgeInsets.all(5),

            child: Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade100,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Text(
                          language.bookingDetail,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      )
                    ],
                  ),

                  Expanded(
                      child: ListView(
                        children: [
                          Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.shade100,
                                            width: 1,
                                          ),
                                          color: Colors.white10
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Text(
                                            language.bookingTime,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(color: Colors.grey.shade100, width: 1,),
                                          right: BorderSide(color: Colors.grey.shade100, width: 1,),
                                          bottom: BorderSide(color: Colors.grey.shade100, width: 1,),
                                        )
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple.shade50,
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                      child: Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(child: Text(
                                              getTimeLessoInfo(widget.bookingLessonArg.startTime, widget.bookingLessonArg.endTime),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),),

                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),),

                          SizedBox(height: ConstVar.mediumspace,),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade100,
                                  width: 1,
                                ),
                                color: Colors.white10
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        language.balance,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Expanded(child: Text(
                                            "${widget.bookingLessonArg.balance} ${language.lesson}",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.deepPurple
                                            ),
                                          )),
                                        ],
                                      ),
                                      flex: 2,
                                    ),
                                  ],
                                ),

                                SizedBox(height: ConstVar.mediumspace,),

                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        language.price,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            "1 ${language.lesson}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.deepPurple
                                            ),
                                          )
                                        ],
                                      ),
                                      flex: 2,
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height: ConstVar.mediumspace,),

                          Column(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade100,
                                        width: 1,
                                      ),
                                      color: Colors.white10
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Text(
                                        language.note,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.grey.shade100, width: 1,),
                                        right: BorderSide(color: Colors.grey.shade100, width: 1,),
                                        bottom: BorderSide(color: Colors.grey.shade100, width: 1,),

                                      )
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    autofocus: false,
                                    minLines: 4,
                                    maxLines: null,
                                    controller: noteController,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                    ),
                                  ),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),


                        ],
                      )),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: (){
                      Navigator.pop(context);
                      },
                        child: Text(
                          language.cancel,
                          style: TextStyle(
                              color: Colors.blue,
                              // fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                        style: ButtonStyle(
                          // backgroundColor: Colors.blue,
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder( borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Colors.blueAccent)),),
                        ),
                      ),

                      SizedBox(width: 10),

                      ElevatedButton.icon(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                        ),
                        // style: ElevatedButton.styleFrom(
                        //   shape: RoundedRectangleBorder(borderRadius: );
                        // ),
                        icon: Icon(Icons.keyboard_double_arrow_right_outlined, size: 20,color: Colors.white,),
                        label: Text(
                          language.book,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async{
                          var data = await bookingAClass(Const.token, widget.bookingLessonArg.scheduleDetailIds, noteController.text);
                          Navigator.pop(context, data);
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              title: Container(
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Colors.grey.shade200, width: 2)
                                    )
                                ),
                                child: Row(
                                  children: [
                                    data == true ? Icon(Icons.task_alt, color: Colors.greenAccent,):Icon(Icons.error, color: Colors.red,),
                                    SizedBox(width: ConstVar.mediumspace,),
                                    Text(language.notification),
                                  ],
                                ),
                              ),
                              content: Text(data == true?language.bookingSuccess:language.bookingFail),
                              actions: <Widget>[
                                TextButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(30,10,30,10)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          // side: BorderSide(color: Colors.red)
                                        )
                                    ),
                                    backgroundColor:MaterialStateProperty.all(Colors.blue),
                                  ),

                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(language.back, style: TextStyle(color: Colors.white),),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),



                ],
              ),
            ),

          ),
        )
    );



  }

  String getTimeLessoInfo(int start, int end){
    String time = Pkg.getPeriodTime(start, end);
    DateTime date = DateTime.fromMillisecondsSinceEpoch(start);

    return "$time ${Const.weekday[date.weekday - 1]}, ${date.day} ${Const.months[date.month - 1]} ${date.year}";
  }


}
