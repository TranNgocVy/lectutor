import 'package:flutter/material.dart';
import 'package:lectutor/model/argument.dart';
import 'package:lectutor/model/bookingInfo.dart';
import 'package:lectutor/view/const/page.dart';
import 'package:provider/provider.dart';
import '../../config/const.dart';
import '../../handle/schedule.dart';
import '../../handle/user.dart';
import '../../model/user.dart';
import '../const/constVar.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, MenuPage(), isMenu: true);
  }

}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  @override
  State<MenuPage> createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
    // String name = ;

    return Container(
      color: Colors.grey.shade200,
      child: ListView(
        children: [
          GestureDetector(
            onTap: () async {

              var data = await getUserInfo(Const.token);
              if (data != null){
                Navigator.pop(context);
                User user = User.fromJson(data);
                print(user.name);
                Navigator.pushNamed(context, "/account", arguments: user);
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage('${context.watch<User>().avatar}'),
                  ),
                  SizedBox(width: ConstVar.mediumspace,),

                  Text(
                    "${context.watch<User>().name}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/account");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.bookmark_add_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: ConstVar.minspace,),

                  Text(
                    "Buy Lessons",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/account/changepassword");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.key_sharp,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: ConstVar.minspace,),

                  Text(
                    "Change password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/tutor");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.account_box_rounded,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: ConstVar.minspace,),

                  Text(
                    "Tutor",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async{
              ScheduleArg scheduleArg = await getUpcomingClass(Const.token, 1);
              Navigator.pop(context);
              Navigator.pushNamed(context, "/schedule", arguments: scheduleArg);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: ConstVar.minspace,),

                  Text(
                    "Schedule",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async{
              ScheduleArg historyscheduleArg = await getStudentBookedClass(Const.token, 1);
              Navigator.pop(context);
              Navigator.pushNamed(context, "/schedule/history", arguments: historyscheduleArg);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.history,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: ConstVar.minspace,),

                  Text(
                    "History",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/course");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.class_,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: ConstVar.minspace,),

                  Text(
                    "Course",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/account");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.menu_book_sharp,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: ConstVar.minspace,),

                  Text(
                    "My course",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/becometutor/completeproflie");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.account_box_sharp,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: ConstVar.minspace,),

                  Text(
                    "Become a tutor",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.logout,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: ConstVar.minspace,),

                  Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );}
}