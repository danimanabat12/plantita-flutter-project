import 'package:dani_miniproject/constants.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CustomInputField extends StatefulWidget {
  int type;
  String hintText; 
  Icon icon; 
  List<FieldValidator<dynamic>> toValidate;
  ValueChanged<String> onChanged;

  CustomInputField({
    Key? key,
    required this.type,
    required this.hintText,
    required this.icon,
    required this.toValidate,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {

  bool? _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == 1) {
      return TextFormField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: widget.icon,
          // Icon(Icons.email, color: kSecondary30, size: 16.0,),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          fillColor: kMain60,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kSecondary30, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kAccent, width: 1.0) 
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 1.0) 
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 1.0) 
          ),
       ),
        style: TextStyle(
          fontSize: 14.0,
          color: kAccent,
        ),
        onChanged: widget.onChanged,
        validator: MultiValidator(
          widget.toValidate as List<FieldValidator<dynamic>>,
        ),
      );
    }
    else {
      return TextFormField(
        obscureText: !(_passwordVisible as bool),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14.0),
          prefixIcon: widget.icon,
          suffixIcon: IconButton(
            icon: Icon(
                _passwordVisible as bool ? Icons.visibility : Icons.visibility_off,
                color: kSecondary30,
              ),
            onPressed: () {
              setState(() {
                _passwordVisible = !(_passwordVisible as bool);
              });
            },
            iconSize: 16.0,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          fillColor: kMain60,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kSecondary30, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kAccent, width: 1.0) 
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 1.0) 
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red, width: 1.0) 
          ),
       ),
        style: TextStyle(
          fontSize: 14.0,
          color: kAccent,
        ),
        onChanged: widget.onChanged,
        validator: MultiValidator(
          widget.toValidate as List<FieldValidator<dynamic>>,
        ),
      );
    }
  }
}