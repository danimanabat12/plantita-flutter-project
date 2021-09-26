import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';

class PlantWidget extends StatelessWidget {

  final String? path; 
  final String? price; 

  const PlantWidget({
    Key? key,
    this.path, 
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/temp');
      },
      child: Container(
        height: 160.0, 
        width: 135.0,  
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
            ),
            Image(
              height: 100,
              image: AssetImage(path as String),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 4,
              left: 8,
              child: Text(
                'Php. ${price}', 
                style: TextStyle(
                  fontFamily: 'Roboto Light', 
                  color: kSecondary30,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
