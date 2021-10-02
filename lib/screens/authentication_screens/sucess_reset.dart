import 'package:dani_miniproject/components/button_template.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/screens/authentication_screens/reset_password.dart';
import 'package:flutter/material.dart';

class CheckEmailPrompt extends StatelessWidget {
  const CheckEmailPrompt({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kMain60,
      appBar:AppBar(
        backgroundColor: kMain60,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kSecondary30, //change your color here
        ),
      ),
      body: Stack(
        children:[
          Column(
          children: [
            Container(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.14,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kAccent,
                      ),
                      child: Center(
                        child: Icon(Icons.email, size: 50.0, color: Colors.white)
                      )
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        'Check your mail',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto Thin',
                          // fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: kAccent,
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        'We have sent a password recover instructions to your email. Make sure to check your spam folders.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto Regular',
                          fontSize: 15.0,
                          color: kSecondary30,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    buttonTemplate (
                      buttonType: 'ElevatedButton',
                      sized_width: 0.6, 
                      text: 'Got it',
                      press: () {
                        //redirect to welcome.
                        Navigator.of(context).popAndPushNamed('/welcome');
                      },
                      bg_color: kAccent,
                      textColor: kMain60,
                    ),
                  ]
                ),
              ),
            ),
          ],
        ),
          Positioned(
            bottom: 20.0,
            child: Container(
              // Para ma-center. Big brain
              width: size.width * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Did not receive the email? ',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: kSecondary30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPassword()));
                    },
                    child: Text(
                      'Try another email address',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: kAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ] 
      ),
    );
  }
}