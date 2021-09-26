import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';

class AccountCheck extends StatelessWidget {
  final bool? login; 
  final VoidCallback? press; 

  const AccountCheck({
    Key? key,
    this.login,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login as bool ? "Don't have an account? " : "Already have an account? ", 
          style: TextStyle(color: kSecondary30),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login as bool ? "Sign Up" : "Sign In",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kSecondary30,
            ),
          ),
        ),
      ],
    );
  }
}

