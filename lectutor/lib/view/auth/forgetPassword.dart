import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/pkg.dart';
import '../../handle/auth.dart';
import '../../model/language/provider.dart';
import '../const/constVar.dart';
import '../const/page.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});



  @override
  Widget build(BuildContext context) {
    // return TemplatePage.getHeader(context, ForgetPasswordPage());
    return TemplatePage(widget:  ForgetPasswordPage(), isLogin: false,);

  }
}

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});
  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();
  String error = "";
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;

    Pkg.getLanguage(languageProvider);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(24.0,),
              children: <Widget>[
                Text(
                  language.resetPassword,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: ConstVar.largespace),

                Text(
                  language.descriptionResetPassword,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: ConstVar.mediumspace),

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
                  onTap: (){
                    setState(() {
                      isError = false;
                      error = "";
                    });
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: language.enterYourEmail,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: ConstVar.minspace),

                if(isError)
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
                  onPressed: ()async{
                    if (emailController.text == ""){
                      setState(() {
                        isError = true;
                        error = language.pleaseEnterEmail;
                      });
                    }else{
                      var isSuccess = await forgotPassword(emailController.text);
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
                                isSuccess == true ? Icon(Icons.task_alt, color: Colors.greenAccent,):Icon(Icons.error, color: Colors.red,),
                                SizedBox(width: ConstVar.mediumspace,),
                                Text(language.notification),
                              ],
                            ),
                          ),
                          content: Text(isSuccess == true?language.forgotPasswordSuccess:language.forgotPasswordFail),
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
                                if (isSuccess == true){
                                  Navigator.pop(context);
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
                    language.confirmREsetPassword,
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