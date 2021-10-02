import 'package:dani_miniproject/constants.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text; 
  final Icon icon;

  CustomDialogBox(
    {
       Key? key, 
       required this.title,
       required this.descriptions, 
       required this.text,
       required this.icon,
    }
  ) : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      child: contentBox(context),
    );
  }
  contentBox(context) {
  // The stack shows the last element on the top.
  return Container(
    padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      color: kMain60,
      borderRadius: BorderRadius.circular(20),
      boxShadow : [
        BoxShadow(color: Colors.black, offset: Offset(0,10),
        blurRadius: 5),
      ]
    ),
    child: Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: widget.icon,
          ),
          SizedBox(height: 10),
          Text(
            widget.title,
            style: TextStyle(
                fontFamily: 'Roboto Regular',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kSecondary30,
              ),
            ),
          SizedBox(height: 20),
          Text(
            widget.descriptions,
            style: TextStyle(
              fontSize: 14,
              color: kSecondary30,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 16,
                      color: kAccent,
                    ),
                  )
                ),
          ),
        ],
      ),
    ),
  );
}
}

