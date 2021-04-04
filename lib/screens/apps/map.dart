import 'package:flutter/cupertino.dart';
import 'package:timetable/main.dart';
import 'package:flutter/material.dart';
import 'package:timetable/templates/bubbles.dart';
import '../../templates/text_decoration.dart';

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
        backgroundColor: lightBlue,
        appBar: AppBar(
          centerTitle: false,
          title: DecoratedText("Карты корпусов"),
          backgroundColor: deepBlue,
        ),
        body: Stack(
          children: [
            Bubbles(),
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
