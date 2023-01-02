import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lectutor/model/course.dart';
import 'package:lectutor/model/tokens.dart';
import 'package:lectutor/model/auth.dart';
import 'package:lectutor/model/user.dart';
import 'package:provider/provider.dart';
import '../../handle/auth.dart';
import '../const/constVar.dart';
import 'package:dio/dio.dart';

import '../const/page.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, LogInPage(), isLogin: false);

  }

}

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisiblePassword = false;
  bool isValid = true;
  String error = "";


  void handleSingInFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final String? accessToken = result.accessToken!.token;
      if (accessToken != null) {
        print("\n\nlogin by facebook\n");
        // try {
        //   // await AuthService.loginWithFacebook(accessToken, authProvider, widget.callback);
        // } catch (e) {
        //   showTopSnackBar(context, CustomSnackBar.error(message: "Login failed! ${e.toString()}"),
        //       showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
        // }
      }
    } else {
      // showTopSnackBar(context, const CustomSnackBar.error(message: "Something went wrong!"),
      //     showOutAnimationDuration: const Duration(milliseconds: 1000), displayDuration: const Duration(microseconds: 4000));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(24.0,),
            children: <Widget>[
              Image(image: AssetImage("assets/icon/background.png")),

              Text(
                'Say hello to your English tutors',
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
                // initialValue: '',
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
                controller: passwordController,
                obscureText: !isVisiblePassword,
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/forgetpassword");
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                ),
              ),



              SizedBox(height: ConstVar.minspace),

              ElevatedButton(
                onPressed: () async{
                  if(emailController.text == "" || passwordController.text == ""){
                    setState(() {
                      isValid = false;
                      error = "Please input all fields";
                    });
                  }
                  else{
                    Auth auth = new Auth(emailController.text, passwordController.text);
                    final data = await login(auth);

                    setState((){
                      if (data != false) {
                        isValid = true;

                        // for (final String key in data["user"].keys) {
                        //   if (data["user"][key] is Null){
                        //     data["user"][key] = "";
                        //   }
                        // }
                        User user = User.fromJson(data["user"]);
                        Tokens tokens = Tokens.fromJson(data["tokens"]);
                        context.read<User>().update(user);
                        context.read<Tokens>().update(tokens);
                        print(tokens.access.token);

                        Navigator.pushNamed(context, '/tutor');
                      }
                      else {
                        isValid = false;
                        error = "Log in failed! Incorrect email or password";
                      }
                    });
                  }


                },
                child: const Text(
                  'LOG IN',
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
                  GestureDetector(
                    child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: Image(
                        image: Svg('assets/icon/facebook.svg'),
                        width: 50,
                      ),

                    ),
                    onTap: handleSingInFacebook,
                  ),
                  SizedBox(width: ConstVar.mediumspace,),
                  Ink(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: Image(
                      image: Svg('assets/icon/google.svg'),
                      width: 50,
                    ),
                  ),
                  SizedBox(width: ConstVar.mediumspace,),
                  Ink(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(side:BorderSide(color: Colors.blueAccent, width: 2)),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(3),
                        child: Icon(
                          Icons.phone_android,
                          size: 40,
                        ),
                      )
                  ),

                ],
              ),

              SizedBox(height: ConstVar.mediumspace),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Not a member yet?',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(text: ' Sign up',
                          style: TextStyle(color: Colors.blueAccent, fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/register');

                            }
                      )
                    ]
                ),
                // loginButton,
                // forgotLabel
              )
            ]),
      ),

    );
  }
}