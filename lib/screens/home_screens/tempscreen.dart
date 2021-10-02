import 'package:flutter/material.dart'; 
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/components/dashboard.dart';
import 'package:dani_miniproject/components/plant_widget.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({ Key? key }) : super(key: key);

  @override
  _TempScreenState createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Things are being built as of this moment'),
      ),
    );
  }
}