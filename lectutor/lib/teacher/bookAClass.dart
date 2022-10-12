
import 'package:flutter/material.dart';
import '../const/constVar.dart';

class BookAClass extends StatelessWidget {
  const BookAClass({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Book a class',
        home: Scaffold(
          // appBar: AppBar(title: const Text(_title)),
          resizeToAvoidBottomInset: false,
          body: BookAClassPage(),
        )
    );
  }
}

class BookAClassPage extends StatefulWidget {
  const BookAClassPage({super.key});
  @override
  State<BookAClassPage> createState() => _BookAClassPage();

}

class _BookAClassPage extends State<BookAClassPage> {


  @override
  Widget build(BuildContext context) {
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
                          "Booking details",
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
                                            "Booking Time",
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
                                              "Thời gian học",
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
                                        "Balance",
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
                                            "You have 726 lessons left",
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
                                        "Price",
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
                                            "lessons",
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
                                        "Note",
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
                                    initialValue: '',
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
                        onPressed: null,
                        child: const Text(
                          'Cancel',
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
                          'Book',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: null,
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


}
