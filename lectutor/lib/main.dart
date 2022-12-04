import 'package:flutter/material.dart';
import 'package:lectutor/view/account/profile.dart';
import 'package:lectutor/view/auth/changePassWord.dart';
import 'package:lectutor/view/auth/forgetPassword.dart';
import 'package:lectutor/view/auth/login.dart';
import 'package:lectutor/view/auth/register.dart';
import 'package:lectutor/view/becomeatutor/approval.dart';
import 'package:lectutor/view/becomeatutor/completeProfile.dart';
import 'package:lectutor/view/becomeatutor/videointroduction.dart';
import 'package:lectutor/view/const/menu.dart';
import 'package:lectutor/view/course/courseDetail.dart';
import 'package:lectutor/view/course/courseList.dart';
import 'package:lectutor/view/course/topicdetail.dart';
import 'package:lectutor/view/schedule/scheduleHistory.dart';
import 'package:lectutor/view/schedule/scheduleList.dart';
import 'package:lectutor/view/teacher/bookAClass.dart';
import 'package:lectutor/view/teacher/teacherDetail.dart';
import 'package:lectutor/view/teacher/teacherList.dart';
import 'package:lectutor/view/video/video.dart';

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


