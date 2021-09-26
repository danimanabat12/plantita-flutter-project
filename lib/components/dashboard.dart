import 'package:flutter/material.dart'; 
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dani_miniproject/constants.dart';

class Dashboard extends StatelessWidget {
  
  final List<String>? img_path; 

  const Dashboard({
    Key? key,
    this.img_path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
            options: CarouselOptions(
            height: 190.0,
            enlargeCenterPage: true, 
            autoPlay: true, 
            aspectRatio: 16/9, 
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            viewportFraction: 0.8,
          ),
          items: img_path!.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      // colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                      image:  AssetImage(i),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
  }
}