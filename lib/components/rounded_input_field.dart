import 'package:flutter/material.dart';
import 'package:dani_miniproject/components/text_field_container.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RoundedInputField extends StatefulWidget {
  String? hintText; 
  IconData? icon; 
  ValueChanged<String>? onChanged;
  List<FieldValidator<dynamic>>? toValidate;
  TextEditingController? controller;

  
  RoundedInputField({
    Key? key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.toValidate,
    this.controller,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
  }

class _RoundedInputFieldState extends State<RoundedInputField> {

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller:widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          icon: Icon(widget.icon, color: kSecondary30),
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14.0),
          border: InputBorder.none,
        ),
        validator: MultiValidator(
          widget.toValidate as List<FieldValidator<dynamic>>,
        ),
      )
      );
  }
}
