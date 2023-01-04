import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lectutor/handle/teacher.dart';

import '../../config/const.dart';
import '../const/constVar.dart';

class ReportTeacherPage extends StatefulWidget {
  final String name;
  final String id;
  const  ReportTeacherPage({super.key, required this.name, required this.id});
  @override
  State<ReportTeacherPage> createState() => _ReportTeacher();

}

class _ReportTeacher extends State<ReportTeacherPage> {

  TextEditingController noteController = TextEditingController();
  String reason = "";

  List<bool> isSelectedReason = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,

      children: [
        AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Container(
            // height: MediaQuery.of(context).size.height - 500,
            // width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 2)
                )
            ),
            child: Row(
              children: [
                Text('Report ${widget.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          content: Column(
            children: <Widget>[
              Row(
                children: [
                  Icon(Icons.report, color: Colors.blue, size: 25,),
                  SizedBox(width: 10,),
                  Expanded(
                      child:Text("Help us understand what's happening", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  )
                ],
              ),

              CheckboxListTile(
                value: isSelectedReason[0],
                controlAffinity: ListTileControlAffinity.leading, //checkbox at left
                onChanged: (bool? value) {
                  setState(() {
                    isSelectedReason[0] = value!;
                    if(value! == true){
                      reason = "${reason}This tutor is annoying me\n";
                      noteController.text = reason;
                    }
                    else{
                      List<String> reasonList = reason.split("This tutor is annoying me\n");
                      reason = "";
                      reasonList.forEach((element) {
                        reason = "${reason}${element}";
                      });
                      noteController.text = reason;
                    }
                  });
                },
                title: Text("This tutor is annoying me"),
              ),
              CheckboxListTile(
                value: isSelectedReason[1],
                controlAffinity: ListTileControlAffinity.leading, //checkbox at left
                onChanged: (bool? value) {
                  setState(() {
                    isSelectedReason[1] = value!;
                    if(value! == true){
                      reason = "${reason}This profile is pretending be someone or is fake\n";
                      noteController.text = reason;
                    }
                    else{
                      List<String> reasonList = reason.split("This profile is pretending be someone or is fake\n");
                      reason = "";
                      reasonList.forEach((element) {
                        reason = "${reason}${element}";
                      });
                      noteController.text = reason;
                    }
                  });
                },
                title: Text("This profile is pretending be someone or is fake"),
              ),
              CheckboxListTile(
                value: isSelectedReason[2],
                controlAffinity: ListTileControlAffinity.leading, //checkbox at left
                onChanged: (bool? value) {
                  setState(() {
                    isSelectedReason[2] = value!;
                    if(value! == true){
                      reason = "${reason}Inappropriate profile photo\n";
                      noteController.text = reason;
                    }
                    else{
                      List<String> reasonList = reason.split("Inappropriate profile photo\n");
                      reason = "";
                      reasonList.forEach((element) {
                        reason = "${reason}${element}";
                      });
                      noteController.text = reason;
                    }
                  });
                },
                title: Text("Inappropriate profile photo"),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                autofocus: false,
                minLines: 5,
                maxLines: null,
                controller: noteController,
                onChanged: (String?value){
                  setState(() {
                    reason = value!;
                    noteController.text = reason;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Please let us know details about your problem',
                  hintStyle: TextStyle(color: Colors.grey.shade200),
                  hintMaxLines: 5,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              )

            ],
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(30,10,30,10)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.blue)
                      // side: BorderSide(color: Colors.red)
                    )
                ),
                backgroundColor:MaterialStateProperty.all(Colors.white),
              ),

              onPressed: () {
                Navigator.pop(context);

              },
              child: const Text('Cancel', style: TextStyle(color: Colors.black),),
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(30,10,30,10)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // side: BorderSide(color: Colors.red)
                    )
                ),
                backgroundColor: reason.isEmpty ? MaterialStateProperty.all(Colors.grey) : MaterialStateProperty.all(Colors.blue),
              ),

              onPressed: () async {
                if(reason.isNotEmpty){
                  var isSuccess = await reportTeacher(Const.token, widget.id, reason);

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
                            isSuccess ? Icon(Icons.task_alt, color: Colors.greenAccent,):Icon(Icons.cancel, color: Colors.red,),
                            SizedBox(width: ConstVar.mediumspace,),
                            Text('Notification'),
                          ],
                        ),
                      ),
                      content: Text(isSuccess ? 'Report ${widget.name} successfully':"Report ${widget.name} failed"),
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
                            if (isSuccess){
                              Navigator.pop(context);
                            }

                          },
                          child: const Text('Ok', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  );

                }

              },
              child: const Text('Submit', style: TextStyle(color: Colors.white),),
            ),

          ],
        )
      ],
    );

  }
}