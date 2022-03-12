import 'package:flutter/material.dart';
import 'file:///E:/Flutter/Projects/timetable/lib/screens/timetables/place_timetable.dart';
import 'file:///E:/Flutter/Projects/timetable/lib/screens/timetables/teacher_timetable.dart';
import 'file:///E:/Flutter/Projects/timetable/lib/screens/apps/teachers.dart';
import 'file:///E:/Flutter/Projects/timetable/lib/screens/apps/map.dart';
import 'package:timetable/templates/lower_button.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),

            ////////////////////////////Левая верхная кнопка////////////////
            LowerButton(PlaceTimetable(), "По кабинету"),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),

            ///////////////////////////Правая верхная кнопка////////////////
            LowerButton(TeacherTimetable(), "По преподавателю"),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.02),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),

            ////////////////////////////Левая нижняя кнопка////////////////
            LowerButton(Teachers(), "Список преподавателей"),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),

            ////////////////////////////Правая нижняя кнопка////////////////
            LowerButton(Map(), "Карты корпусов"),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          ],
        ),
      ],
    );
  }
}
