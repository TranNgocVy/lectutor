
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../const/constVar.dart';
import '../const/header.dart';
import '../model/course.dart';

class TeacherDetail extends StatelessWidget {
  const TeacherDetail({super.key});



  @override
  Widget build(BuildContext context) {
    return Header.getHeader(context, TeacherDetailPage());

  }
}

class TeacherDetailPage extends StatefulWidget {
  const TeacherDetailPage({super.key});
  @override
  State<TeacherDetailPage> createState() => _TeacherDetailPage();

}

class _TeacherDetailPage extends State<TeacherDetailPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.account_circle_outlined,
                size: 100,
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
                              flex: 1,
                              child: Text(
                                "Name of lettutor",
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
                              padding: EdgeInsets.only(top: 5),
                              child: Icon(
                                Icons.south_america_sharp,
                                size: 25,
                              ),
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    "Nationality of lettutor",
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
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                            Icon(Icons.star, color: Colors.yellow, size: 20,),
                            Text(
                              "(58)",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black38,
                                  fontStyle: FontStyle.italic
                              ),
                            ),

                          ],
                        )
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
                  "Desscription about lettutor",
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
                  Icon(
                    Icons.favorite_border,
                    color: Colors.blue,
                    size: 25,
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
                  Icon(
                    Icons.star_border,
                    color: Colors.blue,
                    size: 25,
                  ),
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
            color: Colors.blue,
            height: 300,
          ),

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
                      getElevatedButton("English"),
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

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Row(
                    children: <Widget>[
                      getElevatedButton("English for business"),
                      getElevatedButton("Conversational"),
                      getElevatedButton("English for kids"),
                      getElevatedButton("IELTS"),
                      getElevatedButton("TOEIC"),

                    ],
                  ))
            ],
          ),

          SizedBox(height: ConstVar.largespace),

          Text(
            "Suggested courses",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Column(
            children: getSuggestedCourse([Course("Basic conversation topics", "", "", []), Course("Life in the internet age", "", "", [])]),
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
                  "I loved the weather, the scenery and the laid-back lifestyle of the locals.",
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
                  "I have more than 10 years of teaching english experience",
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
                  onPressed: null,
                  icon: Icon(
                      Icons.chevron_left_rounded,
                    color: Colors.black38,
                  ),
              ),

              SizedBox(width: ConstVar.minspace),

              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.black38,
                ),
              ),

              SizedBox(width: ConstVar.minspace),

              Text(
                "Oct, 2022",
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
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),

                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: getDate("11/10", "Tue"),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: getDate("12/10", "Wed"),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: getDate("13/10", "Thu"),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: getDate("14/10", "Fri"),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: getDate("15/10", "Sat"),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: getDate("16/10", "Sun"),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: getDate("17/10", "Mon"),
                          ),
                        ],
                      ),
                      getTableRow("00:00 - 00:25", ["Booked", "","", "", "Book","", ""]),
                      getTableRow("00:30 - 00:55", ["Booked", "","", "", "Book","", ""]),
                      getTableRow("01:00 - 01:25", ["UnBook", "","", "", "Book","", ""]),
                      getTableRow("01:30 - 01:55", ["Book", "","", "", "Book","", ""]),
                      getTableRow("02:00 - 02:25", ["Book", "Booked","Book", "Reserved", "Book","", ""]),
                      getTableRow("02:30 - 02:55", ["Reserved", "","", "", "","", ""]),
                      getTableRow("03:00 - 03:25", ["", "","", "", "Reserved","", ""]),
                      getTableRow("03:30 - 03:55", ["Booked", "Reserved","", "", "","", ""]),
                      getTableRow("04:00 - 04:25", ["Book", "UnBook","", "", "","", ""]),
                      getTableRow("04:30 - 04:55", ["", "","", "", "Book","", ""]),
                      getTableRow("05:00 - 05:25", ["", "UnBook","", "", "Book","", ""]),
                      getTableRow("05:30 - 05:55", ["", "","", "", "Book","", ""]),


                    ],
                  ),
                  ),
                ),
            ],
          )
        ],
      ),
    );



  }

  Container getElevatedButton(String txt){
    Container btn = Container(
      padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
      child: ElevatedButton(
        onPressed: null,
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.blue,
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

  TableRow getTableRow(String time, List<String> date){
    List<Widget> row = [];
    row.add(getBookCell(time));
    for (var i = 0; i < 7; i++){
      row.add(getBookCell(date[i]));
    }

    return TableRow(
      children: row,
    );
  }

  List<Widget> getSuggestedCourse(List<Course> courseLisst){
    List<Widget> list = [];

    for (var i = 0; i < courseLisst.length; i++){
      list.add(Row(
        children: <Widget>[
          SizedBox(width: 10),
          RichText(
            text: TextSpan(
                text: courseLisst[i].title + ": ",
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

}