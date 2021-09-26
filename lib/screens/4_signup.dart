
import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/components/text_field_container.dart';
import 'package:dani_miniproject/components/button_template.dart';
import 'package:dani_miniproject/components/rounded_input_field.dart';
import 'package:dani_miniproject/components/rounded_password_field.dart';
import 'package:dani_miniproject/components/account_check.dart';
import 'package:dani_miniproject/services/verify_signup.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    TextEditingController usernameController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController emailController = new TextEditingController();
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
                        'SIGN UP', 
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
                              'Email', 
                              style: TextStyle(
                                fontFamily: 'Roboto Light',
                                fontSize: 16.0,
                                color: kSecondary30,
                              ),
                            ),
                            RoundedInputField(
                              controller: emailController,
                              hintText: 'Your email',
                              onChanged: (value) {},
                              icon: Icons.email_outlined,
                              toValidate: [
                                  RequiredValidator(errorText: "Required *"),
                                  EmailValidator(errorText: "Invalid email")
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
                        text: 'SIGN UP',
                        press: () {
                          if(formKey.currentState!.validate()) {
                            VerifySignup tester = new VerifySignup(
                              inputtedUsername: usernameController.text,
                              inputtedPassword: passwordController.text,
                              inputtedEmail: emailController.text,
                            );
                            EasyLoading.show(status: 'Verifying inputs');
                            Future.delayed(Duration(seconds: 3), () {
                              setState(() {
                                if (tester.verifyUserPass()) {
                                  EasyLoading.showSuccess('New account has been made!');
                                  Navigator.popAndPushNamed(context, '/login');
                                }
                                else {
                                  EasyLoading.showError('Oops, inputted credentials are already taken');
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
                          Navigator.popAndPushNamed(context, '/login');
                        }, 
                        login: false,
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
