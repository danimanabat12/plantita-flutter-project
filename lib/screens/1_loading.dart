import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupSimulation(){
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        Navigator.popAndPushNamed(context, '/welcome');
      });
    });
  }

  @override
  void initState(){
    super.initState();
    setupSimulation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: kMain60,
     body: SafeArea(
       child: Center(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.0,
              width: 100.0,
              child: ImageIcon(
                AssetImage('assets/logo/logo.png'),
              ),
            ), 
            SizedBox(height: 10.0),
            Text(
              'Plantita.ph',
              style: TextStyle(
                color: kSecondary30, 
                fontSize: 50.0, 
                fontFamily: 'Roboto Thin',
              )
            ),
            SizedBox(height: 100.0),
            SpinKitRing(
              color: kSecondary30,
              size: 50.0,
            ),
          ],
          )
       ),
     ),
    );
  }
}