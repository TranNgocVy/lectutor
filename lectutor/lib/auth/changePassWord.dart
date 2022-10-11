import 'package:flutter/material.dart';
import '../const/constVar.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Change password',
        home: Scaffold(
          // appBar: AppBar(title: const Text(_title)),
          resizeToAvoidBottomInset: false,
          body: ChangePasswordPage(),
        )
    );
  }
}

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends State<ChangePasswordPage> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Card(

        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all( color: Colors.grey, width: 1),
            // borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0,),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Text(
                  "Change password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              SizedBox(height: ConstVar.mediumspace),

              Row(
                children: <Widget>[
                  new Expanded (
                    flex:1,
                    child : createLabel("Password"),
                  ),
                  new Expanded(
                    flex :2,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      initialValue: '',
                      obscureText: true,
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
                    child : createLabel("New password"),
                  ),
                  new Expanded(
                    flex :2,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      initialValue: '',
                      obscureText: true,
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
                    child : createLabel("Confirm password"),
                  ),
                  new Expanded(
                    flex :2,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      initialValue: '',
                      obscureText: true,
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
                      'Change password',
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
          // ),
        ),
      ),
    );

  }

  Container createLabel(String field) {
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
}