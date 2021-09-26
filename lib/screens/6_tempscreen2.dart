import 'package:flutter/material.dart'; 
import 'package:dani_miniproject/constants.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({ Key? key }) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMain60,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Shopping cart',
            style: TextStyle(
            fontFamily: 'Playfair Display', 
            fontSize: 25.0,
            color: kSecondary30,
          ),
        ),
        iconTheme: IconThemeData(
          color: kSecondary30, //change your color here
        ),
        backgroundColor: kMain60,
        shape: Border(bottom: BorderSide(color: kSecondary30, width: 1)),
      ),

      body: Center(
        child: Text('Things are being built as of this moment'),
      ),
    );
  }
}

