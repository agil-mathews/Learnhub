import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:learnhub/models/course.dart';

class CourseProvider extends ChangeNotifier {
  List<Course> _courses = [];

  List<Course> get course => _courses;

  void setCourse(String course) {
    try {
      log('Received courses JSON: $course');
      final courseJson = jsonDecode(course);

      // Access the nested list of courses
      final courseListJson = courseJson['allcourses'] as List<dynamic>; // Cast to List<dynamic>

      log('all courses data: $courseListJson');

      // Map each item in the list to a Course object
      List<Course> courses =
          courseListJson.map((json) => Course.fromJson(json)).toList();
      log('courses list: $courses');

      _courses = courses; // Assuming you have a list _courses to hold the courses;

      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error setting courses: $e');
      }
    }
  }

  void setCourseFromModel(Course course) {
    _courses = _courses;
    notifyListeners();
  }
}
