import 'package:timetable/screens/masu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  runApp(MyApp());
}

String groupName;
String teacherName;
String placeName;

List groups = List();
List teachers = List();
List places = List();

List<String> stringGroups;
List<String> stringTeachers;
List<String> stringPlaces;

String groupKey = "_groupKey";
String teacherKey = "_teacherKey";
String placeKey = "_placeKey";

// ignore: non_constant_identifier_names
String API_key = "https://projects.masu.edu.ru/timetable/api/";

double width;

//MASU Colors
Color deepBlue = Color.fromARGB(255, 0, 78, 125);
Color lightBlue = Color.fromRGBO(0, 147, 239, 1);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

@override
  Widget build(BuildContext context) {

    //Вертикальная ориентация
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //Цвет статусбара и навигации
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: deepBlue,
        systemNavigationBarColor: deepBlue,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MasuWidget(),
    );

  }
}


