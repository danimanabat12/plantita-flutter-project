import 'package:flutter/material.dart'; 
import 'package:dani_miniproject/components/text_field_container.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String>? onChanged; 
  List<FieldValidator<dynamic>>? toValidate;
  TextEditingController? controller;
  
  RoundedPasswordField({
    Key? key,
    this.onChanged,
    this.toValidate,
    this.controller,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
  }

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  
  bool? _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }
  
  @override
  Widget build(BuildContext context) {
    
    return TextFieldContainer(
      // Widget atong ginapasa. 
      child: TextFormField(
        controller: widget.controller,
        obscureText: !(_passwordVisible as bool),
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "Your password",
          hintStyle: TextStyle(fontSize: 14.0),
          icon: Icon(
            Icons.lock,
            color: kSecondary30, 
          ),
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
          ),
          border: InputBorder.none,
        ),
        validator: MultiValidator(
          widget.toValidate as List<FieldValidator<dynamic>>,
        ),
      ),
    );
  }
}
