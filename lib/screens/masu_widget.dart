import 'package:timetable/screens/main_apps.dart';
import 'package:timetable/screens/personalization.dart';

import 'package:flutter/material.dart';

import '../for_timetables.dart';
import '../main.dart';
import 'apps/about.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MasuWidget extends StatefulWidget {
  @override
  _MasuWidgetState createState() => _MasuWidgetState();
}

class _MasuWidgetState extends State<MasuWidget> with ForTimetablesMixin {
  TextEditingController autoTextEditingController = TextEditingController();

  TextEditingController groupController = TextEditingController();
  TextEditingController teacherController = TextEditingController();

  //Инициализация
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    groupController.dispose();
    teacherController.dispose();
    pageController.dispose();

    super.dispose();
  }

  int _currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MainApps(),
    Personalization(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 250), curve: Curves.linearToEaseOut);
    });
  }

  PageController pageController;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        // Animated navigation
        backgroundColor: Colors.white,
        color: deepBlue,
        height: MediaQuery.of(context).size.height * 0.1 > 75
            ? 75
            : MediaQuery.of(context).size.height * 0.1,
        animationDuration: Duration(milliseconds: 250),
        animationCurve: Curves.linearToEaseOut,
        index: _currentIndex,

        items: [
          Icon(
            Icons.apps,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
        onTap: _onItemTapped,
      ),
      ////////////////////////////
      appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
              icon: Icon(Icons.rate_review),
            )
          ],
          backgroundColor: deepBlue,
          toolbarHeight: MediaQuery.of(context).size.shortestSide * 0.11 < 55
              ? 55
              : MediaQuery.of(context).size.shortestSide * 0.11 > 85
                  ? 85
                  : MediaQuery.of(context).size.shortestSide * 0.11,
          title: Text(
            "МАГУ",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: PageView(
        children: _widgetOptions,
        controller: pageController,
        onPageChanged: (int) {
          setState(() {
            _currentIndex = int;
          });
        },
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
