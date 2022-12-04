import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, CompleteProfilePage());

  }

}

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key});
  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePage();
}

class _CompleteProfilePage extends State<CompleteProfilePage> {
  String level = "";
  final List<String> _selectedItems = [];
  // List<bool> _isCheckedList =;
  final TextEditingController _dController = TextEditingController();
  final FocusNode _dFocus = FocusNode();
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      setState(() {
        _dController.text = "${selectedDate.toLocal()}".split(' ')[0];
        _dFocus.requestFocus();
      });
    }
    else if (picked == selectedDate) {
      return;
    }
    else {
      setState(() {
        _dController.clear();
        selectedDate = DateTime.now();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getRound(["Complete profile", "Video introduction", "Approval"], 1)
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
                Image(image: AssetImage("assets/icon/completeprofile.png"),width: 80,),
                SizedBox(width: 10,),
                Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(child: Text(
                              "Set up your tutor profile",
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
                                "Your tutor profile is your chance to market yourself to students on Tutoring. You can make edits later on your profile settings page.",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),),
                          ],
                        ),

                        SizedBox(height: 10,),

                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "New students may browse tutor profiles to find a tutor that fits their learning goals and personality. Returning students may use the tutor profiles to find tutors they've had great experiences with already.",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),),
                          ],
                        )



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
                  "Basic info",
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
                  decoration: BoxDecoration(
                    color:  Colors.grey.shade100,
                    border: Border.all(color: Colors.grey.shade200, width: 2),
                  ),
                  width: 200,
                  height: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Upload avatar here ...",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ConstVar.minspace,),
                Text("Click to edit", style: TextStyle(fontSize: 16, color: Colors.black87),),
                SizedBox(height: ConstVar.mediumspace,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade200, width:  1),
                    color: Colors.blue.shade50,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text(
                        "Please upload a professional photo. See guidelines",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: ConstVar.mediumspace,),

                Text("Tutoring name", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  initialValue: 'Ngoc Vy',
                  decoration: InputDecoration(
                    hintText: '',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: ConstVar.mediumspace,),

                Text("I'm from", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                TextFormField(
                  autofocus: false,
                  initialValue: '',
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    suffixIcon: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.expand_more, color: Colors.grey,),
                    ),
                  ),
                ),
                SizedBox(height: ConstVar.mediumspace,),

                Text("Date of Birth", style: TextStyle(fontSize: 16, color: Colors.black87 , fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    // initialValue: "2001-04-04",
                    focusNode: _dFocus,
                    controller: _dController..text="2001-04-04",
                    autovalidateMode: AutovalidateMode.always,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      suffixIcon: (_dController.text.isNotEmpty && _dFocus.hasFocus) ?
                      IconButton(onPressed: () {setState(() {
                        _dController.clear();
                        selectedDate = DateTime.now();
                        _dFocus.unfocus();
                      });}, icon: Icon(Icons.clear)) :
                      Icon(Icons.calendar_month_outlined),
                    ),
                    readOnly: true,
                    onTap: () => _selectDate(context),
                  ),
                ),
                // TextFormField(
                //   autofocus: false,
                //   initialValue: '',
                //   decoration: InputDecoration(
                //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                //     suffixIcon: IconButton(
                //       onPressed: null,
                //       icon: Icon(Icons.calendar_today_outlined, color: Colors.grey,),
                //     ),
                //   ),
                // ),
                SizedBox(height: ConstVar.mediumspace,),





              ],
            ),
          ),

          SizedBox(height: ConstVar.largespace,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "CV",
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

                Row(
                  children: [
                    Expanded(
                      child: Text("Students will view this information on your profile to decide if you're a good fit for them.", style: TextStyle(fontSize: 16, color: Colors.black87),),
                    )
                  ],
                ),

                SizedBox(height: ConstVar.mediumspace,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade200, width:  1),
                    color: Colors.blue.shade50,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text(
                        "In order to protect your privacy, please do not share your personal information (email, phone number, social email, skype, etc) in your profile.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: ConstVar.mediumspace,),

                Text("Interests", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: null,
                  autofocus: false,
                  initialValue: '',
                  decoration: InputDecoration(
                    hintText: 'Interest, hobbies, memorable life experiences, or anything else you\'d like to share!',
                    hintMaxLines: 3,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: ConstVar.mediumspace,),

                Text("Education", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: null,
                  autofocus: false,
                  initialValue: '',
                  decoration: InputDecoration(
                    hintText: 'Example: \"Bachelor of Arts in English from Cambly University; Certified yoga instructor, Second Language Acquisition and Teaching  (SLAT) certificate from Cambly University\"',
                    hintMaxLines: 5,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: ConstVar.mediumspace,),

                Text("Experience", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: null,
                  autofocus: false,
                  initialValue: '',
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: ConstVar.mediumspace,),

                Text("Current or Previous Profession", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: null,
                  autofocus: false,
                  initialValue: '',
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: ConstVar.mediumspace,),

                Text("Current or Previous Profession", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Add new certificate",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.blue)
                        )
                    ),
                    backgroundColor:  MaterialStateProperty.all(Colors.white),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      color: Colors.grey.shade200,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(color: Colors.grey.shade400, width:  1)
                                  )
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    "Certificate Type",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(color: Colors.grey.shade400, width:  1)
                                  )
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    "Certificate",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    "Action",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No Data",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        )
                      ],
                    )
                  ],
                ),



              ],
            ),
          ),

          SizedBox(height: ConstVar.largespace,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Languages I speak",
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

                Text("Languages", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: null,
                  autofocus: false,
                  initialValue: '',
                  decoration: InputDecoration(
                    hintText: 'English, Vietnamese, Chinese, Korean',
                    hintMaxLines: 1,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: ConstVar.largespace,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Who I teach",
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


                SizedBox(height: ConstVar.mediumspace,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade200, width:  1),
                    color: Colors.blue.shade50,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text(
                        "This is the first thing students will see when looking for tutors.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: ConstVar.mediumspace,),

                Text("I am best at teaching students who are", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                Column(
                  children: [
                    RadioListTile(
                      title: Text("Beginner", style: TextStyle(fontSize: 16),),
                      value: "Beginner",
                      groupValue: level,
                      onChanged: (value){
                        setState(() {
                          level = value.toString();
                        });
                      },
                    ),

                    RadioListTile(
                      title: Text("Intermediate", style: TextStyle(fontSize: 16),),
                      value: "Intermediate",
                      groupValue: level,
                      onChanged: (value){
                        setState(() {
                          level = value.toString();
                        });
                      },

                    ),
                    RadioListTile(
                      title: Text("Advanced", style: TextStyle(fontSize: 16),),
                      value: "Advanced",
                      groupValue: level,
                      onChanged: (value){
                        setState(() {
                          level = value.toString();
                        });
                      },
                    ),


                  ],
                ),
                SizedBox(height: ConstVar.mediumspace,),

                Text("My specialties are", style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),),
                SizedBox(height: ConstVar.minspace,),
                Column(
                  children: ConstVar.type.map((type) => Container(
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                        )
                    ),
                    child: CheckboxListTile(
                      title: Text(type),
                      value: _selectedItems.contains(type),
                      onChanged: (val) => {
                        _itemChange(type, val!)
                      },
                    ),
                  )).toList(),
                ),
                SizedBox(height: ConstVar.mediumspace,),








              ],
            ),
          ),
          SizedBox(height: ConstVar.largespace,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/becometutor/videointroduction");
                },
                child: Text("Next", style: TextStyle(color: Colors.white, fontSize: 18)),
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
}