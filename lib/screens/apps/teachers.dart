import 'package:timetable/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Teachers extends StatefulWidget {
  @override
  _TeachersState createState() => _TeachersState();
}

class _TeachersState extends State<Teachers> {
  List data;

  static String utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  Future<String> getData() async {
    var response = await http.get(
        Uri.tryParse(
            API_key + "teachers"),
        headers: {});
    setState(() {
      data = json.decode(response.body);
      data.sort((a, b) => a.compareTo(b));
    });
    return "Success";
  }

  Widget getList() {
    if (data == null || data.length < 1) {
      return Stack(
        children: [
          Center(child: Text("Пожалуйста подождите...", style: TextStyle(color: Colors.black, fontSize: 20),),
          ),
        ],
      );

    }
    return ListView.separated(
      itemCount: data?.length,
      itemBuilder: (BuildContext context, int index) {
        return getListItem(index);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget getListItem(int i) {
    return Container(
      child: Container(
        margin: EdgeInsets.all(4.0),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Text(
            utf8convert(data[i].toString()),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.shortestSide * 0.11 < 55
            ? 55
            : MediaQuery.of(context).size.shortestSide * 0.11 > 85
            ? 85
            : MediaQuery.of(context).size.shortestSide * 0.11,
        title: Text(
          "Преподаватели",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.shortestSide * 0.06,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: deepBlue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(margin: EdgeInsets.all(10), child: getList()),
          )
        ],
      ),
    );
  }
}
