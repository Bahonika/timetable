import 'dart:io';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timetable/screens/masu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() async {
  //Ignore the error of bad certificate
  //Deletion will cause an application error
  HttpOverrides.global = new MyHttpOverrides();

  runApp(MyApp());
}

String utf8convert(String text) {
  List<int> bytes = text.toString().codeUnits;
  return utf8.decode(bytes);
}

String groupName;
String teacherName;
String placeName;

List groups;
List teachers;
List places;

List<String> stringGroups;
List<String> stringTeachers;
List<String> stringPlaces;
List<String> notLoaded = ["Возможны неполадки при получении данных, подождите пожалуйста... \nПроверьте интернет соединение"];

String groupKey = "_groupKey";
String teacherKey = "_teacherKey";
String placeKey = "_placeKey";

// ignore: non_constant_identifier_names
String API_key = "http://projects.masu.edu.ru/timetable/api/";

double width;

//MASU Colors
Color deepBlue = Color.fromARGB(255, 0, 78, 125);
Color lightBlue = Color.fromRGBO(0, 147, 239, 1);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //Loading audience data from the cache
  Future<String> loadPlaceData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(placeKey);
  }
  setPlaceData() {
    loadPlaceData().then((value) {
      placeName = value;
    });
  }

  //Loading teacher data from the cache
  Future<String> loadTeacherData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(teacherKey);
  }
  setTeacherData() {
    loadTeacherData().then((value) {
      teacherName = value;
    });
  }

  //Loading group data from the cache
  Future<String> loadGroupData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(groupKey);
  }
  setGroupData() {
    loadGroupData().then((value) {
      groupName = value;
    });
  }

  //Loading groupList data from the API
  Future<String> getGroupData() async {
    var response = await http.get(
        Uri.encodeFull(API_key + "courses"),
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

  //Loading teacherList data from the API
  Future<String> getTeacherData() async {
    var response = await http.get(
        Uri.encodeFull(API_key + "teachers"),
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

  //Loading placeList data from the API
  Future<String> getPlaceData() async {
    var response = await http.get(
        Uri.encodeFull(API_key + "places"),
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

  //Loading data on startup
  @override
  void initState() {
    super.initState();

    setState(() {
      getGroupData();
      setGroupData();

      getTeacherData();
      setTeacherData();

      getPlaceData();
      setPlaceData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Preferred device orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //Status bar and bottom bar colors
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: deepBlue,
        systemNavigationBarColor: deepBlue,
      ),
    );

    return MaterialApp(
      //Default language
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('ru'),
      ],
      debugShowCheckedModeBanner: false,
      home: MasuWidget(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}