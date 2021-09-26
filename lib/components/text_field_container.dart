import "package:flutter/material.dart"; 
import "package:dani_miniproject/constants.dart";

class TextFieldContainer extends StatelessWidget {
  final Widget? child; 
  
  const TextFieldContainer({
    Key? key, 
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // Ahhh, so naga-butang ko'g murag style daan sa pagbutngan sa textfield? wowex.
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: kSecondary30, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
    child: child,
    );
  }
}