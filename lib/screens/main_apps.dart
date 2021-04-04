import 'package:flutter/material.dart';
import 'file:///E:/Flutter/Projects/timetable/lib/templates/timetable_button.dart';
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
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
      ),
      TimetableButton(),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.13,
      ),
      MainMenu(),
    ]);
  }
}
