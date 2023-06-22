// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lesson_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LessonResponseModel _$LessonResponseModelFromJson(Map<String, dynamic> json) {
  return _LessonResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LessonResponseModel {
  @JsonKey(name: 'time')
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject')
  String get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'info')
  String get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonResponseModelCopyWith<LessonResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonResponseModelCopyWith<$Res> {
  factory $LessonResponseModelCopyWith(
          LessonResponseModel value, $Res Function(LessonResponseModel) then) =
      _$LessonResponseModelCopyWithImpl<$Res, LessonResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'time') String time,
      @JsonKey(name: 'subject') String subject,
      @JsonKey(name: 'info') String info});
}

/// @nodoc
class _$LessonResponseModelCopyWithImpl<$Res, $Val extends LessonResponseModel>
    implements $LessonResponseModelCopyWith<$Res> {
  _$LessonResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? subject = null,
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LessonResponseModelCopyWith<$Res>
    implements $LessonResponseModelCopyWith<$Res> {
  factory _$$_LessonResponseModelCopyWith(_$_LessonResponseModel value,
          $Res Function(_$_LessonResponseModel) then) =
      __$$_LessonResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time') String time,
      @JsonKey(name: 'subject') String subject,
      @JsonKey(name: 'info') String info});
}

/// @nodoc
class __$$_LessonResponseModelCopyWithImpl<$Res>
    extends _$LessonResponseModelCopyWithImpl<$Res, _$_LessonResponseModel>
    implements _$$_LessonResponseModelCopyWith<$Res> {
  __$$_LessonResponseModelCopyWithImpl(_$_LessonResponseModel _value,
      $Res Function(_$_LessonResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? subject = null,
    Object? info = null,
  }) {
    return _then(_$_LessonResponseModel(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LessonResponseModel implements _LessonResponseModel {
  const _$_LessonResponseModel(
      {@JsonKey(name: 'time') required this.time,
      @JsonKey(name: 'subject') required this.subject,
      @JsonKey(name: 'info') required this.info});

  factory _$_LessonResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_LessonResponseModelFromJson(json);

  @override
  @JsonKey(name: 'time')
  final String time;
  @override
  @JsonKey(name: 'subject')
  final String subject;
  @override
  @JsonKey(name: 'info')
  final String info;

  @override
  String toString() {
    return 'LessonResponseModel(time: $time, subject: $subject, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LessonResponseModel &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, subject, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LessonResponseModelCopyWith<_$_LessonResponseModel> get copyWith =>
      __$$_LessonResponseModelCopyWithImpl<_$_LessonResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LessonResponseModelToJson(
      this,
    );
  }
}

abstract class _LessonResponseModel implements LessonResponseModel {
  const factory _LessonResponseModel(
          {@JsonKey(name: 'time') required final String time,
          @JsonKey(name: 'subject') required final String subject,
          @JsonKey(name: 'info') required final String info}) =
      _$_LessonResponseModel;

  factory _LessonResponseModel.fromJson(Map<String, dynamic> json) =
      _$_LessonResponseModel.fromJson;

  @override
  @JsonKey(name: 'time')
  String get time;
  @override
  @JsonKey(name: 'subject')
  String get subject;
  @override
  @JsonKey(name: 'info')
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_LessonResponseModelCopyWith<_$_LessonResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
