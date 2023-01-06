import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lectutor/handle/auth.dart';
import 'package:provider/provider.dart';
import '../../config/pkg.dart';
import '../../model/auth.dart';
import '../../model/language/provider.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class Register extends StatelessWidget {
  const Register({super.key});



  @override
  Widget build(BuildContext context) {
    // return TemplatePage.getHeader(context, RegisterPage());
    return TemplatePage(widget:  RegisterPage(), isLogin: false,);

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
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;

    Pkg.getLanguage(languageProvider);
    return Center(
      child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(24.0,),
          children: <Widget>[
            Text(
              language.titleSignUp,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: ConstVar.largespace),

            Text(
              language.descriptionSignup,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(height: ConstVar.largespace),

            Text(
              language.email,
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
                hintText: language.enterYourEmail,
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),

            SizedBox(height: ConstVar.mediumspace),

            Text(
              language.password,
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
                hintText: language.enterPassword,
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
                    error = language.emptyField;
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
                            Text(language.notification),
                          ],
                        ),
                      ),
                      content: Text(data != null? language.signupSuccess:language.signupFail),
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
                          child: Text(language.back, style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  );
                }


              },
              child: Text(
                language.signUp,
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
              language.continueWith,
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
                  text: language.hasAccountSignUp,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: <TextSpan>[
                    TextSpan(text: ' ${language.login}',
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