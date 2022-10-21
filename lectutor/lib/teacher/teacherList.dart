import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:lectutor/const/choicechip.dart';
import 'package:lectutor/const/page.dart';
import 'package:lectutor/model/teacher.dart';
import 'package:time_range_picker/time_range_picker.dart';
import '../const/constVar.dart';
import '../const/specialtieschoiceschip.dart';


class TeacherList extends StatelessWidget {
  const TeacherList({super.key});


  @override
  Widget build(BuildContext context) {
    return TemplatePage.getHeader(context, TeacherListPage());

  }
}

class TeacherListPage extends StatefulWidget {
  const TeacherListPage({super.key});
  @override
  State<TeacherListPage> createState() => _TeacherListPage();
}

class _TeacherListPage extends State<TeacherListPage> {

  final FocusNode _ntFocus = FocusNode();
  final TextEditingController _dController = TextEditingController();
  final FocusNode _dFocus = FocusNode();
  final TextEditingController _tController = TextEditingController();
  final FocusNode _tFocus = FocusNode();
  final FocusNode _tgFocus = FocusNode();

  List<ChoiceChipData> specialtiesChoiceChips = SpecialtiesChoiceChips.getSpecialties(ConstVar.type, false);

  TimeOfDay initS = TimeOfDay(hour: 7, minute: 0);
  TimeOfDay initE = TimeOfDay(hour: 8, minute: 0);
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      setState(() {
        _dController.text = "${selectedDate.toLocal()}".split(' ')[0];
        _dFocus.requestFocus();
      });
    }
    else if (picked == selectedDate) {
      return;
    }
    else {
      setState(() {
        _dController.clear();
        selectedDate = DateTime.now();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // return Container(
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(10,30,10,10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Column>[
                  Column(
                    children: <Widget>[
                      const Text(
                        "Upconming lesson",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: ConstVar.mediumspace),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Fri, 30 Sep 22 18:30 - 18:55',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(text: ' (start in 65:65:51)',
                                style: TextStyle(color: Colors.yellow, fontSize: 12),
                                // recognizer: TapGestureRecognizer()
                                //   ..onTap = () {}
                              )
                            ]
                        ),
                        // loginButton,
                        // forgotLabel
                      ),
                      SizedBox(height: ConstVar.minspace),
                      ElevatedButton.icon(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                          ),
                        // style: ElevatedButton.styleFrom(
                        //   shape: RoundedRectangleBorder(borderRadius: );
                        // ),

                        icon: Icon(Icons.video_library, size: 20,color: Colors.blue,),
                        label: Text(
                          'Enter lesson room',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                          ),
                        ),
                        onPressed: null,
                      ),
                      SizedBox(height: ConstVar.minspace),
                      const Text(
                        "Total lesson is 1 hours 15 minutes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ]
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Find a tutor",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: ConstVar.mediumspace),

                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        initialValue: '',
                        decoration: InputDecoration(
                          hintText: 'Enter tutor name ...',
                          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                        ),
                      ),
                      SizedBox(height: ConstVar.minspace),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Focus(
                            focusNode: _ntFocus,
                            child: Listener(
                              onPointerDown: (_) {
                                FocusScope.of(context).requestFocus(_ntFocus);
                              },
                              child: DropdownSearch<String>.multiSelection(
                                items: ConstVar.tutornationalityList,
                                popupProps: PopupPropsMultiSelection.menu(
                                  showSelectedItems: true,
                                  showSearchBox: true,
                                ),
                                clearButtonProps: ClearButtonProps(
                                  isVisible: true,
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.zero,
                                ),
                                dropdownButtonProps: DropdownButtonProps(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(right: 12),
                                ),
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1, color: Colors.blue),
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                    ),
                                    hintText: 'Select tutor nationnality',
                                  ),
                                ),
                                // selectedItems: ['Item1', 'Item2'],
                                onChanged: (val) {
                                  setState(() {
                                    _ntFocus.requestFocus();
                                  });
                                },
                              ),
                            )
                        ),
                      ),


                      // Container(
                      //   margin: EdgeInsets.only(bottom: 10),
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.text,
                      //     focusNode: _nFocus,
                      //     controller: _nController,
                      //     decoration: InputDecoration(
                      //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(width: 1, color: Colors.grey),
                      //         borderRadius: BorderRadius.all(Radius.circular(50)),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(width: 1, color: Colors.blue),
                      //         borderRadius: BorderRadius.all(Radius.circular(50)),
                      //       ),
                      //       hintText: 'Enter tutor name',
                      //     ),
                      //     onTap: () {
                      //       setState(() {
                      //         _nFocus.requestFocus();
                      //       });
                      //     },
                      //   ),
                      // ),

                      SizedBox(height: ConstVar.minspace),
                      Text(
                        "Select availiable tutoring time:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: ConstVar.minspace),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          focusNode: _dFocus,
                          controller: _dController,
                          autovalidateMode: AutovalidateMode.always,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            hintText: 'Select a day',
                            suffixIcon: (_dController.text.isNotEmpty && _dFocus.hasFocus) ?
                            IconButton(onPressed: () {setState(() {
                              _dController.clear();
                              selectedDate = DateTime.now();
                              _dFocus.unfocus();
                            });}, icon: Icon(Icons.clear)) :
                            Icon(Icons.calendar_month_outlined),
                          ),
                          readOnly: true,
                          onTap: () => _selectDate(context),
                        ),
                      ),
                      SizedBox(height: ConstVar.minspace),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _tController,
                          focusNode: _tFocus,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            hintText: 'Time range',
                            suffixIcon: (_tController.text.isNotEmpty && _tFocus.hasFocus) ?
                            IconButton(
                                onPressed: ()
                                {
                                  setState(()
                                  {
                                    _tController.clear();
                                    initS = TimeOfDay(hour: 7, minute: 0);
                                    initE = TimeOfDay(hour: 8, minute: 0);
                                    _tFocus.unfocus();
                                  });
                                }, icon: Icon(Icons.clear)) :
                            Container(
                                width: 42,
                                child: Center(
                                  child: SizedBox(
                                    width: 21,
                                    height: 21,
                                    child: Icon(Icons.access_time_rounded, color: _tFocus.hasFocus ? Colors.blue : Colors.grey,),
                                  ),
                                )
                            ),
                          ),
                          readOnly: true,
                          onTap: () async {
                            TimeRange? result = await showTimeRangePicker(
                              context: context,
                              strokeWidth: 4,
                              timeTextStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                              activeTimeTextStyle: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 26,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                              ticks: 12,
                              ticksOffset: 2,
                              ticksLength: 8,
                              handlerRadius: 8,
                              ticksColor: Colors.grey,
                              rotateLabels: false,
                              interval: const Duration(minutes: 30),
                              minDuration: const Duration(minutes: 30),
                              labels: [
                                "24 h",
                                "3 h",
                                "6 h",
                                "9 h",
                                "12 h",
                                "15 h",
                                "18 h",
                                "21 h"
                              ].asMap().entries.map((e) {
                                return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
                              }).toList(),
                              // disabledTime: TimeRange(
                              //     startTime: const TimeOfDay(hour: 0, minute: 0),
                              //     endTime: const TimeOfDay(hour: 7, minute: 0)),
                              disabledColor: Colors.red,
                              labelOffset: 30,
                              padding: 55,
                              labelStyle: const TextStyle(fontSize: 18, color: Colors.grey,),
                              start: initS,
                              end: initE,
                              clockRotation: 180.0,
                            );
                            if (result != null)  {
                              var sh = result.startTime.hour > 9 ? result.startTime.hour.toString() : ('0' + result.startTime.hour.toString());
                              var sm = result.startTime.minute > 9 ? result.startTime.minute.toString() : ('0' + result.startTime.minute.toString());
                              var eh = result.endTime.hour > 9 ? result.endTime.hour.toString() : ('0' + result.endTime.hour.toString());
                              var em = result.endTime.minute > 9 ? result.endTime.minute.toString() : ('0' + result.endTime.minute.toString());
                              setState(() {
                                _tController.text = sh + ':' + sm + ' --> ' + eh + ':' + em;
                                _tFocus.requestFocus();
                                initS = TimeOfDay(hour: result.startTime.hour, minute: result.startTime.minute);
                                initE = TimeOfDay(hour: result.endTime.hour, minute: result.endTime.minute);
                              });
                            }
                            else if (result == null) setState(() {
                              _tController.clear();
                              initS = TimeOfDay(hour: 0, minute: 0);
                              initE = TimeOfDay(hour: 0, minute: 0);
                              _tFocus.requestFocus();
                            });
                          },
                        ),
                      ),
                      SizedBox(height: ConstVar.minspace),

                      Wrap(
                        runSpacing: 5,
                        spacing: 5,
                        children: specialtiesChoiceChips.map((value) => ChoiceChip(
                          label: Text(value.label),
                          selected: value.isSelected,
                          selectedColor: Colors.blue.shade100,
                          focusNode: _tgFocus,
                          labelStyle: TextStyle(
                            fontSize: 15,
                          ),
                          onSelected: (isSltd) => setState(() {
                            _tgFocus.requestFocus();
                            value.isSelected = value.isSelected?false: true;
                          }),
                        )).toList(),
                      ),

                      SizedBox(height: ConstVar.mediumspace),

                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     hintText: "1345",
                      //   ),
                      // )
                      // TextField(
                      //   // keyboardType: TextInputType.text,
                      //   autofocus: false,
                      //   // initialValue: '',
                      //   decoration: InputDecoration(
                      //     hintText: 'Enter tutor name...',
                      //     hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                      //     // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      //   ),
                      // ),
                      // TextFormField(
                      //   keyboardType: TextInputType.text,
                      //   autofocus: false,
                      //   initialValue: '',
                      //   obscureText: true,
                      //   decoration: InputDecoration(
                      //     hintText: 'Select tutor nationality',
                      //     hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                      //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      //     suffixIcon: IconButton(
                      //       onPressed: null,
                      //       icon: Icon(Icons.visibility),
                      //     ),
                      //   ),
                      // ),
                      // Row(
                      //   children: <TextFormField>[
                      //     TextFormField(
                      //       keyboardType: TextInputType.text,
                      //       autofocus: false,
                      //       initialValue: '',
                      //       decoration: InputDecoration(
                      //         hintText: 'Enter tutor name...',
                      //         hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                      //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      //       ),
                      //     ),
                      //     TextFormField(
                      //       keyboardType: TextInputType.text,
                      //       autofocus: false,
                      //       initialValue: '',
                      //       obscureText: true,
                      //       decoration: InputDecoration(
                      //         hintText: 'Select tutor nationality',
                      //         hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                      //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                      //         suffixIcon: IconButton(
                      //           onPressed: null,
                      //           icon: Icon(Icons.visibility),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // )
                      // Row(
                      //   children: <Widget>[
                      //     getElevatedButton("All", selected: true),
                      //     getElevatedButton("English for kids"),
                      //     getElevatedButton("English for business"),
                      //     getElevatedButton("Conversational"),
                      //     getElevatedButton("STARTERS"),
                      //     getElevatedButton("MOVERS"),
                      //     getElevatedButton("FLYRS"),
                      //     getElevatedButton("KET"),
                      //     getElevatedButton("PET"),
                      //     getElevatedButton("IELTS"),
                      //     getElevatedButton("TOEFL"),
                      //     getElevatedButton("TOEIC"),
                      //   ],
                      // ),


                      // ElevatedButton(
                      //   onPressed: null,
                      //   child: Text(
                      //     "Reset Filters",
                      //     style: TextStyle(
                      //       color: Colors.blue,
                      //       fontSize: 16,
                      //     ),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     // backgroundColor: Colors.white,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(50),
                      //         side: BorderSide(
                      //           color: Colors.blue,
                      //           style: BorderStyle.solid,
                      //         )
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: ConstVar.largespace, bottom: ConstVar.minspace),
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey,),
                      ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Text>[
                      Text(
                        "Recommended Tutors",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: getTutorList([Teacher(1, "Keengan", "France", "Description about him",[], [], ["English for kids", "English for Business", "Conversational", "STARTERS",]),
                    Teacher(1, "Keengan", "France", "Description about him", [], [], ["Conversational", "STARTERS", "MOVERS", "FLYERS", "KET", "PET",])])
                )
              ],
            )
          ),
          // ),
        ],
      ),
    );
    // mainAxisSize: MainAxisSize.max,

    // );
    
  }



  Container getElevatedButton(String txt, {bool selected = false}){
    Container btn = Container(
      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: ElevatedButton(
        onPressed: null,
        child: Text(
          txt,
          style: TextStyle(
            color: selected? Colors.blue:Colors.grey,
            fontSize: 14,
          ),
        ),
        style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );

    return btn;
  }
  List<Widget> getTutorList(List<Teacher> teachetList){
    List<Widget> list = [];
    bool isFavorite = false;

    for(var i = 0; i < teachetList.length; i++){
      list.add(
          Card(
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
                    // onTap: (){
                    //   Navigator.pushNamed(context, '/tutor/detail');
                    // },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: CircleAvatar(
                              backgroundImage: AssetImage('asset/icon/avatar.jpg'),
                              maxRadius: 30,
                            ),
                        ),
                        SizedBox(width: 10,),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                teachetList[i].name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Image(image: Svg("asset/icon/nationality.svg"),width: 30,)
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      teachetList[i].natioonality,
                                      style: TextStyle(
                                          fontSize: 14
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Icon>[
                                  Icon(Icons.star, color: Colors.yellow, size: 15,),
                                  Icon(Icons.star, color: Colors.yellow, size: 15,),
                                  Icon(Icons.star, color: Colors.yellow, size: 15,),
                                  Icon(Icons.star, color: Colors.yellow, size: 15,),
                                  Icon(Icons.star, color: Colors.yellow, size: 15,),

                                ],
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
                                      onPressed: () => {
                                        setState(() {
                                          isFavorite = isFavorite ? false: true;

                                        })
                                      },
                                      icon: Icon(
                                        isFavorite? Icons.favorite_border : Icons.favorite,
                                        color: isFavorite? Colors.blue: Colors.red,
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
                      runSpacing: 2,
                      spacing: 5,
                      children: SpecialtiesChoiceChips.getSpecialties(teachetList[i].specialtyList, true).map((value) => ChoiceChip(
                        label: Text(value.label,),
                        selected: value.isSelected,
                        selectedColor: Colors.blue.shade100,
                        focusNode: _tgFocus,
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                        ),
                        // onSelected: (isSltd) => setState(() {
                        //   _tgFocus.requestFocus();
                        //   value.isSelected = value.isSelected?false: true;
                        // }),
                      )).toList(),
                    ),

                  ),

                  Container(
                    child: Text(
                      teachetList[i].description,
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
                          'Book',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                          ),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, '/tutor/detail');
                        },

                      ),
                    ],
                  )
                ],
              ),
            ),

          )
      );
    }
    return list;
  }

}

