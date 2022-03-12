import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetable/screens/timetables/course_timetable.dart';

import '../main.dart';

class TimetableButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      child: ButtonTheme(
        height: MediaQuery.of(context).size.height * 0.1,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 20,
            primary: deepBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Timetable()),
            );
          },
          child: Text(
            "Расписание",
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.shortestSide * 0.045,
            ),
          ),
        ),
      ),
    );
  }
}
