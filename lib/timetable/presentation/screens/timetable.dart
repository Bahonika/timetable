import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetable/general/components/buttons/calendar_button.dart';
import 'package:timetable/general/components/buttons/custom_floating_action_button.dart';
import 'package:timetable/general/components/custom_app_bar.dart';
import 'package:timetable/general/components/dividers/custom_divider.dart';
import 'package:timetable/general/components/tiles/day_tile.dart';
import 'package:timetable/general/components/tiles/lesson_tile.dart';
import 'package:timetable/timetable/domain/models/lesson_model.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({Key? key}) : super(key: key);

  void _nextDay() {
    //todo implement
  }

  void _prevDay() {
    //todo implement
  }

  void _onCalendarButton() {
    //todo implement
  }

  void _onHorizontalDragEnd(DragEndDetails details) {}

  void _onHorizontalDragUpdate(DragUpdateDetails details) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Hardcode', // todo убрать хардкод
          actions: [
            CalendarButton(
              onPressed: _onCalendarButton,
            )
          ],
          onBack: () {
            Navigator.pop(context);
          },
        ),
        body: GestureDetector(
          onHorizontalDragEnd: _onHorizontalDragEnd,
          onHorizontalDragUpdate: _onHorizontalDragUpdate,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                DayTile(dateTime: DateTime.now()),
                CustomDivider(),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: CupertinoScrollBehavior(),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) =>
                          LessonTile(
                        lessonModel: LessonModel(
                          time: '10.15-11.50',
                          subject: 'Математическое моделирование (лк/пр)',
                          info: 'Богомолов Р.А. / 208 Лен.,57',
                        ),
                      ),
                      controller: ScrollController(),
                      separatorBuilder: (context, index) => CustomDivider(),
                      padding: EdgeInsets.symmetric(vertical: 40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomFloatingActionButton(
                icon: Icons.arrow_back_sharp,
                onPressed: _prevDay,
              ),
              CustomFloatingActionButton(
                icon: Icons.arrow_forward_sharp,
                onPressed: _nextDay,
              ),
            ],
          ),
        ));
  }
}
