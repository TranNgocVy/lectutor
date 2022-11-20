import 'package:flutter/material.dart';
import 'package:lectutor/account/profile.dart';
import 'package:lectutor/auth/changePassWord.dart';
import 'package:lectutor/auth/forgetPassword.dart';
import 'package:lectutor/auth/login.dart';
import 'package:lectutor/auth/register.dart';
import 'package:lectutor/becomeatutor/approval.dart';
import 'package:lectutor/becomeatutor/completeProfile.dart';
import 'package:lectutor/becomeatutor/videointroduction.dart';
import 'package:lectutor/const/constVar.dart';
import 'package:lectutor/const/menu.dart';
import 'package:lectutor/course/courseDetail.dart';
import 'package:lectutor/course/courseList.dart';
import 'package:lectutor/course/topicdetail.dart';
import 'package:lectutor/schedule/scheduleHistory.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:lectutor/schedule/scheduleList.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lectutor/teacher/bookAClass.dart';
import 'package:lectutor/teacher/teacherDetail.dart';
import 'package:lectutor/teacher/teacherList.dart';
import 'package:lectutor/video/video.dart';

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
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LogIn(),
        '/register': (context) => Register(),
        '/account': (context) => Profile(),
        '/forgetpassword': (context) => ForgetPassword(),
        "/account/changepassword": (context) => ChangePassword(),
        '/menu': (context) =>Menu(),
        '/tutor': (context) => TeacherList(),
        '/tutor/detail': (context) => TeacherDetail(),
        '/tutor/detail/bookclass': (context) => BookAClass(),
        '/schedule': (context) => ScheduleList(),
        '/schedule/history': (context) => ScheduleHistory(),
        '/course': (context) => CourseList(),
        '/course/detail': (context) => CourseDetail(),
        '/course/detail/topic':(context) => TopicDetail(),
        '/video':(context) => Video(),
        '/becometutor/completeproflie': (context) => CompleteProfile(),
        '/becometutor/videointroduction': (context) => VideoIntroduction(),
        '/becometutor/approval': (context) => Approval(),

      },
    );
  }
}


