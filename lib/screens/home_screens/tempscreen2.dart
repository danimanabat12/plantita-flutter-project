import 'package:flutter/material.dart'; 
import 'package:dani_miniproject/constants.dart';

class TempScreen2 extends StatefulWidget {
  const TempScreen2({ Key? key }) : super(key: key);

  @override
  _TempScreen2State createState() => _TempScreen2State();
}

class _TempScreen2State extends State<TempScreen2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMain60,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Shopping cart',
            style: TextStyle(
            fontFamily: 'Playfair Display', 
            fontSize: 25.0,
            color: kSecondary30,
          ),
        ),
        iconTheme: IconThemeData(
          color: kSecondary30, //change your color here
        ),
        backgroundColor: kMain60,
        shape: Border(bottom: BorderSide(color: kSecondary30, width: 1)),
      ),

      body: Center(
        child: Text('Things are being built as of this moment'),
      ),
    );
  }
}

