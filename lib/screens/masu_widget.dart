import 'dart:convert';
import 'package:timetable/screens/main_apps.dart';
import 'package:timetable/screens/personalization.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../for_timetables.dart';
import '../main.dart';
import '../templates/text_decoration.dart';
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

  //получение списка групп
  Future<String> getGroupData() async {
    var response = await http.get(Uri.encodeFull(API_key + "courses"),
        headers: {"Content-Type": 'application/json; charset=utf-8'});
    groups = json.decode(response.body);

    for (int i = 0; i < groups.length; i++) {
      groups[i] = utf8convert(groups[i]);
    }

    setState(() {
      stringGroups = groups.cast<String>();
    });

    return "Success";
  }

  //получение списка преподавателей
  Future<String> getTeacherData() async {
    var response = await http.get(Uri.encodeFull(API_key + "teachers"),
        headers: {"Content-Type": 'application/json; charset=utf-8'});
    teachers = json.decode(response.body);

    for (int i = 0; i < teachers.length; i++) {
      teachers[i] = utf8convert(teachers[i]);
    }

    setState(() {
      stringTeachers = teachers.cast<String>();
    });

    return "Success";
  }

  //получение списка кабинетов
  Future<String> getPlaceData() async {
    var response = await http.get(Uri.encodeFull(API_key + "places"),
        headers: {"Content-Type": 'application/json; charset=utf-8'});
    places = json.decode(response.body);

    for (int i = 0; i < places.length; i++) {
      places[i] = utf8convert(places[i]);
    }

    setState(() {
      stringPlaces = places.cast<String>();
    });

    return "Success";
  }

  //Инициализация
  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: 0,
    );

    getGroupData();
    setGroupData();

    getTeacherData();
    setTeacherData();

    getPlaceData();
    setPlaceData();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  //загрузка кабинетов из кэша
  Future<String> loadPlaceData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(placeKey);
  }

  setPlaceData() {
    loadPlaceData().then((value) {
      placeName = value;
    });
  }

  //загрузка имени преподавателя из кэша
  Future<String> loadTeacherData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(teacherKey);
  }

  setTeacherData() {
    loadTeacherData().then((value) {
      teacherName = value;
    });
  }

  //загрузка названия группы из кэша
  Future<String> loadGroupData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(groupKey);
  }

  setGroupData() {
    loadGroupData().then((value) {
      groupName = value;
    });
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
      /////////////////////////////
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: deepBlue,
        height: MediaQuery.of(context).size.height * 0.06,
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
          title: DecoratedText("МАГУ")),
      body: PageView(
        children: _widgetOptions,
        controller: pageController,
        onPageChanged: (int) {
          setState(() {
            _currentIndex = int;
          });
        },
        physics: BouncingScrollPhysics(),
        // child: _widgetOptions.elementAt(_currentIndex)),
      ),
    );
  }
}
