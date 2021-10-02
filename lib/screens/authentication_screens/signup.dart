import 'package:dani_miniproject/components/custom_dialog_box.dart';
import 'package:dani_miniproject/components/custom_input_fields.dart';
import 'package:dani_miniproject/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/components/button_template.dart';
import 'package:dani_miniproject/components/account_check.dart';
import 'package:dani_miniproject/components/loading.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

    final AuthService _auth = AuthService();
    final formKey = GlobalKey<FormState>();
    
    bool loading = false;
    String name = '';
    String email = ''; 
    String password = '';

  @override
  Widget build(BuildContext context) {
    // Calculates the total size of the screen. 
    Size size = MediaQuery.of(context).size;

    return loading? Loading() : Scaffold(
      backgroundColor: kMain60,
      body: SingleChildScrollView(
        child: Container(
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
                    child: Wrap(
                      children: [
                        Column(
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
                              'SIGN UP', 
                              style: TextStyle(
                                fontFamily: 'Roboto Thin',
                                fontSize: 50.0, 
                                color: kAccent, 
                              ),
                            ),
                            SizedBox(height: 10.0),
                            AccountCheck(
                              press: () {
                                Navigator.popAndPushNamed(context, '/login');
                              }, 
                              login: false,
                            ),
                            SizedBox(height: 30.0),
                            Container(
                              width: size.width * 0.825,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name', 
                                    style: TextStyle(
                                      fontFamily: 'Roboto Light',
                                      fontSize: 14.0,
                                      color: kSecondary30,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  CustomInputField(
                                    type: 1,
                                    hintText: 'ex. Juan dela Cruz',
                                    icon: Icon(Icons.person, color: kSecondary30, size: 16.0,),
                                    toValidate: [
                                      RequiredValidator(errorText: "Required *"),
                                    ],
                                    onChanged: (value) {
                                      name = value;
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
                              text: 'SIGN UP',
                              press: () async {
                                if(formKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth.registerWithEmailAndPassword(email, password, name);

                                  setState(() {
                                    loading = false;

                                    if (result is String) {
                                      showDialog(
                                        context: context, 
                                        builder: (BuildContext context) {
                                          return  CustomDialogBox(
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
                            SizedBox(height: 60.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ],
          ),
        ),
      ),
      
    );
  }
}
