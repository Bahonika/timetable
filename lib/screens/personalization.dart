import 'dart:convert';

import 'package:flutter/material.dart';
import 'file:///E:/Flutter/Projects/timetable/lib/templates/dropdown.dart';

import 'package:shared_preferences/shared_preferences.dart';


import '../main.dart';

import 'package:http/http.dart' as http;

class Personalization extends StatefulWidget {
  @override
  _PersonalizationState createState() => _PersonalizationState();
}

class _PersonalizationState extends State<Personalization>
    with SingleTickerProviderStateMixin {
  String errorForGroup = "";
  String okForGroup = "";

  String errorForTeacher = "";
  String okForTeacher = "";

  String errorForPlace = "";
  String okForPlace = "";

  TextEditingController groupsController = TextEditingController();
  TextEditingController teachersController = TextEditingController();
  TextEditingController placesController = TextEditingController();

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    groupsController.text = groupName;
    teachersController.text = teacherName;
    placesController.text = placeName;
  }

  @override
  void dispose() {
    super.dispose();
  }

  //Конвертация
  static String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  /////////////////
  //Блок для курсов
  /////////////////
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

  Future<bool> saveGroupData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(groupKey, groupsController.text);
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

  //проверка валидации текста
  String textGroupCheck() {
    int flag = 0;
    for (int i = 0; i < groups.length; i++) {
      if (groupsController.text == groups[i] ||
          groupsController.text.hashCode.toString() == "1") {
        flag = 1;
      }
    }
    if (flag == 1) {
      return "";
    } else
      return "Введите курс как в таблице с расписанием";
  }

  errorGroupCheck() {
    setState(() {
      errorForGroup = textGroupCheck();
      if (errorForGroup == "" &&
          groupsController.text.hashCode.toString() != "1") {
        saveGroupData();
        setGroupData();
        okForGroup = "Сохранено";
      } else
        setState(() {
          okForGroup = "";
        });
    });
  }

  ////////////////////
  //Блок для преподавателей
  ////////////////////

  Future<String> getTeacherData() async {
    var response = await http.get(Uri.encodeFull(API_key + "teachers"),
        headers: {"Content-Type": 'application/json; charset=utf-8'});
    teachers = json.decode(response.body);

    for (int i = 0; i < teachers.length; i++) {
      teachers[i] = utf8convert(teachers[i]);
    }
    teachers.sort((a, b) => a.compareTo(b));
    setState(() {
      stringTeachers = teachers.cast<String>();
    });

    return "Success";
  }

  Future<bool> saveTeacherData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(teacherKey, teachersController.text);
  }

  //загрузка названия группы из кэша
  Future<String> loadTeacherData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(teacherKey);
  }

  setTeacherData() {
    loadTeacherData().then((value) {
      teacherName = value;
    });
  }

  //проверка валидации текста
  String textTeacherCheck() {
    int flag = 0;
    for (int i = 0; i < teachers.length; i++) {
      if (teachersController.text == teachers[i] ||
          teachersController.text.hashCode.toString() == "1") {
        flag = 1;
      }
    }
    if (flag == 1) {
      return "";
    } else
      return "Введите имя в формате <Фамилия И.О.>";
  }

  errorTeacherCheck() {
    setState(() {
      errorForTeacher = textTeacherCheck();
      if (errorForTeacher == "" &&
          teachersController.text.hashCode.toString() != "1") {
        saveTeacherData();
        setTeacherData();
        okForTeacher = "Сохранено";
      } else
        setState(() {
          okForTeacher = "";
        });
    });
  }

  ////////////////////
  //Блок для кабинетов
  ////////////////////

  Future<String> getPlaceData() async {
    var response = await http.get(Uri.encodeFull(API_key + "places"),
        headers: {"Content-Type": 'application/json; charset=utf-8'});
    places = json.decode(response.body);

    for (int i = 0; i < places.length; i++) {
      places[i] = utf8convert(places[i]);
    }
    places.sort((a, b) => a.compareTo(b));
    setState(() {
      stringPlaces = places.cast<String>();
    });

    return "Success";
  }

  Future<bool> savePlaceData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(placeKey, placesController.text);
  }

  //загрузка кабинета из кэша
  Future<String> loadPlaceData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(placeKey);
  }

  setPlaceData() {
    loadPlaceData().then((value) {
      placeName = value;
    });
  }

  //проверка валидации текста
  String textPlaceCheck() {
    int flag = 0;
    for (int i = 0; i < places.length; i++) {
      if (placesController.text == places[i] ||
          placesController.text.hashCode.toString() == "1") {
        flag = 1;
      }
    }
    if (flag == 1) {
      return "";
    } else
      return "Введите номер кабинета в формате <№, Корпус>";
  }

  errorPlaceCheck() {
    setState(() {
      errorForPlace = textPlaceCheck();
      if (errorForPlace == "" &&
          placesController.text.hashCode.toString() != "1") {
        savePlaceData();
        setPlaceData();
        okForPlace = "Сохранено";
      } else
        setState(() {
          okForPlace = "";
        });
    });
  }

  final FocusNode nodeTeacher = FocusNode();
  final FocusNode nodePlace = FocusNode();

  // ignore: non_constant_identifier_names
  void ChangeFocus(FocusNode node) {
    // FocusScope.of(context).requestFocus(new FocusNode());
    FocusScope.of(context).requestFocus(node);
  }

  // ignore: non_constant_identifier_names
  void ButtonSave() {
    errorGroupCheck();
    errorTeacherCheck();
    errorPlaceCheck();
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  //////////////////

  @override
  Widget build(BuildContext context) {


    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),

              /////////Ввод курса//////////

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    errorForGroup,
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    okForGroup,
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.end,
                  )
                ],
              ),

              DropDownField(
                hintText: "Введите курс",
                items: stringGroups,
                controller: groupsController,
                onEditingComplete: () => ChangeFocus(nodeTeacher),
                // onFieldSubmitted: (String textInput) {
                //   ChangeFocus(nodeTeacher);
                // },
                enabled: true,
              ),
              Divider(),

              /////////Ввод преподавателя//////////

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    errorForTeacher,
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    okForTeacher,
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.end,
                  )
                ],
              ),

              DropDownField(
                focusNode: nodeTeacher,
                onEditingComplete: () => ChangeFocus(nodePlace),
                enabled: true,
                hintText: "Введите имя преподавателя",
                items: stringTeachers,
                controller: teachersController,
              ),
              Divider(),

              ////////Кабинет//////////

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    errorForPlace,
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    okForPlace,
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.end,
                  )
                ],
              ),

              DropDownField(
                focusNode: nodePlace,
                hintText: "Введите номер кабинета",
                items: stringPlaces,
                controller: placesController,
                onEditingComplete: ButtonSave,
                enabled: true,
              ),

              ///////Кнопка сохранения///////
              ElevatedButton(
                onPressed: () {
                  ButtonSave();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    return deepBlue;
                  }),
                ),
                child: Text("Сохранить изменения"),
              ),
            ],
          ),
        ));
  }
}
