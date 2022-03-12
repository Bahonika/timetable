import 'dart:async';
import 'package:timetable/for_timetables.dart';
import 'package:timetable/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class Timetable extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> with ForTimetablesMixin {
  List data;
  String url;

  static DateTime now = DateTime.now();

  static String formatNow = formatDate(now, [dd, '-', mm, '-', yyyy]);

  static String weekDay = DateFormat('EEEE').format(now);

  String waiter = "Пожалуйста подождите...";

  //Инициализация экрана
  @override
  void initState() {
    super.initState();

    now = DateTime.now();
    urlCreate();
    getData();

    setState(() {
      getData();
    });
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
            "Неверно введен курс в настройках",
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
          toolbarHeight: MediaQuery.of(context).size.shortestSide * 0.11 < 55
              ? 55
              : MediaQuery.of(context).size.shortestSide * 0.11 > 85
                  ? 85
                  : MediaQuery.of(context).size.shortestSide * 0.11,
          title: Text(
            groupName == null ? "Расписание" : groupName,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: deepBlue,
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: DateTime(2010),
                        lastDate: DateTime(2100))
                    .then((date) {
                  if (date != null) {
                    setState(() {
                      now = date;
                      urlCreate();
                      getData();
                    });
                  }
                });
              },
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () => prevDay(),
              child: Icon(Icons.arrow_back_rounded),
              backgroundColor: lightBlue,
              heroTag: "back_button",
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            FloatingActionButton(
              onPressed: () => nextDay(),
              child: Icon(Icons.arrow_forward_rounded),
              backgroundColor: lightBlue,
              heroTag: "forward_button",
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: BottomAppBar(
            color: deepBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  formatNow,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.shortestSide *
                          0.06 >
                          40
                          ? 40
                          : MediaQuery.of(context).size.shortestSide * 0.06 < 14
                          ? 14
                          : MediaQuery.of(context).size.shortestSide * 0.06,
                      color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.shortestSide * 0.05 < 40
                      ? 40
                      : MediaQuery.of(context).size.shortestSide * 0.05 > 65
                          ? 65
                          : MediaQuery.of(context).size.shortestSide * 0.05,
                  width: 0,
                ),
                Text(
                  rusWeekDay(weekDay),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.shortestSide *
                                  0.06 >
                              40
                          ? 40
                          : MediaQuery.of(context).size.shortestSide * 0.06 < 14
                              ? 14
                              : MediaQuery.of(context).size.shortestSide * 0.06,
                      color: Colors.white),
                )
              ],
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(),
            Expanded(child: getList()),
            Divider(),
            ListTile(
              title: Text(" "),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
