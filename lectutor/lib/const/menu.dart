import 'package:flutter/material.dart';
import 'package:lectutor/const/page.dart';
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
    return Container(
      color: Colors.grey.shade200,
      child: ListView(
        children: [
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
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/icon/avatar.jpg'),
                  ),
                  SizedBox(width: ConstVar.mediumspace,),

                  Text(
                    "Name of lettutor",
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
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/schedule");
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
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/schedule/history");
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