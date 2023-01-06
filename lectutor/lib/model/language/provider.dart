import 'package:flutter/cupertino.dart';
import 'english.dart';
import 'language.dart';

class LanguageProvider extends ChangeNotifier {
  Language _language = English();


  set language(Language lang) {
    _language = lang;
    notifyListeners();
  }

  Language get language => _language;
}