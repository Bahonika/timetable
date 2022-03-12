import 'package:flutter/cupertino.dart';
import 'package:timetable/main.dart';
import 'package:flutter/material.dart';

String mapUrl = 'https://www.svgrepo.com/show/58558/cat.svg';


class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

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
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.shortestSide * 0.11 < 55
              ? 55
              : MediaQuery.of(context).size.shortestSide * 0.11 > 85
              ? 85
              : MediaQuery.of(context).size.shortestSide * 0.11,
          title: Text(
            "Карты корпусов",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: deepBlue,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Center(
              child: Text(
                "Скоро здесь будет что-то интересное",
                style: TextStyle(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
        );
  }
}
