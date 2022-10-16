import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const/constVar.dart';
import '../const/header.dart';

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
    return Header.getHeader(context, ProfilePage());

  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      // borderOnForeground: true,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(24.0,),
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
                    Stack(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle_outlined,
                          size: 120,
                        ),
                        Positioned(
                          right: 5.0,
                          bottom: 0.0,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue,
                            ),
                            child: IconButton(
                                onPressed: null,

                                icon: Icon(
                                  Icons.mode_edit_sharp,
                                  color: Colors.white,
                                )
                            ),
                          ),
                        ),
                      ],
                    ),

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
                      child: TextFormField(
                        autofocus: false,
                        initialValue: '',
                        decoration: InputDecoration(
                          hintText: '2001-01-01',
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.date_range_outlined),
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
                      child : createLabel("My Level", true),
                    ),
                    new Expanded(
                      flex :2,
                      child: TextFormField(
                        autofocus: false,
                        initialValue: '',
                        decoration: InputDecoration(
                          hintText: 'C1',
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
                      child : createLabel("Want to learn", true),
                    ),
                    new Expanded(
                      flex :2,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        initialValue: '',
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),

                  ],


                ),

                SizedBox(height: ConstVar.mediumspace),

                Row(
                  children: <Widget>[
                    new Expanded (
                      flex:1,
                      child : createLabel("Study Schedule", false),
                    ),
                    new Expanded(
                      flex :2,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        autofocus: false,
                        initialValue: '',
                        decoration: InputDecoration(
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