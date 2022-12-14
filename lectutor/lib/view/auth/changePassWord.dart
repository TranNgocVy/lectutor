import 'package:flutter/material.dart';
import 'package:lectutor/config/const.dart';
import 'package:lectutor/handle/auth.dart';
import 'package:provider/provider.dart';
import '../../model/tokens.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class ChangePassword extends StatelessWidget {
    const ChangePassword({super.key});



  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, ChangePasswordPage());

  }
}

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends State<ChangePasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isTrue = true;
  String error = "";
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
                      obscureText: true,
                      onTap: () {
                        setState(() {
                          isTrue = true;
                        });
                      },
                      controller: passwordController,
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
                      obscureText: true,
                      onTap: () {
                        setState(() {
                          isTrue = true;
                        });
                      },
                      controller: newPasswordController,
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
                      controller: confirmPasswordController,
                      obscureText: true,
                      onTap: () {
                        setState(() {
                          isTrue = true;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),

                ],


              ),

              SizedBox(height: ConstVar.mediumspace),
              isTrue == false ? Container(
                // padding: EdgeInsets.all(10),
                child: Text(error, style: TextStyle(color: Colors.red),),
              ):
              SizedBox(height: 0,),
              SizedBox(height: ConstVar.mediumspace),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: ()async{
                      if (passwordController.text == "" || newPasswordController.text == "" || confirmPasswordController.text == ""){
                        setState(() {
                          isTrue = false;
                          error = "Please input all fields";
                        });
                      }
                      else{
                        if (passwordController.text.length < 6 || newPasswordController.text.length < 6 || confirmPasswordController.text.length < 6){
                          setState(() {
                            isTrue = false;
                            error = "Field's length must be at least 6 characters";
                          });
                        }
                        else{
                          if(newPasswordController.text != confirmPasswordController.text){
                            setState(() {
                              isTrue = false;
                              error = "New password must be the same as the Confirmation password";
                            });
                          }else{
                            var message = await changePasword(passwordController.text, newPasswordController.text, Const.token);

                            if (message == true){
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
                                        Icon(Icons.task_alt, color: Colors.greenAccent,),
                                        SizedBox(width: ConstVar.mediumspace,),
                                        Text('Notification'),
                                      ],
                                    ),
                                  ),
                                  content: Text('You have successfully changed password. Please log in with new password'),
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
                                        Navigator.popUntil(context,ModalRoute.withName('/'));

                                      },
                                      child: const Text('Ok', style: TextStyle(color: Colors.white),),
                                    ),
                                  ],
                                ),
                              );
                            }
                            else{
                              setState(() {
                                isTrue = false;
                                error = "Incorrect password";
                              });
                            }

                          }

                        }
                      }

                    },
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