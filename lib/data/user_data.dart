import 'dart:convert';

import 'package:quiz_app/Model/user.dart';
import 'package:collection/collection.dart';
//import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static List<User> _users = [];

  static int generateUserId() {
    // Ensure unique ID generation (e.g., using a counter or a GUID generator)
    // Implement your logic here
    return _users.length + 1; // Basic example for now
  }

  static void addUser(User user) {
    if (user != null) {
    _users.add(user);
  } else {
    // Handle the case where the user is null (log an error or display a message)
    print('Error: User object is null');
  }
    //_users.add(user);
    //_saveUsersToPreferences();
  }

  static User? getUserByEmail(String email) {
    return _users.firstWhereOrNull((user) => user.email == email);
  }

  static Future<User?> getLoggedInUser() async {
    // Here's an example assuming you store a logged-in user ID (replace with your approach)
    final int? loggedInUserId = await SharedPreferences.getInstance()
        .then((prefs) => prefs.getInt('logged_in_user_id'));
    if (loggedInUserId != null) {
      return _users.firstWhereOrNull((user) => user.id == loggedInUserId);
    } else {
      return null; // No logged-in user found
    }
  }

  static Future<void> setLoggedInUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('logged_in_user_id', user.id);
  }

  static void updateUser(User user) {
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
     // _saveUsersToPreferences();
    } else {
      // Handle the case where the user to update is not found (log an error or throw an exception)
      print('Error: User not found for update (ID: ${user.id})');
    }
  }

 
}
