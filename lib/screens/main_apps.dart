import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetable/screens/timetables/course_timetable.dart';
import '../main.dart';
import 'main_menu.dart';

class MainApps extends StatefulWidget {
  @override
  _MainAppsState createState() => _MainAppsState();
}

class _MainAppsState extends State<MainApps> {
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
    return Container(
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.94,
          height: MediaQuery.of(context).size.height * 0.08,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
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
                fontSize: MediaQuery.of(context).size.height * 0.045,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
        ),
        MainMenu(),
      ]),
    );
  }
}
