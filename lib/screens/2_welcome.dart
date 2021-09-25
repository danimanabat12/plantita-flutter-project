import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/components/button_template.dart';

class Welcome extends StatelessWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgrounds/welcome_bg.png'),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 30.0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text (
                          'Welcome to',
                          style: TextStyle(
                            color: kMain60, 
                            fontSize: 25.0,
                            fontFamily: 'Roboto thin', 
                          ),
                        ),
                        Text (
                          'Plantita.ph!',
                          style: TextStyle(
                            color: kMain60,
                            fontSize: 50.0, 
                            fontFamily: 'Playfair Display',
                          ), 
                        ),
                      ]
                    )
                  ),
                ),
                SizedBox(height: 80.0),
                Container(
                  child: Column(
                    children: [
                      buttonTemplate(
                        buttonType: 'ElevatedButton',
                        text: 'Login', 
                        press: () {},
                        sized_width: 0.6,
                        bg_color: kMain60, 
                        textColor: kSecondary30,
                      ),
                      SizedBox(height: 22.0),
                      buttonTemplate(
                        buttonType: 'OutlinedButton',
                        text: 'Sign Up', 
                        press: () {},
                        sized_width: 0.6,
                        bg_color: Colors.transparent, 
                        textColor: kMain60,
                      ),
                    ],
                  )
                ),
              ],
            )
        ),
       
      )
    );
  }
}
