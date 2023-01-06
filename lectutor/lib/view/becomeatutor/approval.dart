import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class Approval extends StatelessWidget {
  const Approval({super.key});

  @override
  Widget build(BuildContext context) {
    // return TemplatePage.getHeader(context, ApprovalPage());
    return TemplatePage(widget:  ApprovalPage());

  }

}

class ApprovalPage extends StatefulWidget {
  const ApprovalPage({super.key});
  @override
  State<ApprovalPage> createState() => _ApprovalPage();
}

class _ApprovalPage extends State<ApprovalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getRound(["Complete profile", "Video introduction", "Approval"], 3)
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey.shade200),
                )
            ),
          ),
          SizedBox(height: ConstVar.largespace,),

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sentiment_satisfied_alt, size: 80, color: Colors.blue,),
                  ],
                ),
                SizedBox(height: ConstVar.mediumspace,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "You have done all the steps",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ConstVar.mediumspace,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Please, wait for the operator's approval",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ConstVar.largespace,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, "/tutor");
                      },
                      child: Text("Back Home", style: TextStyle(color: Colors.white, fontSize: 18)),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )
                        ),
                        backgroundColor:  MaterialStateProperty.all(Colors.blue),
                      ),

                    ),


                  ],
                ),
              ],
            ),
          ),



          // SizedBox(height: ConstVar.largespace,),


        ],
      ),

    );
  }

  List<Widget> getRound(List<String> rounds, int step){
    List<Widget> list = [];

    for(var i = 0; i < rounds.length; i++ ){
      list.add(
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),

                decoration: BoxDecoration(
                    color: i < step ? Colors.blue : Colors.white,
                    border: Border.all(width: 1, color: i < step ? Colors.blue : Colors.grey),
                    shape: BoxShape.circle
                  // borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  '${i+1}',
                  style: TextStyle(
                    color: i < step ? Colors.white : Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(width: 5,),
              Text(
                rounds[i],
                style: TextStyle(
                    fontSize: 20
                ),
              )
            ],
          )
      );
      list.add(SizedBox(height: 5,));
    }
    return list;
  }


}