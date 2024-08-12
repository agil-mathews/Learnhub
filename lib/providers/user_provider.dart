import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:learnhub/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    // i
    name: '', 
    email: '', 
    phone: '',
    password: '',
    token: '',
    type: '',
  );


  User get user => _user;
  
  get userJson => null;

 

  void setUser(String user){
    try {
     if (kDebugMode) {
       print('Received user JSON: $user');
     }
    final userJson = jsonDecode(user);
    final userData = userJson['user']; // Access the nested "user" object
    if (kDebugMode) {
      print('User data: $userJson');
    }
     if (kDebugMode) {
       print('User data1: $userData');
     } // Log the retrieved user data
 // Log the retrieved user data
  // _user = User.fromJson(userJson);
  _user = User.fromJson(userData);
  _user.token = userJson['token']; // Accessing the `token` field from the root
  if (kDebugMode) {
    print(_user.token);
  }


    // if (userData != null) {
    //   _user = User.fromJson(userData);
    // } else {
    //   print('Error: User data is null'); // Log an error if missing
    // }
    if (kDebugMode) {
      print('Parsed User: $_user');
      
    }
        notifyListeners();
     
    } catch (e) {
      if (kDebugMode) {
        print('Error setting user: $e');
      }
    
    }
  }

  void setUserFromModel(User user){
    _user = user;
    notifyListeners();
  }
}