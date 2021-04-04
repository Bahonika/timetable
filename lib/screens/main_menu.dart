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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ////////////////////////////Левая верхная кнопка////////////////
            LowerButton(PlaceTimetable(), "Расписание по кабинету"),
            ///////////////////////////Правая верхная кнопка////////////////
            LowerButton(TeacherTimetable(), "Расписание по преподавателю"),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.width * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ////////////////////////////Левая нижняя кнопка////////////////
            LowerButton(Teachers(), "Список преподавателей"),
            ////////////////////////////Правая нижняя кнопка////////////////
            LowerButton(Map(), "Карты корпусов"),
          ],
        ),
      ],
    );
  }
}
