import 'package:dani_miniproject/components/button_template.dart';
import 'package:dani_miniproject/components/custom_dialog_box.dart';
import 'package:dani_miniproject/components/custom_input_fields.dart';
import 'package:dani_miniproject/components/loading.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/screens/authentication_screens/sucess_reset.dart';
import 'package:dani_miniproject/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({ Key? key }) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final AuthService _auth = AuthService();
  final formKey = GlobalKey<FormState>();
  String email = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return loading? Loading(): Scaffold(
      backgroundColor: kMain60,
      appBar:AppBar(
        backgroundColor: kMain60,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kSecondary30, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RESET PASSWORD?',
                style: TextStyle(
                  fontFamily: 'Roboto Thin',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: kAccent,
                  fontSize: 40.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Enter the email associated with your account and we\'ll send an email with instructions to reset your password.',
                style: TextStyle(
                  fontFamily: 'Roboto Regular',
                  color: kSecondary30,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 30.0),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email address',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: kSecondary30,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    // Transform this into a reusable widget para ma change tong ugly-ass widget sa login signup
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
                    SizedBox(height: 15.0),
                    buttonTemplate(
                      buttonType: 'ElevatedButton',
                      sized_width: 0.9, 
                      text: 'Send Instructions',
                      press: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth.sendPasswordResetEmail(email);

                          setState(() {
                            loading = false;

                            if(result is String) {
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
                            else if (result == null) {
                               showDialog(
                                context: context, 
                                builder: (BuildContext context) {
                                  return  CustomDialogBox(
                                    title: '404', 
                                    descriptions: 'Please contact our support desk for this issue. Thank you.', 
                                    text: 'OK',
                                    icon: Icon(Icons.error_sharp, color: kAccent, size: 50.0),
                                  );
                                }
                              ); 
                            }
                            else {
                              Navigator.popUntil(context, (route) => false);
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckEmailPrompt()));
                            }
                          }); 
                        } 
                      },
                      bg_color: kAccent,
                      textColor: kMain60,
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
