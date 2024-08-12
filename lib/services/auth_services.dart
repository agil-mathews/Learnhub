import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnhub/models/user.dart';
import 'package:learnhub/pages/login.dart';
import 'package:learnhub/providers/course_provider.dart';
import 'package:learnhub/utils/utils.dart';
import 'package:learnhub/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';

class AuthService {
  void signUpUser({
    required  context,
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      User user = User(
        name: name,
        email: email,
        phone: phone,
        password: password,
        token: '',
        type: '',
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // if (!context.mounted) return;

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          if (!context.mounted) return;
          showSnackBar(context, 'Account Created');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyLogin()),
          );
        },
      );
    } catch (e) {
      
        showSnackBar(context, e.toString());
      
      if (kDebugMode) {
        print("error: $e");
      }
    }
  }

  void signInUser({
    required BuildContext context,
    required String? email,
    required String? password,
  }) async {
    try {
      if (email == null || password == null) {
        throw Exception('Email or password is null');
      }

      var userProvider = Provider.of<UserProvider>(context, listen: false);
      // final navigator = Navigator.of(context);

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (kDebugMode) {
        print('signin function');
      }

      // if (!context.mounted) return;

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          // if (!context.mounted) return;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);
          if (kDebugMode) {
            print(res.body);
          }
          log(res.body);

          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        },
      );
    } catch (e) {
      
        showSnackBar(context, e.toString());
      
      if (kDebugMode) {
        print("error: $e");
      }
    }
  }

  void getUserData(BuildContext context) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (kDebugMode) {
        print('token : $token');
      }
      

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('${Constants.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );
      log(tokenRes.body);

      var response = jsonDecode(tokenRes.body);
      
      // log(response);

      if (response == true) {   
        http.Response userRes = await http.get(
          Uri.parse('${Constants.uri}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );
        
          
          log(userRes.body);
          userProvider.setUser(userRes.body);
        
      }
    } catch (e) {
      
        // ignore: use_build_context_synchronously
        showSnackBar(context, e.toString());
      
      if (kDebugMode) {
        print("error: $e");
      }
    }
  }

  void signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    if (kDebugMode) {
      print('signout function:');
    }
    String? token = prefs.getString('x-auth-token');
     if (kDebugMode) {
       print(token);
     }
    
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MyLogin()),
        (route) => false,
      );
    
  }

  Future<void> getAllCourses(
    BuildContext context,
  ) async{
    try {
      var courseProvider = Provider.of<CourseProvider>(context, listen: false);
      
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/home'),
        headers: <String, String>{
          'Content-Type':'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        var resBody =  res.body;
     
      log('res.body: $resBody');
      if (kDebugMode) {
        print('Response size: ${resBody.length} bytes');
      }

       // Log the response body to see if it gets cut off at some point
    // for (int i = 0; i < resBody.length; i += 100) {
    //   if (kDebugMode) {
    //     print(resBody.substring(i, i + 100 > resBody.length ? resBody.length : i + 100));
    //   }
    // }

      courseProvider.setCourse(res.body);
      } else {
         log('Failed to load courses. Status code: ${res.statusCode}');
      }
      


    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
      if (kDebugMode) {
        print("error: $e");
      }
    }
  }
}
