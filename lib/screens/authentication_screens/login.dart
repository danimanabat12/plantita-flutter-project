import 'package:dani_miniproject/components/custom_dialog_box.dart';
import 'package:dani_miniproject/components/custom_input_fields.dart';
import 'package:dani_miniproject/components/loading.dart';
import 'package:dani_miniproject/screens/authentication_screens/reset_password.dart';
import 'package:dani_miniproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/components/button_template.dart';
import 'package:dani_miniproject/components/account_check.dart';
import 'package:form_field_validator/form_field_validator.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();
  final formKey = GlobalKey<FormState>();

  bool loading = false;
  String email = ''; 
  String password = '';

  @override
  Widget build(BuildContext context) {
    // Calculates the total size of the screen. 
    Size size = MediaQuery.of(context).size;

    return loading? Loading() : Scaffold(
      backgroundColor: kMain60,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              iconTheme: IconThemeData(
                color: kSecondary30, //change your color here
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 0),
                child: Form(
                  key: formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 100.0, 
                            height: 100.0,
                            child: Image(image: AssetImage('assets/logo/logo.png'), fit: BoxFit.cover)
                          ),
                        SizedBox(height: 10.0),
                        Text(
                          'LOGIN', 
                          style: TextStyle(
                            fontFamily: 'Roboto Thin',
                            fontSize: 50.0, 
                            color: kAccent, 
                          ),
                        ),
                        SizedBox(height: 10.0), 
                        AccountCheck(
                          press: () {
                            Navigator.popAndPushNamed(context, '/signup');
                          }, 
                          login: true,
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          width: size.width * 0.825,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email', 
                                style: TextStyle(
                                  fontFamily: 'Roboto Light',
                                  fontSize: 14.0,
                                  color: kSecondary30,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              CustomInputField(
                                type: 1,
                                hintText: 'ex. juandelacruz@gmail.com',
                                icon: Icon(Icons.email, color: kSecondary30, size: 16.0,),
                                toValidate: [
                                  RequiredValidator(errorText: "Required *"),
                                  EmailValidator(errorText: "Invalid email")
                                ],
                                onChanged: (value) {
                                  email = value;
                                }
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: size.width * 0.825,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password', 
                                style: TextStyle(
                                  fontFamily: 'Roboto Light',
                                  fontSize: 14.0,
                                  color: kSecondary30,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              CustomInputField(
                                type: 2,
                                hintText: 'Your password',
                                icon: Icon(Icons.lock, color: kSecondary30, size: 16.0,),
                                toValidate: [
                                  RequiredValidator(errorText: "Required *"),
                                  MinLengthValidator(8, errorText: "should contain atleast 8 characters")
                                ],
                                onChanged: (value) {
                                  password = value;
                                }
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        buttonTemplate(
                          buttonType: 'ElevatedButton',
                          sized_width: 0.825,
                          text: 'LOGIN',
                          press: () async {
                            if(formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              
                              dynamic result = await _auth.signInWithEmailAndPassword(email, password);

                              setState(() {
                                loading = false;

                                if(result is String) {
                                  showDialog(
                                    context: context, 
                                    builder: (BuildContext context) {
                                      return CustomDialogBox(
                                        title: 'Try again!', 
                                        descriptions: result,
                                        text: 'OK',
                                        icon: Icon(Icons.error_sharp, color: kAccent, size: 50.0),
                                      );
                                    }
                                  ); 
                                }
                                else {
                                  Navigator.pop(context);
                                }
                              });
                            }
                          },
                          bg_color: kAccent,
                          textColor: kMain60,
                        ),
                        SizedBox(height: 15.0),
                        GestureDetector(
                          onTap: () {
                            // mag push kog eme diri
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPassword()));
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontFamily: 'Roboto Regular', 
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0, 
                              color: kSecondary30,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
          
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}

