import 'package:dani_miniproject/models/myUser.dart';
import 'package:dani_miniproject/screens/wrapper.dart';
import 'package:dani_miniproject/screens/authentication_screens/welcome.dart';
import 'package:dani_miniproject/screens/authentication_screens/login.dart';
import 'package:dani_miniproject/screens/authentication_screens/signup.dart';
import 'package:dani_miniproject/screens/home_screens/homescreen.dart';
import 'package:dani_miniproject/screens/home_screens/tempscreen2.dart';
import 'package:dani_miniproject/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<myUser?>.value(
      catchError: (_, __) => null, 
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      
        routes: {
          '/welcome': (context) => Welcome(),
          '/login': (context) => Login(), 
          '/signup': (context) => Signup(), 
          '/home': (context) =>  Home(),
          '/temp': (context) => TempScreen2(),
        },
        builder: EasyLoading.init(),
      
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}