import 'package:flutter/material.dart';
import 'package:lectutor/account/profile.dart';
import 'package:lectutor/auth/changePassWord.dart';
import 'package:lectutor/auth/forgetPassword.dart';
import 'package:lectutor/auth/login.dart';
import 'package:lectutor/auth/register.dart';
import 'package:lectutor/teacher/teacherDetail.dart';
import 'package:lectutor/teacher/teacherList.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lettutor',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: TeacherDetail(),
      // home: Profile(),

    );
  }
}
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//     title: 'Show/Hide password TextField in Flutter',
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//     home: MyHomePage(),
//   );
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   bool _isVisible = false;
//
//   void updateStatus() {
//     setState(() {
//       _isVisible = !_isVisible;
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Show/Hide password TextField"),
//       ),
//       body: Center(
//         child: Form(
//           child: TextFormField(
//             keyboardType: TextInputType.text,
//             // controller: textEditingController,
//             obscureText: _isVisible ? false : true,
//             inputFormatters: [
//               FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
//             ],
//
//             decoration: InputDecoration(
//               hintText: "Enter password",
//               suffixIcon: IconButton(
//                 onPressed: () => updateStatus(),
//                 icon:
//                 Icon(_isVisible ? Icons.visibility : Icons.visibility_off),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
