import 'package:lectutor/model/schedule.dart';

class Student{
  String _id;
  String _name;
  String _email;
  String _country;
  String _phone;
  String _dayOfBirth;
  String _level;
  List<String> _wantToLearn;
  int _balance;
  List<Schedule> _scheduleList;

  Student(this._id, this._name, this._email, this._country, this._phone,
      this._dayOfBirth, this._level, this._wantToLearn, this._balance,
      this._scheduleList);

  List<Schedule> get scheduleList => _scheduleList;

  set scheduleList(List<Schedule> value) {
    _scheduleList = value;
  }

  int get balance => _balance;

  set balance(int value) {
    _balance = value;
  }

  List<String> get wantToLearn => _wantToLearn;

  set wantToLearn(List<String> value) {
    _wantToLearn = value;
  }

  String get level => _level;

  set level(String value) {
    _level = value;
  }

  String get dayOfBirth => _dayOfBirth;

  set dayOfBirth(String value) {
    _dayOfBirth = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get country => _country;

  set country(String value) {
    _country = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}