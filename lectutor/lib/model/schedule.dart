class Schedule{
  String _day;
  String _start;
  String _end;
  String _status;
  int _teacherId;


  Schedule(this._day, this._start, this._end, this._status, this._teacherId);


  String get day => _day;

  set day(String value) {
    _day = value;
  }

  int get teacherId => _teacherId;

  set teacherId(int value) {
    _teacherId = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  String get end => _end;

  set end(String value) {
    _end = value;
  }

  String get start => _start;

  set start(String value) {
    _start = value;
  }
}