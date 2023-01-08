import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lectutor/handle/teacher.dart';
import 'package:provider/provider.dart';

import '../../config/const.dart';
import '../../config/pkg.dart';
import '../../model/language/provider.dart';
import '../../model/user/tokens.dart';
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
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;
    Pkg.getLanguage(languageProvider);

    final tokenProvider = Provider.of<Tokens>(context);
    final token = tokenProvider.access.token;

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
                Text('${language.report} ${widget.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                      child:Text("${language.helpReport}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
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
                      reason = "${reason}${language.firsrReason}\n";
                      noteController.text = reason;
                    }
                    else{
                      List<String> reasonList = reason.split("${language.firsrReason}\n");
                      reason = "";
                      reasonList.forEach((element) {
                        reason = "${reason}${element}";
                      });
                      noteController.text = reason;
                    }
                  });
                },
                title: Text("${language.firsrReason}"),
              ),
              CheckboxListTile(
                value: isSelectedReason[1],
                controlAffinity: ListTileControlAffinity.leading, //checkbox at left
                onChanged: (bool? value) {
                  setState(() {
                    isSelectedReason[1] = value!;
                    if(value! == true){
                      reason = "${reason}${language.secondReason}\n";
                      noteController.text = reason;
                    }
                    else{
                      List<String> reasonList = reason.split("${language.secondReason}\n");
                      reason = "";
                      reasonList.forEach((element) {
                        reason = "${reason}${element}";
                      });
                      noteController.text = reason;
                    }
                  });
                },
                title: Text("${language.secondReason}"),
              ),
              CheckboxListTile(
                value: isSelectedReason[2],
                controlAffinity: ListTileControlAffinity.leading, //checkbox at left
                onChanged: (bool? value) {
                  setState(() {
                    isSelectedReason[2] = value!;
                    if(value! == true){
                      reason = "${reason}${language.thirdReason}\n";
                      noteController.text = reason;
                    }
                    else{
                      List<String> reasonList = reason.split("${language.thirdReason}\n");
                      reason = "";
                      reasonList.forEach((element) {
                        reason = "${reason}${element}";
                      });
                      noteController.text = reason;
                    }
                  });
                },
                title: Text(language.thirdReason),
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
                  hintText: language.reasonHint,
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
              child: Text(language.cancel, style: TextStyle(color: Colors.black),),
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
                  var isSuccess = await TeacherService.reportTeacher(token, widget.id, reason);

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
                            Text(language.notification),
                          ],
                        ),
                      ),
                      content: Text(isSuccess ? '${language.report} ${widget.name} ${language.success}':"${language.report} ${widget.name} ${language.fail}"),
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
                          child: Text(language.back, style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  );

                }

              },
              child: Text(language.submit, style: TextStyle(color: Colors.white),),
            ),

          ],
        )
      ],
    );

  }
}