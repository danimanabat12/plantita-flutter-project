import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/screens/1_loading.dart';
import 'package:dani_miniproject/screens/2_welcome.dart';
import 'package:dani_miniproject/screens/3_login.dart';
import 'package:dani_miniproject/screens/4_signup.dart';
import 'package:dani_miniproject/screens/5_homescreen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/welcome',

    routes: {
      '/': (context) => Loading(),
      '/welcome': (context) => Welcome(),
      '/login': (context) => Login(), 
      '/signup': (context) => Signup(), 
      '/home': (context) => Home(),
    }

  ));
}