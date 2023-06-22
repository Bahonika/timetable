import 'package:flutter/material.dart';
import 'package:timetable/internal/context_extensions.dart';
import 'package:timetable/timetable/domain/models/lesson_model.dart';

class LessonTile extends StatelessWidget {
  const LessonTile({
    required this.lessonModel,
    Key? key,
  }) : super(key: key);

  final LessonModel lessonModel;



  @override
  Widget build(BuildContext context) {
    String time = lessonModel.time.replaceAll('.', ':').replaceFirst('-', '');
    String bottomTime = time.substring(time.length ~/ 2);
    String topTime = time.substring(0, time.length ~/ 2);
    return Container(
      height: 68,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lessonModel.subject,
                style: context.typography.body2,
              ),
              Text(
                lessonModel.info,
                style: context.typography.body2.copyWith(
                  color: context.colors.deepBlue,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                topTime,
                style: context.typography.body2,
              ),
              Text(
                bottomTime,
                style: context.typography.body2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
