import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tese_journey/Pages/Registration_page.dart';
import 'package:tese_journey/Pages/home_page.dart';
import 'package:tese_journey/Pages/login_page.dart';
import 'package:tese_journey/components/note.dart';
import 'package:tese_journey/image_pick.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({super.key});

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  int index = 0; // set the first page

  final screens = [
    HomePage(),
    LoginPage(),
    Note(),
    RegistrationPage(),
    MyHomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final Items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.search,
        size: 30,
      ),
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.search,
        size: 30,
      ),
      Icon(
        Icons.home,
        size: 30,
      )
    ];
    return Scaffold(
      extendBody: true, //when we add image or something we should do this
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
      ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(
            color: Colors.green, //this will change the icon color
          ),
        ),
        child: CurvedNavigationBar(
          color: Colors.pink, //Navigation bar Color change
          buttonBackgroundColor:
              Colors.white, //change the selected background color
          backgroundColor: Colors.transparent,
          index: index,
          // animationCurve:
          //     Curves.easeInOut, //Thransition duration change in here
          // animationDuration:
          //     Duration(milliseconds: 300), //Thransition duration change in here
          items: Items,
          height: 60,
          onTap: (index) => setState(() {
            this.index = index;
          }),
        ),
      ),
    );
  }
}
