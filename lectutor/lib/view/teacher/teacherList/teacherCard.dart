
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';
import '../../../config/pkg.dart';
import '../../../handle/teacher.dart';
import '../../../model/language/provider.dart';
import '../../../model/schedule/schedule.dart';
import '../../../model/user/tokens.dart';
import '../../../model/tutor/tutor.dart';
import '../../../model/tutor/tutorDetail.dart';
import '../../const/constVar.dart';
import '../../const/specialtieschoiceschip.dart';

// class TeacherCard extends StatelessWidget {
//   const TeacherCard({super.key});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'View review',
//         home: Scaffold(
//           // appBar: AppBar(title: const Text(_title)),
//           resizeToAvoidBottomInset: false,
//           body: ReviewPage(),
//         )
//     );
//   }
// }

class TeacherCard extends StatefulWidget {
  final Tutor tutor;
  final   List<Tutor>  favoriteTutorList;

  const TeacherCard({super.key, required this.tutor, required this.favoriteTutorList});
  @override
  State<TeacherCard> createState() => _TeacherCard();

}

class _TeacherCard extends State<TeacherCard> {
  late Tutor  tttttttttttttttttttttttttttt;
  List<Tutor>  favoriteTutorList = [];
  final FocusNode _tgFocus = FocusNode();

  @override
  void initState() {
    tttttttttttttttttttttttttttt = widget.tutor;
    favoriteTutorList = widget.favoriteTutorList;
  }


  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final language = languageProvider.language;
    Pkg.getLanguage(languageProvider);

    final tokenProvider = Provider.of<Tokens>(context);
    final token = tokenProvider.access.token;

    List<String> specialtyList = tttttttttttttttttttttttttttt.specialties.toString().split(",");
    String alias = "";
    List<String> nameSplit = tttttttttttttttttttttttttttt.name.toString().split(" ");
    for(int i = 0; i < nameSplit.length && i < 2; i++){
      alias = alias + nameSplit[i][0];
    }

    return Card(
      borderOnForeground: true,
      elevation: 3,
      shadowColor: Colors.grey.shade100,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap:  ()  async {
                late TutorDetail tutorDetail;
                List<Schedule> schedules = [];

                var data = await  TeacherService.getTeacherDetail(token, tttttttttttttttttttttttttttt.userId.toString());
                print(data);
                if (data != null){
                  tutorDetail = TutorDetail.fromJson(data);
                }
                tutorDetail.feedlist = tttttttttttttttttttttttttttt.feedbacks!;
                print(tutorDetail.User.id);

                Navigator.pushNamed(context, '/tutor/detail', arguments: tutorDetail);

              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: tttttttttttttttttttttttttttt.avatar != null?
                    CircleAvatar(
                      // backgroundImage: ,
                      backgroundImage: NetworkImage(tttttttttttttttttttttttttttt.avatar.toString()),
                      // backgroundImage: NetworkImage('${context.watch<User>().avatar}'),
                      // maxRadius: 30,
                    ):
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade200,
                      child: Text(
                        alias,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tttttttttttttttttttttttttttt.name.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Image(image: Svg("assets/icon/nationality.svg"),width: 30,)
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                tttttttttttttttttttttttttttt.country.toString(),
                                style: TextStyle(
                                    fontSize: 14
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: Pkg.getRating(tttttttttttttttttttttttttttt.rating),
                        )
                      ],
                    ),
                  ),

                  Container(
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: <IconButton>[
                            IconButton(
                              onPressed: ()async {
                                int index = isContain(tttttttttttttttttttttttttttt, favoriteTutorList);
                                var data = await TeacherService.addFavoriteTeacher(token, tttttttttttttttttttttttttttt.userId.toString());
                                if (data == 1){
                                  setState(() {
                                    favoriteTutorList.removeAt(index);
                                  });
                                }
                                else {
                                  setState(() {
                                    favoriteTutorList.add(Tutor.fromJson(data));
                                  });

                                }

                              },
                              icon: isContain(tttttttttttttttttttttttttttt, favoriteTutorList) != -1 ? Icon( Icons.favorite,
                                color:  Colors.red,
                                size: 30,
                              ) :  Icon( Icons.favorite_border,
                                color:  Colors.blue,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),


            Container(
              child: Wrap(
                runSpacing: 5,

                spacing: 5,
                children: SpecialtiesChoiceChips.getSpecialties(specialtyList, true).map((value) => ChoiceChip(
                  label: Text(value.label,),

                  selected: value.isSelected,
                  selectedColor: Colors.blue.shade100,
                  focusNode: _tgFocus,
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black
                  ),
                )).toList(),
              ),

            ),

            Container(
              child: Text(
                tttttttttttttttttttttttttttt.bio.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,

              children: <Widget>[
                ElevatedButton.icon(

                  // style: const ButtonStyle(
                  //   backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                  //
                  // ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(
                          width: 1,
                          color: Colors.blue
                      ),
                    ),
                  ),

                  icon: Icon(Icons.calendar_month_sharp, size: 20,color: Colors.blue,),
                  label: Text(
                    language.book,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                    ),
                  ),
                  onPressed: ()async{
                    late TutorDetail tutorDetail;
                    List<Schedule> schedules = [];

                    var data = await  TeacherService.getTeacherDetail(token, tttttttttttttttttttttttttttt.userId.toString());
                    if (data != null){
                      tutorDetail = TutorDetail.fromJson(data);
                    }
                    tutorDetail.feedlist = tttttttttttttttttttttttttttt.feedbacks!;
                    print(tutorDetail.User.id);

                    Navigator.pushNamed(context, '/tutor/detail', arguments: tutorDetail);
                  },

                ),
              ],
            )
          ],
        ),
      ),

    );



  }



  int isContain(Tutor tutor, List<Tutor> favoriteList){
    for(int i = 0; i < favoriteList.length; i++){
      if (tutor.userId == favoriteList[i].userId || tutor.userId == favoriteList[i].firstId || tutor.userId == favoriteList[i].secondId ){
        return i;
      }
    }
    return -1;
  }

}