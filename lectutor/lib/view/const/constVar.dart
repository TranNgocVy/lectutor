import 'package:lectutor/model/learnTopic.dart';
import 'package:lectutor/model/testPreparation.dart';

import '../../model/topic.dart';

class ConstVar{
  static double minspace = 6;
  static double mediumspace = 12;
  static double largespace = 24;

  static String URL = "https://sandbox.api.lettutor.com/";
  static List<String> type = [
    "English for kids",
    "English for Business",
    "Conversational",
    "STARTERS",
    "MOVERS",
    "FLYERS",
    "KET",
    "PET",
    "IELTS",
    "TOEFL",
    "TOEIC",
  ];

  static List<String> levelList = [
    "Pre A1 (Beginner)",
    "A1 (Higher Beginner)",
    "A2 (Pre-Intermediate)",
    "B1 (Intermediate)",
    "B2 (Upper-Intermediate)",
    "C1 (Advanced)",
    "C2 (Proficiency)",
  ];
  static Map<String, String> levelMap = {
    "BEGINNER": "Pre A1 (Beginner)",
    "HIGHER_BEGINNER" : "A1 (Higher Beginner)",
    "PRE_INTERMEDIATE" : "A2 (Pre-Intermediate)",
    "INTERMEDIATE" : "B1 (Intermediate)",
    "UPPER_INTERMEDIATE" : "B2 (Upper-Intermediate)",
    "ADVANCED" :  "C1 (Advanced)",
    "PROFICIENCY" : "C2 (Proficiency)",

  };

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