import 'package:flutter/material.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});



  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, ForgetPasswordPage());

  }
}

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});
  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {


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
                  'Reset Password',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: ConstVar.largespace),

                Text(
                  'Please enter your email address to search for your account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: ConstVar.mediumspace),

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

                SizedBox(height: ConstVar.largespace),

                ElevatedButton(
                  onPressed: null,
                  child: const Text(
                    'Send reset link',
                    style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  style: ButtonStyle(
                    // backgroundColor: Colors.blue,
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                  ),
                ),
              ]),
        ],
      ),
      // ),
    );
  }
}