import 'package:flutter/material.dart';
import '../const/constVar.dart';

class Register extends StatelessWidget {
  const Register({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sign up',
        home: Scaffold(
          // appBar: AppBar(title: const Text(_title)),
          resizeToAvoidBottomInset: false,
          body: RegisterPage(),
        )
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView(
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

                ElevatedButton(
                  onPressed: null,
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
                          style: TextStyle(color: Colors.blueAccent, fontSize: 14),
                          // recognizer: TapGestureRecognizer()
                          //   ..onTap = () {}
                        )
                      ]
                  ),
                  // loginButton,
                  // forgotLabel
                )
              ]),
        ],
      ),
      // ),
    );
  }
}