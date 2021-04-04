import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:timetable/main.dart';
import '../../for_timetables.dart';

class Timetable extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable>
    with ForTimetablesMixin, SingleTickerProviderStateMixin {
  List data;
  String url;

  static DateTime now = DateTime.now();

  static String formatNow = formatDate(now, [dd, '-', mm, '-', yyyy]);

  static String weekDay = DateFormat('EEEE').format(now);

  String waiter = "Пожалуйста подождите...";

  changeWaiter() {
    Future.delayed(Duration(seconds: 4), () {
      waiter = "Проверьте соединение с интернетом";
    });
  }

  //Инициализация экрана
  @override
  void initState() {
    super.initState();

    now = DateTime.now();
    urlCreate();
    getData();

    setState(() {
      changeWaiter();
    });
    print("sss");
  }

  @override
  void dispose() {
    super.dispose();
  }

  //Формирование ссылки
  urlCreate() {
    formatNow = formatDate(now, [dd, '-', mm, '-', yyyy]);
    weekDay = DateFormat('EEEE').format(now);
    if (groupName == null || groupName.length < 2) {
      url = " ";
    } else {
      url = API_key + "schedule/student/" + groupName + "?start=" + formatNow;
    }
  }

  //Функция получения и декодирования api
  Future<String> getData() async {
    var response = await http.get(Uri.encodeFull(url),
        headers: {"Content-Type": 'application/json; charset=utf-8'});
    setState(() {
      data = json.decode(response.body)['lessons'];
    });
    return "Success";
  }

  //Следующий и предыдущий день
  nextDay() {
    setState(() {
      now = now.add(Duration(hours: 24));
      urlCreate();
      getData();
    });
  }

  prevDay() {
    setState(() {
      now = now.add(Duration(hours: -24));
      urlCreate();
      getData();
    });

  }

  //Получение списка занятий
  Widget getList() {
    //Если данные не получены или равны null
    if (data == null || data.length < 1) {
      if (groupName == null || url == " ") {
        return Center(
          child: Container(
            child: Center(
                child: Text(
              "Введите название курса в настройках",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )),
          ),
        );
      }
      return Center(
        child: Text(
          waiter,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      );
    }

    if (groupName == "Не найден") {
      return Center(
        child: Container(
          child: Center(
              child: Text(
            "Неверно введен курс",
            style: TextStyle(fontSize: 35),
          )),
        ),
      );
    } else {
      //Если день недели - воскресенье
      if (weekDay == "Sunday") {
        return Center(
          child: Container(
            child: Center(
                child: Text(
              "Выходной день",
              style: TextStyle(fontSize: 35),
            )),
          ),
        );
      } else {
        //Если будний день
        return ListView.separated(
          itemCount: data[0]['lesson'].length,
          itemBuilder: (BuildContext context, int index) {
            return getListItem(index);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        );
      }
    }
  }

  //Функция формирования списка пар
  Widget getListItem(int i) {
    if (i == 0) {
      return Container(
        margin: EdgeInsets.all(4.0),
        child: Padding(
            padding: EdgeInsets.all(4),
            child: ListTile(
              leading: Text("08.30-10.05"),
              subtitle: Text(
                  utf8convert(data[0]['lesson'][i]['subject'].toString()) +
                      "\n" +
                      utf8convert(data[0]['lesson'][i]['info'].toString())),
            )),
      );
    }
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Padding(
          padding: EdgeInsets.all(4),
          child: ListTile(
            leading: Text(data[0]['lesson'][i]['time']),
            subtitle: Text(
                utf8convert(data[0]['lesson'][i]['subject'].toString()) +
                    "\n" +
                    utf8convert(data[0]['lesson'][i]['info'].toString())),
          )),
    );
  }

  TextEditingController groupsController = TextEditingController();

  //Основной экран расписания
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity < 0) {
          nextDay();
        } else if (details.primaryVelocity > 0) {
          prevDay();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: RotateAnimatedTextKit(
            repeatForever: true,
            alignment: Alignment.centerLeft,
            text: groupName == null
                ? ["Расписание ", "курса"]
                : [groupName, "Расписание"],
            textStyle: TextStyle(
              fontSize: width / 16.6,
            ),
          ),
          backgroundColor: deepBlue,
        ),
        bottomNavigationBar: BottomAppBar(
            color: deepBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  formatNow,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Text(
                  rusWeekDay(weekDay),
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )
              ],
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(),
            Expanded(
                child: getList()),
            Divider(),
          ],
        ),
      ),
    );
  }
}
