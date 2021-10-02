import 'package:dani_miniproject/components/custom_alert_dialog.dart';
import 'package:dani_miniproject/components/loading.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/services/auth.dart';
import 'package:dani_miniproject/components/button_template.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Container(
      child: ListView(
        children: [
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () async {
              // Show a card na mag-verify sa ilang action. Can be transformed into a reusable class but.... hatdog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => CustomAlertDialogue(
                  auth: _auth, 
                  loading: loading,
                  title: 'Are you sure you want to log out?',
                  leadingActionTitle: 'LOGOUT',
                  secondaryActionTitle: 'CANCEL',
                  leadingOnChanged: () async {
                    Navigator.pop(context, 'Cancel');
                    setState(() {
                      loading = true;
                    });
                    await _auth.logOut();
                    setState(() {
                      loading = false;
                    });
                  },
                  secondaryOnChanged:  () {
                     Navigator.pop(context, 'Cancel');
                  },
                )
              );
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              height: 50.0, 
              decoration: BoxDecoration(
                border: Border.all(color: kSecondary30, width: 1.0),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.logout_outlined, color: kAccent,), 
                    SizedBox(width: 10.0),
                    Text(
                      'Log out',
                      style: TextStyle(
                        fontFamily: 'Roboto Regular', 
                        color: kSecondary30,
                        fontSize: 16.0,
                      ),
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
