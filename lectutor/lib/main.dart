import 'package:flutter/material.dart';
import 'package:lectutor/model/bookingInfo.dart';
import 'package:lectutor/model/token.dart';
import 'package:lectutor/model/tokens.dart';
import 'package:lectutor/model/tutorDetail.dart';
import 'package:lectutor/model/user.dart';
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
import 'package:provider/provider.dart';

import 'model/argument.dart';
import 'model/walletInfo.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => User("", "", "", "", "", "", [], "", "", false, WalletInfo("", "", "", false, DateTime.now(), DateTime.now(), 0), [], "", "", [], [], 0, "", false)),
      ChangeNotifierProvider(create: (_) => Tokens(Token("", DateTime.now()), Token("", DateTime.now()))),

    ],
    child: const MyApp(),
  ));

  // runApp(const MyApp());
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
        '/forgetpassword': (context) => ForgetPassword(),
        "/account/changepassword": (context) => ChangePassword(),
        '/menu': (context) =>Menu(),
        '/tutor': (context) => TeacherList(),

        // '/tutor/detail/bookclass': (context) => BookAClass(),
        // '/schedule': (context) => ScheduleList(),
        // '/schedule/history': (context) => ScheduleHistory(),
        '/course': (context) => CourseList(),
        '/course/detail': (context) => CourseDetail(),
        '/course/detail/topic':(context) => TopicDetail(),
        '/video':(context) => Video(),
        '/becometutor/completeproflie': (context) => CompleteProfile(),
        '/becometutor/videointroduction': (context) => VideoIntroduction(),
        '/becometutor/approval': (context) => Approval(),

      },
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == '/tutor/detail') {
          final args = settings.arguments as TutorDetail;
          return MaterialPageRoute(
            builder: (context) {
              return TeacherDetail(
                tutorDetail: args,
              );
            },
          );
        }
        else {
          if(settings.name == "/account"){
            final args = settings.arguments as User;
            return MaterialPageRoute(
              builder: (context) {
                return Profile(
                  user: args,
                );
              },
            );
          }
          else {
            if(settings.name == "/schedule/history"){
              final args = settings.arguments as ScheduleArg;
              return MaterialPageRoute(
                builder: (context) {
                  return ScheduleHistory(
                    historyScheduleArg: args,
                  );
                },
              );
            }
            else {
              if(settings.name == "/schedule"){
                final args = settings.arguments as ScheduleArg;
                return MaterialPageRoute(
                  builder: (context) {
                    return ScheduleList(
                      scheduleArg: args,
                    );
                  },
                );
              }
              else{
                if(settings.name == "/tutor/detail/bookclass"){
                  final args = settings.arguments as BookingLessonArg;
                  return MaterialPageRoute(
                    builder: (context) {
                      return BookAClass(
                        bookingLessonArg: args,
                      );
                    },
                  );
                }
              }
            }
          }
        }
        // The code only supports
        // PassArgumentsScreen.routeName right now.
        // Other values need to be implemented if we
        // add them. The assertion here will help remind
        // us of that higher up in the call stack, since
        // this assertion would otherwise fire somewhere
        // in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      // onGenerateRoute: (settings){
      //   if (settings.name == '/tutor'){
      //     User user = settings.arguments as User;
      //     return MaterialPageRoute(builder: (context) => TeacherList(user: user,));
      //     // return MaterialPageRoute(builder: (context) => User(
      //     //   user.id,
      //     //   user.email,
      //     //   user.name,
      //     //   user.avatar,
      //     //   user.country,
      //     //   user.phone,
      //     //   user.roles,
      //     //   user.language,
      //     //   user.birthday,
      //     //   user.isActivated,
      //     //   user.walletInfo,
      //     //   user.courses,
      //     //   user.requireNote,
      //     //   user.level,
      //     //   user.learnTopics,
      //     //   user.testPreparations,
      //     //   // user.isPhoneActivivated,
      //     //   user.timezone,
      //     //   user.studySchedule,
      //     //   user.canSendMessage
      //     // ));
      //   }
      // }
      // ,
    );
  }
}




