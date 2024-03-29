import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lectutor/const/page.dart';
import '../const/constVar.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(24.0,),
            children: <Widget>[
              Image(image: AssetImage("asset/icon/background.png")),

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
                initialValue: '',
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
                initialValue: '',
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password...',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.visibility),
                  ),
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
                onPressed: (){
                  Navigator.pushNamed(context, '/tutor');
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
                  Ink(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: Image(
                      image: Svg('asset/icon/facebook.svg'),
                      width: 50,
                    ),
                  ),
                  SizedBox(width: ConstVar.mediumspace,),
                  Ink(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: Image(
                      image: Svg('asset/icon/google.svg'),
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