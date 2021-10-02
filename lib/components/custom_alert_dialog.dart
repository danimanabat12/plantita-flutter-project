import 'package:dani_miniproject/components/button_template.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/services/auth.dart';
import 'package:flutter/material.dart';

class CustomAlertDialogue extends StatefulWidget {
  CustomAlertDialogue({
    Key? key,
    required AuthService auth,
    required this.loading,
    required this.title,
    required this.leadingActionTitle,
    required this.secondaryActionTitle,
    required this.leadingOnChanged, 
    required this.secondaryOnChanged,
  }) : _auth = auth, super(key: key);

  final AuthService _auth;
  bool loading;
  String title;
  String leadingActionTitle; 
  String secondaryActionTitle; 
  Future<void> Function() leadingOnChanged;
  void Function() secondaryOnChanged;

  @override
  State<CustomAlertDialogue> createState() => _CustomAlertDialogueState();
}

class _CustomAlertDialogueState extends State<CustomAlertDialogue> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto Thin',
              fontWeight: FontWeight.bold,
              color: kSecondary30,
              fontSize: 25.0,
            ),
          ),
        ),
        backgroundColor: kMain60,
        actions: [
          Align(
            alignment: Alignment.center,
            child: buttonTemplate (
                buttonType: 'ElevatedButton',
                sized_width: 0.6,
                text: widget.leadingActionTitle,
                press: widget.leadingOnChanged,
                bg_color: kAccent,
                textColor: kMain60,
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: widget.secondaryOnChanged,
              child: Text(
                widget.secondaryActionTitle,
                style: TextStyle(
                  fontFamily: 'Roboto Thin',
                  fontWeight: FontWeight.bold,
                  color: kAccent,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
    );
  }
}