import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});



  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     title: 'Profile',
    //     home: Scaffold(
    //       // appBar: AppBar(title: const Text(_title)),
    //       resizeToAvoidBottomInset: false,
    //       body: ProfilePage(),
    //     )
    // );
    return TemplatePage.getHeader(context, ProfilePage());

  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  final FocusNode _ntFocus = FocusNode();
  String level = "Pre A1 (Beginner)";

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"),value: "USA"),
      DropdownMenuItem(child: Text("Canada"),value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
      DropdownMenuItem(child: Text("England"),value: "England"),
    ];
    return menuItems;
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      // borderOnForeground: true,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0,),
            decoration: BoxDecoration(
              border: Border.all( color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      child: Stack(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage('asset/icon/avatar.jpg'),
                              maxRadius: 40,
                            ),
                            Positioned(
                              right: 0.0,
                              bottom: 0.0,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue,
                                ),
                                child: Icon(
                                    // onPressed: null,
                                    // style: ButtonStyle(
                                    //   padding: MaterialStatePropertyAll(EdgeInsets.zero),
                                    // ),
                                      Icons.mode_edit_sharp,
                                      color: Colors.white,
                                      size: 20,
                                    // )
                                ),
                              ),
                            ),
                          ],

                      ),
                    ),
                    SizedBox(width: 10,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Name of lettutor",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Acount ID: 111111111",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),

                        SizedBox(height: ConstVar.mediumspace),



                        SizedBox(height: ConstVar.minspace),
                        Text(
                          "Others review you",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                SizedBox(height: ConstVar.largespace),

                Container(
                    padding: EdgeInsets.fromLTRB(5,10,0,10),
                    color: CupertinoColors.systemGrey5,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    )
                ),

                SizedBox(height: ConstVar.minspace),

                Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : createLabel("Name", true),
                    ),
                    new Expanded(
                      flex :2,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        initialValue: '',
                        decoration: InputDecoration(
                          hintText: 'Name of lectotur',
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ],


                ),

                SizedBox(height: ConstVar.minspace),

                Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : createLabel("Email Address", false),
                    ),
                    new Expanded(
                      flex :2,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        enabled: false,
                        initialValue: '',
                        decoration: InputDecoration(
                          hintText: 'Email address of lectotur',
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    // createLabel("Name", true),

                    // createLabel("Email Address", false),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   autofocus: false,
                    //   enabled: false,
                    //   initialValue: '',
                    //   decoration: InputDecoration(
                    //     hintText: 'Email address of lectotur',
                    //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    //   ),
                    // ),

                  ],


                ),

                SizedBox(height: ConstVar.minspace),

                Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : createLabel("Country", true),
                    ),
                    new Expanded(
                      flex :2,
                      child: TextFormField(
                        autofocus: false,
                        initialValue: '',
                        decoration: InputDecoration(
                          hintText: 'Nationality of lettutor',
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                    ),
                    // createLabel("Name", true),

                    // createLabel("Email Address", false),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   autofocus: false,
                    //   enabled: false,
                    //   initialValue: '',
                    //   decoration: InputDecoration(
                    //     hintText: 'Email address of lectotur',
                    //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    //   ),
                    // ),
                  ],
                ),

                SizedBox(height: ConstVar.mediumspace),

                Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : createLabel("Phone number", false),
                    ),
                    new Expanded(
                      flex :2,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        initialValue: '',
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'Phone number of lectotur',
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    // createLabel("Name", true),

                    // createLabel("Email Address", false),
                    // TextFormField(
                    //   keyboardType: TextInputType.text,
                    //   autofocus: false,
                    //   enabled: false,
                    //   initialValue: '',
                    //   decoration: InputDecoration(
                    //     hintText: 'Email address of lectotur',
                    //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                    //   ),
                    // ),
                  ],
                ),

                SizedBox(height: ConstVar.mediumspace),

                Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : createLabel("Birthday", true),
                    ),
                    new Expanded(
                      flex :2,
                      child: Container(
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
                      // child: TextFormField(
                      //   autofocus: false,
                      //   initialValue: '',
                      //   decoration: InputDecoration(
                      //     hintText: '2001-01-01',
                      //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      //     suffixIcon: IconButton(
                      //       onPressed: null,
                      //       icon: Icon(Icons.date_range_outlined),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ],
                ),

                SizedBox(height: ConstVar.mediumspace),

                Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : createLabel("My Level", true),
                    ),
                    Expanded(
                      flex :2,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder( //<-- SEE HERE
                            borderSide: BorderSide(color: Colors.grey, width: 1),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        value: level,
                        onChanged: (String? newValue) {
                          setState(() {
                            level = newValue!;
                          });
                        },
                        items: (ConstVar.levelList).map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Expanded(
                              child: Text(
                              value,
                            ),
                            )
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: ConstVar.mediumspace),

                Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : createLabel("Want to learn", true),
                    ),
                    new Expanded(
                      flex :2,
                      child: Focus(
                          focusNode: _ntFocus,
                          child: Listener(
                            onPointerDown: (_) {
                              FocusScope.of(context).requestFocus(_ntFocus);
                            },
                            child: DropdownSearch<String>.multiSelection(
                              items: ConstVar.type,
                              popupProps: PopupPropsMultiSelection.menu(
                                showSelectedItems: true,
                                showSearchBox: true,
                              ),
                              clearButtonProps: ClearButtonProps(
                                isVisible: false,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.zero,
                              ),
                              dropdownButtonProps: DropdownButtonProps(

                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 12),
                              ),
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: Colors.blue),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                              selectedItems: ['Business English', 'TOEIC'],
                              onChanged: (val) {
                                setState(() {
                                  _ntFocus.requestFocus();
                                });
                              },
                            ),
                          )
                      ),
                    ),

                  ],


                ),

                SizedBox(height: ConstVar.mediumspace),

                Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : createLabel("Learn Schedule", false),
                    ),
                    new Expanded(
                      flex :2,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        autofocus: false,
                        minLines: 3,
                        maxLines: null,
                        initialValue: '',
                        decoration: InputDecoration(
                          hintText: "Note the time of the week you want to study on Lettutor",
                          hintMaxLines: 3,
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),

                  ],


                ),

                SizedBox(height: ConstVar.mediumspace),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: null,
                      child: const Text(
                        'Save changes',
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
                  ],
                ),

                SizedBox(height: ConstVar.largespace),


              ],
            ),
          )
        ]
      // ),
    );
  }

  Container createLabel(String field, bool isRequired) {
    if (isRequired){
      return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "* ",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),

            new Expanded(
                child: Text(
                  field + ": ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
            ),
          ],
        ),

      );
    }
    else{
      return Container(
          padding: EdgeInsets.all(10),
          child: Text(
            field + ": ",
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )
      );
    }

  }
}