import 'package:lectutor/model/topics.dart';

class Courses{
  String _title;
  String _description;
  String _level;
  List<Topics> _topicList;

  Courses(this._title, this._description, this._level, this._topicList);

  List<Topics> get topicList => _topicList;

  set topicList(List<Topics> value) {
    _topicList = value;
  }

  String get level => _level;

  set level(String value) {
    _level = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}