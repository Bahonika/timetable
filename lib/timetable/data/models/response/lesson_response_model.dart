// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_response_model.freezed.dart';
part 'lesson_response_model.g.dart';

@freezed
class LessonResponseModel with _$LessonResponseModel {
  const factory LessonResponseModel({
    @JsonKey(name: 'time') required String time,
    @JsonKey(name: 'subject') required String subject,
    @JsonKey(name: 'info') required String info,
  }) = _LessonResponseModel;

  factory LessonResponseModel.fromJson(Map<String, Object?> json) =>
      _$LessonResponseModelFromJson(json);
}
