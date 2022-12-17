import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lectutor/handle/auth.dart';
import '../../model/auth.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class Register extends StatelessWidget {
  const Register({super.key});



  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, RegisterPage());

  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisiblePassword = false;
  bool isValid = true;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(24.0,),
          children: <Widget>[
            Text(
              'Start learning with Lutors',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: ConstVar.largespace),

            Text(
              'Become fluent faster through one on one video chat lessons tailored to your goals.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(height: ConstVar.largespace),

            Text(
              'EMAIL',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: ConstVar.minspace),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              controller: emailController,
              onTap: () {
                setState(() {
                  isValid = true;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your email...',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),

            SizedBox(height: ConstVar.mediumspace),

            Text(
              'PASSWORD',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: ConstVar.minspace),

            TextFormField(
              autofocus: false,
              obscureText: !isVisiblePassword,
              controller: passwordController,
              onTap: () {
                setState(() {
                  isValid = true;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your password...',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      isVisiblePassword = !isVisiblePassword;
                    });
                  },
                  icon: isVisiblePassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                ),
              ),
            ),

            SizedBox(height: ConstVar.mediumspace),
            if(!isValid)
              Container(
                padding: EdgeInsets.fromLTRB(0,12, 0,0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    SizedBox(width: ConstVar.minspace,),
                    Text(
                      error,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    )
                  ],

                ),
              ),
            SizedBox(height: ConstVar.mediumspace),

            ElevatedButton(
              onPressed: ()async {
                if(emailController.text == "" || emailController.text == ""){
                  setState(() {
                    isValid = false;
                    error = "Please input all fields";
                  });
                }
                else{
                  var data = await register(Auth(emailController.text, passwordController.text));
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
                            data != null ? Icon(Icons.task_alt, color: Colors.greenAccent,):Icon(Icons.error, color: Colors.red,),
                            SizedBox(width: ConstVar.mediumspace,),
                            Text('Notification'),
                          ],
                        ),
                      ),
                      content: Text(data != null?'You have successfully registered an account. Please await admin to active your account':"You have failed to register for an account. Try again"),
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
                            if (data != null){
                              Navigator.popUntil(context,ModalRoute.withName('/'));
                            }
                          },
                          child: const Text('Ok', style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  );
                }


              },
              child: const Text(
                'SIGN UP',
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

            SizedBox(height: ConstVar.largespace),

            Text(
              'Or continue with?',
              style: TextStyle(color: Colors.black, fontSize: 14),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: ConstVar.mediumspace),

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.facebook_sharp),
                    color: Colors.blue,
                    iconSize: 50,
                    onPressed: () {},

                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.facebook_outlined),
                    // color: Colors.white,
                    iconSize: 50,
                    onPressed: () {},
                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.phone_android),
                    // color: Colors.white,
                    iconSize: 50,
                    onPressed: () {},
                  ),
                ),

              ],
            ),

            SizedBox(height: ConstVar.mediumspace),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(text: ' Log in',
                        style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {

                            Navigator.pop(context);
                          }
                    )
                  ]
              ),
              // loginButton,
              // forgotLabel
            )
          ]),

      // ),
    );
  }
}