import 'package:flutter/material.dart';
import 'package:dani_miniproject/models/myUser.dart';
import 'package:dani_miniproject/screens/authentication_screens/welcome.dart';
import 'package:dani_miniproject/screens/home_screens/homescreen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<myUser?>(context); 
    if (user == null) {
      return Welcome();
    }
    else return Home();
  }
}
