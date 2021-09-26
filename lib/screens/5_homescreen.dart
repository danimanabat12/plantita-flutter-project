import 'package:dani_miniproject/screens/5.2_tempscreen.dart';
import 'package:flutter/material.dart';
import 'package:dani_miniproject/constants.dart';
import 'package:dani_miniproject/components/dashboard.dart';
import 'package:dani_miniproject/components/plant_widget.dart';
import 'package:dani_miniproject/screens/5.1_homeoption.dart';
import 'package:dani_miniproject/screens/5.2_tempscreen.dart';
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {}; 
  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    
    const TextStyle navStyle = TextStyle(fontSize: 16.0, fontFamily: 'Roboto Light');

    List<Widget> _widgetOptions = <Widget>[
      HomeOption(user: data['username']),
      TempScreen(),
      TempScreen(),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: kMain60,
      appBar: AppBar(
        elevation: 0,
        title: Text(
                'Plantita.ph',
                  style: TextStyle(
                  fontFamily: 'Playfair Display', 
                  fontSize: 25.0,
                  color: kSecondary30,
                ),
              ),
        backgroundColor: kMain60,
        shape: Border(bottom: BorderSide(color: kSecondary30, width: 1)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/shopping-cart');
            },
            icon: Icon(
              Icons.shopping_cart_outlined, 
              color: kSecondary30,
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: kSecondary30, width: 1.0))),
        child: BottomNavigationBar(
          backgroundColor: kMain60,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home', 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Shop', 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile', 
            ),
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: kSecondary30,
        onTap: _onItemTapped,
        ),
      ),
    );
  }
}
