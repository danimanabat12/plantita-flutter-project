import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/components/text_field_container.dart';
import 'package:dani_miniproject/components/button_template.dart';
import 'package:dani_miniproject/components/rounded_input_field.dart';
import 'package:dani_miniproject/components/rounded_password_field.dart';
import 'package:dani_miniproject/components/account_check.dart';
import 'package:dani_miniproject/services/verify_login.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Calculates the total size of the screen. 
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kMain60,
      body: Stack(
        children: [
          AppBar(
            iconTheme: IconThemeData(
              color: kSecondary30, //change your color here
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          Container(
            height: 145.0, 
            child: Stack(
              alignment: Alignment.center, 
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/backgrounds/login_signup_bg.png',
                    width: size.width * 0.7,
                  )
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
              child: Form(
                key: formKey,
                child: Wrap(
                  children: [
                    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'LOGIN', 
                        style: TextStyle(
                          fontFamily: 'Roboto Thin',
                          fontSize: 50.0, 
                          color: kSecondary30, 
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username', 
                              style: TextStyle(
                                fontFamily: 'Roboto Light',
                                fontSize: 16.0,
                                color: kSecondary30,
                              ),
                            ),
                            RoundedInputField(
                              controller: usernameController,
                              hintText: 'Your username',
                              onChanged: (value) {},
                              icon: Icons.person,
                              toValidate: [
                                RequiredValidator(errorText: "Required *"),
                                MinLengthValidator(6, errorText: "should contain atleast 6 characters"),
                                MaxLengthValidator(15, errorText: "should not exceed 15 characters"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password', 
                              style: TextStyle(
                                fontFamily: 'Roboto Light',
                                fontSize: 16.0,
                                color: kSecondary30,
                              ),
                            ),
                            RoundedPasswordField(
                              controller: passwordController,
                              onChanged: (value) {}, 
                              toValidate: [
                                RequiredValidator(errorText: "Required *"),
                                MinLengthValidator(8, errorText: "should contain atleast 8 characters"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0),
                      buttonTemplate(
                        buttonType: 'ElevatedButton',
                        sized_width: 0.8,
                        text: 'LOGIN',
                        press: () {
                          if(formKey.currentState!.validate()) {
                            VerifyLogin tester = new VerifyLogin(
                              inputtedUsername: usernameController.text,
                              inputtedPassword: passwordController.text,
                            );
                            EasyLoading.show(status: 'User Verifying');
                            Future.delayed(Duration(seconds: 3), () {
                              setState(() {
                                if (tester.verifyUserInput()) {
                                  EasyLoading.showSuccess('User verified!');
                                  // Navigator.popUntil(context, ModalRoute.withName('/home'), arguments: );
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                  Navigator.pushReplacementNamed(context, '/home', arguments: {
                                    'username': usernameController.text,
                                  });
                                }
                                else {
                                  EasyLoading.showError('Invalid user credential!');
                                }
                              });
                            });
                          }
                        },
                        bg_color: kSecondary30,
                        textColor: kMain60,
                      ),
                      SizedBox(height: 15.0),
                      AccountCheck(
                        press: () {
                          Navigator.popAndPushNamed(context, '/signup');
                        }, 
                        login: true,
                      ),
                    ],
                  ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}

