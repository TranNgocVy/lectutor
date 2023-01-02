import 'package:dio/dio.dart';
import 'package:lectutor/model/category.dart';

import '../view/const/constVar.dart';

class CourseService {
  static Future<dynamic> getCourselist(String token,  int page, int size, { List<int> level = const [], List<String> categoryId = const [], String orderBy = ""}) async {
    var dio = Dio();

    try{
      // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
      dio.options.headers["Authorization"] = "Bearer ${token}";
      dio.options.headers["Content-type"] = "application/json";
      String url = ConstVar.URL + 'course?page=$page&size=$size';

      if (level.isNotEmpty) {
        level.forEach((element) {
          url += "&level[]=${element}";
        });

      }

      if (categoryId.isNotEmpty) {
        categoryId.forEach((element) {
          url += "&categoryId[]=$element";
        });

      }

      if (orderBy.isNotEmpty) {
        url += "&orderBy[]=$orderBy";
      }
      var response = await dio.get(url);

      if(response.statusCode == 200){
        return response.data;
      }
    }catch(e){
      print(e);
    }
    return null;

  }

  static Future<List<Category>> getCategorylist(String token) async{
    var dio = Dio();
    List<Category> list = [];
    try{
      // dio.options.headers["Authorization"] = "Bearer ${context.watch<Tokens>().access.token}";
      dio.options.headers["Authorization"] = "Bearer ${token}";
      dio.options.headers["Content-type"] = "application/json";
      var response = await dio.get("${ConstVar.URL}content-category");

      if(response.statusCode == 200){
        int count = response.data["count"];
        for(int i = 0 ;i < count; i++){
          list.add(Category.fromJson(response.data["rows"][i]));
        }
        return list;
      }
    }catch(e){
      print(e);
    }
    return list;
  }

  // static Future<List<CourseCategory>> getAllCourseCategories(String token) async {
  //   final response = await http.get(
  //     Uri.parse("$url/content-category"),
  //     headers: {
  //       "Authorization": "Bearer $token",
  //       "Content-type": "application/json",
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final res = json.decode(response.body);
  //     final courses = res["rows"] as List;
  //     final arr = courses.map((e) => CourseCategory.fromJson(e)).toList();
  //     return arr;
  //   } else {
  //     throw Exception('Cannot get list courses');
  //   }
  // }
  //
  // static getCourseById(String courseId, String token) async {
  //   final response = await http.get(
  //     Uri.parse("$url/course/$courseId"),
  //     headers: {
  //       "Authorization": "Bearer $token",
  //       "Content-type": "application/json",
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final res = json.decode(response.body);
  //     final course = Course.fromJson(res["data"]);
  //     return course;
  //   } else {
  //     throw Exception('Cannot get course');
  //   }
  // }
}