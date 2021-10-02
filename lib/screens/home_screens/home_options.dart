import 'package:flutter/material.dart'; 
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/components/dashboard.dart';
import 'package:dani_miniproject/components/plant_widget.dart';

class HomeOption extends StatelessWidget {
  final String? user; 

  const HomeOption({
    this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
            child: Dashboard(img_path: [
              'assets/backgrounds/carousel-1.png',
              'assets/backgrounds/carousel-2.png',
              'assets/backgrounds/carousel-3.png',
            ],),
          ),
          SizedBox(height: 15.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(17.0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hello!',
                            style: TextStyle(
                              fontFamily: 'Roboto Regular', 
                              fontSize: 35.0, 
                              color: kSecondary30,
                            ),
                          ),
                          Text(
                            user as String,
                            style: TextStyle(
                              fontFamily: 'Roboto Regular', 
                              fontSize: 35.0, 
                              color: kAccent,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Check out today\'s sulit deals!',
                        style: TextStyle(
                          fontFamily: 'Roboto Light', 
                          fontSize: 14.0,
                          color: kSecondary30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlantWidget(
                      path: 'assets/plants/deal-1.png', 
                      price: '299.00',
                    ),
                    SizedBox(width: 30.0),
                    PlantWidget(
                      path: 'assets/plants/deal-2.png', 
                      price: '350.00',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ],
      ),
    );
  }
}