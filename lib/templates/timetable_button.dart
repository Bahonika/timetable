import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetable/screens/timetables/course_timetable.dart';

import '../main.dart';

class TimetableButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.96,
      child: ButtonTheme(
        height: MediaQuery.of(context).size.height * 0.088,
        child: RaisedButton(
          elevation: 20,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Timetable()),
            );
          },
          color: deepBlue,
          splashColor: lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(
            "Расписание",
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.045,
            ),
          ),
        ),
      ),
    );
  }
}
