import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/models/product.dart';
import 'package:learnhub/utils/constants.dart';

class AdminService {
  
  void deletePendings(String? name) async{
    log(name!);
    // print(name);

    final res = await http.delete(
      Uri.parse('${Constants.uri}/deleteCourse/$name'),
      headers: {'Content-Type': 'application/json'},
    );
    if (kDebugMode) {
      print(res.statusCode);
    }
     if (res.statusCode == 200) {
    // Success
    if (kDebugMode) {
      print('Course deleted successfully.');
    }
    // Optionally, show a toast message using Fluttertoast:
    Fluttertoast.showToast(
      msg: 'Course deleted!',
      toastLength: Toast.LENGTH_SHORT,
    );
  } else {
    // Error
    if (kDebugMode) {
      print('Error deleting row: ${res.statusCode}');
    }
    // Handle the error appropriately (e.g., show a toast with error message)
  }

  }

  //function to add course
  void addCourse(Product course) async{
    try {
      if (kDebugMode) {
        print(course);
      }
      if (kDebugMode) {
        print('courseID:${course.Courseid}');
      }
      http.Response res = await http.post(
         Uri.parse('${Constants.uri}/addcourse'),
         headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'Courseid': course.Courseid,
          'name': course.name,
          'description': course.description,
          'videoPath': course.videoPath,
          'userName': course.userName,
          'price': course.price,
          'requirements': course.requirements,
          'brief': course.brief,
          'category': course.category,
          'imagePath': course.imagePath,
          
        }),
      );
      if (res.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        if (kDebugMode) {
          print('Course accepted successfully.');
        }
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to accept course.');
      }
      
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }



  }


  
  
}

