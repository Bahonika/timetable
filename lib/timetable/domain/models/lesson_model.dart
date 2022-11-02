import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timetable/timetable/data/models/response/lesson_response_model.dart';

part 'lesson_model.freezed.dart';

@freezed
class LessonModel with _$LessonModel {
  const factory LessonModel({
    required String time,
    required String subject,
    required String info,
  }) = _LessonModel;

  factory LessonModel.fromResponse(LessonResponseModel lessonResponseModel) =>
      LessonModel(
        time: lessonResponseModel.time,
        subject: lessonResponseModel.subject,
        info: lessonResponseModel.info,
      );
}
