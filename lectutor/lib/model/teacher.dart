import 'package:lectutor/model/courses.dart';
import 'package:lectutor/model/schedule.dart';

class Teacher{
  int _id;
  String _name;
  String _natioonality;
  String _description;
  List<Courses> _courseList;
  List<Schedule> _scheduleList;
  List<String> _specialtyList;



  Teacher(this._id, this._name, this._natioonality, this._description,
      this._courseList, this._scheduleList, this._specialtyList);


  List<String> get specialtyList => _specialtyList;

  set specialtyList(List<String> value) {
    _specialtyList = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  List<Schedule> get scheduleList => _scheduleList;

  set scheduleList(List<Schedule> value) {
    _scheduleList = value;
  }

  List<Courses> get courseList => _courseList;

  set courseList(List<Courses> value) {
    _courseList = value;
  }

  String get natioonality => _natioonality;

  set natioonality(String value) {
    _natioonality = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}