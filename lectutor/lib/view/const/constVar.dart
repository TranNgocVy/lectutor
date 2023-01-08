import 'package:lectutor/model/topic/learnTopic.dart';
import 'package:lectutor/model/level/level.dart';
import 'package:lectutor/model/testPreparation/testPreparation.dart';

import '../../model/topic/topic.dart';
class ConstVar{
  static double minspace = 6;
  static double mediumspace = 12;
  static double largespace = 24;

  static String URL = "https://sandbox.api.lettutor.com/";
  static String meetServer = "https://meet.lettutor.com";
  static List<String> type = [
    "English for Kids",
    "Business English",
    "Conversational English",
    "STARTERS",
    "MOVERS",
    "FLYERS",
    "KET",
    "PET",
    "IELTS",
    "TOEFL",
    "TOEIC",
  ];

  static List<Level> levelList = [
    Level("0", "Any Level", "Non (Any Level)", ""),
    Level("1", "Beginner", "Pre A1 (Beginner)", "BEGINNER"),
    Level("2", "Higher Beginner", "A1 (Higher Beginner)", "HIGHER_BEGINNER"),
    Level("3", "Pre-Intermediate", "A2 (Pre-Intermediate)", "PRE_INTERMEDIATE"),
    Level("4", "Intermediate", "B1 (Intermediate)", "INTERMEDIATE"),
    Level("5", "Upper-Intermediate", "B2 (Upper-Intermediate)", "UPPER_INTERMEDIATE"),
    Level("6", "Advanced", "C1 (Advanced)", "ADVANCED"),
    Level("7", "Proficiency", "C2 (Proficiency)", "PROFICIENCY")
  ];

  static List<String> levelStringList = [
    "Non (Any Level)",
    "Pre A1 (Beginner)",
    "A1 (Higher Beginner)",
    "A2 (Pre-Intermediate)",
    "B1 (Intermediate)",
    "B2 (Upper-Intermediate)",
    "C1 (Advanced)",
    "C2 (Proficiency)",
  ];


  // static Map<String, String> levelMap = {
  //   "BEGINNER": "Pre A1 (Beginner)",
  //   "HIGHER_BEGINNER" : "A1 (Higher Beginner)",
  //   "PRE_INTERMEDIATE" : "A2 (Pre-Intermediate)",
  //   "INTERMEDIATE" : "B1 (Intermediate)",
  //   "UPPER_INTERMEDIATE" : "B2 (Upper-Intermediate)",
  //   "ADVANCED" :  "C1 (Advanced)",
  //   "PROFICIENCY" : "C2 (Proficiency)",
  //
  // };

  static List<String> reasonCancel = ["Reschedule at another time", "Busy at that time", "Asked by the tutor", "Other"];

  static List<LearnTopic> topicList = [LearnTopic(3, "english-for-kids", "English for Kids"), LearnTopic(4, "business-english", "Business English"), LearnTopic(6, "conversational-english",  "Conversational English")];
  static List<TestPreparation> testPreparationList = [
    TestPreparation(1, "starters", "STARTERS"),
    TestPreparation(2, "movers", "MOVERS"),
    TestPreparation(3, "flyers", "FLYERS"),
    TestPreparation(4, "ket", "KET"),
    TestPreparation(5, "pet", "PET"),
    TestPreparation(6, "ielts", "IELTS"),
    TestPreparation(7, "toefl", "TOEFL"),
    TestPreparation(8, "toeic", "TOEIC"),
  ];


  static List<String> tutornationalityList = ["Foreign Tutor", "Vietnamese Tutor", "Native English Tutor"];


}