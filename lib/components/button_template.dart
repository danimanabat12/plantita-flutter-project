import 'dart:ffi';

import 'package:flutter/material.dart'; 

class buttonTemplate extends StatelessWidget {

  final String? buttonType;
  final String? text; 
  final VoidCallback? press;
  final Color? bg_color, textColor;
  final dynamic sized_width;

  const buttonTemplate({
    this.buttonType,
    this.sized_width,
    this.text,
    this.press, 
    this.bg_color, 
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (buttonType == 'ElevatedButton') {
      return Container(
      width: size.width*sized_width,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ElevatedButton(
          onPressed: press,
          child: Text(
            text as String,
            style: TextStyle(
              fontSize: 15.0, 
              fontFamily: 'Roboto Light',
              color: textColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: bg_color, 
          ),
        ),
      ),
    );
    }
    else {
      return Container(
      width: size.width*sized_width,
      height: 50,
      child: ClipRRect(
        child: ElevatedButton(
          onPressed: press,
          child: Text(
            text as String,
            style: TextStyle(
              fontSize: 15.0, 
              fontFamily: 'Roboto Light',
              color: textColor,
            ),
          ),
           style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Color(0xfff3ebe1), width: 2.0))),
           ),
        ),
      ),
    );
    }
  }
}