
import 'package:flutter/material.dart';
import '../const/constVar.dart';

class Review extends StatelessWidget {
  const Review({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'View review',
        home: Scaffold(
          // appBar: AppBar(title: const Text(_title)),
          resizeToAvoidBottomInset: false,
          body: ReviewPage(),
        )
    );
  }
}

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});
  @override
  State<ReviewPage> createState() => _ReviewPage();

}

class _ReviewPage extends State<ReviewPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
          child: Container(
            // height: 300.0,
            // width: 300.0,
            padding: EdgeInsets.all(20),

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
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Text(
                          "Others review",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),

                      // Container(
                      //   color: Colors.blue,
                      //   padding: EdgeInsets.only(bottom: 20),
                      //   // decoration: BoxDecoration(
                      //   //   border: Border(
                      //   //     bottom: BorderSide(
                      //   //       color: Colors.grey,
                      //   //       width: 1.0,
                      //   //     ),
                      //   //   ),
                      //   // ),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.max,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //       Icon(Icons.close, color: Colors.grey,size: 25,)
                      //     ],
                      //   )
                      // ),
                      

                    ],
                  ),

                  Expanded(
                      child: ListView(
                        children: [
                          getReviewItem(Icon(Icons.account_circle),"Pham Hải","16 days ago", 0, "111111111111111111111111111111111111111111111111111111111"),
                          getReviewItem(Icon(Icons.account_circle),"Pham Hải","16 days ago", 1, "111111111111111111111111111111111111111111111111111111111"),
                          getReviewItem(Icon(Icons.account_circle),"Pham Hải","16 days ago", 2, "111111111111111111111111111111111111111111111111111111111"),
                          getReviewItem(Icon(Icons.account_circle),"Pham Hải","16 days ago", 3, "111111111111111111111111111111111111111111111111111111111"),
                          getReviewItem(Icon(Icons.account_circle),"Pham Hải","16 days ago", 4, "111111111111111111111111111111111111111111111111111111111"),
                          getReviewItem(Icon(Icons.account_circle),"Pham Hải","16 days ago", 5, "111111111111111111111111111111111111111111111111111111111"),
                          getReviewItem(Icon(Icons.account_circle),"Pham Hải","16 days ago", 6, "111111111111111111111111111111111111111111111111111111111"),
                          getReviewItem(Icon(Icons.account_circle),"Pham Hải","16 days ago", 7, "111111111111111111111111111111111111111111111111111111111"),
                        ],
                      )),


                ],
              ),
            ),
          ),
        )
    );



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