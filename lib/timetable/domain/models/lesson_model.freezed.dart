// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lesson_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LessonModel {
  String get time => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get info => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LessonModelCopyWith<LessonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonModelCopyWith<$Res> {
  factory $LessonModelCopyWith(
          LessonModel value, $Res Function(LessonModel) then) =
      _$LessonModelCopyWithImpl<$Res, LessonModel>;
  @useResult
  $Res call({String time, String subject, String info});
}

/// @nodoc
class _$LessonModelCopyWithImpl<$Res, $Val extends LessonModel>
    implements $LessonModelCopyWith<$Res> {
  _$LessonModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_LessonModelCopyWith<$Res>
    implements $LessonModelCopyWith<$Res> {
  factory _$$_LessonModelCopyWith(
          _$_LessonModel value, $Res Function(_$_LessonModel) then) =
      __$$_LessonModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String time, String subject, String info});
}

/// @nodoc
class __$$_LessonModelCopyWithImpl<$Res>
    extends _$LessonModelCopyWithImpl<$Res, _$_LessonModel>
    implements _$$_LessonModelCopyWith<$Res> {
  __$$_LessonModelCopyWithImpl(
      _$_LessonModel _value, $Res Function(_$_LessonModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? subject = null,
    Object? info = null,
  }) {
    return _then(_$_LessonModel(
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

class _$_LessonModel implements _LessonModel {
  const _$_LessonModel(
      {required this.time, required this.subject, required this.info});

  @override
  final String time;
  @override
  final String subject;
  @override
  final String info;

  @override
  String toString() {
    return 'LessonModel(time: $time, subject: $subject, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LessonModel &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time, subject, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LessonModelCopyWith<_$_LessonModel> get copyWith =>
      __$$_LessonModelCopyWithImpl<_$_LessonModel>(this, _$identity);
}

abstract class _LessonModel implements LessonModel {
  const factory _LessonModel(
      {required final String time,
      required final String subject,
      required final String info}) = _$_LessonModel;

  @override
  String get time;
  @override
  String get subject;
  @override
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_LessonModelCopyWith<_$_LessonModel> get copyWith =>
      throw _privateConstructorUsedError;
}
