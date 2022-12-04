import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class VideoIntroduction extends StatelessWidget {
  const VideoIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, VideoIntroductionPage());

  }

}

class VideoIntroductionPage extends StatefulWidget {
  const VideoIntroductionPage({super.key});
  @override
  State<VideoIntroductionPage> createState() => _VideoIntroductionPage();
}

class _VideoIntroductionPage extends State<VideoIntroductionPage> {
  String level = "";
  final List<String> _selectedItems = [];
  // List<bool> _isCheckedList =;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getRound(["Complete profile", "Video introduction", "Approval"], 2)
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey.shade200),
                )
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: Svg('assets/icon/videointroduction.svg', size: Size(80, 80)),
                ),
                SizedBox(width: 10,),
                Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(child: Text(
                              "Introduce yourself",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                            )),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),),
                          ],
                        ),
                      ],
                    )),

              ],
            )
            ,
          ),
          SizedBox(height: ConstVar.largespace,),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Introduction video",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: ConstVar.minspace,),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey.shade200),
                      )
                  ),
                ),
                SizedBox(height: ConstVar.minspace,),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade200, width:  1),
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Expanded(child: Text(
                              "A few helpful tips:",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            )),
                          )
                        ],
                      ),
                      Column(
                        children: getStep(["Find a clean and quiet space",
                          "Smile and look at the camera",
                          "Dress smart",
                          "Speak for 1-3 minutes",
                          "Brand yourself and have fun!"
                        ]),
                      )
                    ],
                  ),
                ),
                SizedBox(height: ConstVar.mediumspace,),

              ],
            ),
          ),

          SizedBox(height: ConstVar.largespace,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: null,
                child: Text("Choose video", style: TextStyle(color: Colors.blue, fontSize: 18)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.blue, width: 1)
                      )
                  ),
                  backgroundColor:  MaterialStateProperty.all(Colors.white),
                ),

              ),


            ],
          ),

          SizedBox(height: ConstVar.largespace,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/becometutor/completeproflie");
                },
                child: Text("Previous", style: TextStyle(color: Colors.blue, fontSize: 18)),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(color: Colors.blue, width: 1)
                      )
                  ),
                  backgroundColor:  MaterialStateProperty.all(Colors.white),
                ),

              ),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/becometutor/approval");
                },
                child: Text("Done", style: TextStyle(color: Colors.white, fontSize: 18)),
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
          )


        ],
      ),

    );
  }

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
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
  List<Widget> getStep(List<String> steps){
    List<Widget> list = [];

    for(var i = 0; i < steps.length; i++ ){
      list.add(
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Expanded(child: Text(
                    "${i  +1}. " + steps[i],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  )),
                )
              ],
            ),
          )
      );
    }
    return list;
  }


}