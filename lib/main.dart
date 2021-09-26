import 'package:dani_miniproject/screens/5.2_tempscreen.dart';
import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/screens/1_loading.dart';
import 'package:dani_miniproject/screens/2_welcome.dart';
import 'package:dani_miniproject/screens/3_login.dart';
import 'package:dani_miniproject/screens/4_signup.dart';
import 'package:dani_miniproject/screens/5_homescreen.dart';
import 'package:dani_miniproject/screens/6_tempscreen2.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',

    routes: {
      '/': (context) => Loading(),
      '/welcome': (context) => Welcome(),
      '/login': (context) => Login(), 
      '/signup': (context) => Signup(), 
      '/home': (context) =>  Home(),
      '/shopping-cart': (context) => ShoppingCart(),
    },
    builder: EasyLoading.init(),

  ));
}