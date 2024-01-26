// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scheduling_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SchedulingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getScheduling,
    required TResult Function(bool value) toogleScheduling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getScheduling,
    TResult? Function(bool value)? toogleScheduling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getScheduling,
    TResult Function(bool value)? toogleScheduling,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetScheduling value) getScheduling,
    required TResult Function(_ToogleScheduling value) toogleScheduling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetScheduling value)? getScheduling,
    TResult? Function(_ToogleScheduling value)? toogleScheduling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetScheduling value)? getScheduling,
    TResult Function(_ToogleScheduling value)? toogleScheduling,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchedulingEventCopyWith<$Res> {
  factory $SchedulingEventCopyWith(
          SchedulingEvent value, $Res Function(SchedulingEvent) then) =
      _$SchedulingEventCopyWithImpl<$Res, SchedulingEvent>;
}

/// @nodoc
class _$SchedulingEventCopyWithImpl<$Res, $Val extends SchedulingEvent>
    implements $SchedulingEventCopyWith<$Res> {
  _$SchedulingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetSchedulingImplCopyWith<$Res> {
  factory _$$GetSchedulingImplCopyWith(
          _$GetSchedulingImpl value, $Res Function(_$GetSchedulingImpl) then) =
      __$$GetSchedulingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSchedulingImplCopyWithImpl<$Res>
    extends _$SchedulingEventCopyWithImpl<$Res, _$GetSchedulingImpl>
    implements _$$GetSchedulingImplCopyWith<$Res> {
  __$$GetSchedulingImplCopyWithImpl(
      _$GetSchedulingImpl _value, $Res Function(_$GetSchedulingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetSchedulingImpl
    with DiagnosticableTreeMixin
    implements _GetScheduling {
  const _$GetSchedulingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SchedulingEvent.getScheduling()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'SchedulingEvent.getScheduling'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSchedulingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getScheduling,
    required TResult Function(bool value) toogleScheduling,
  }) {
    return getScheduling();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getScheduling,
    TResult? Function(bool value)? toogleScheduling,
  }) {
    return getScheduling?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getScheduling,
    TResult Function(bool value)? toogleScheduling,
    required TResult orElse(),
  }) {
    if (getScheduling != null) {
      return getScheduling();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetScheduling value) getScheduling,
    required TResult Function(_ToogleScheduling value) toogleScheduling,
  }) {
    return getScheduling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetScheduling value)? getScheduling,
    TResult? Function(_ToogleScheduling value)? toogleScheduling,
  }) {
    return getScheduling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetScheduling value)? getScheduling,
    TResult Function(_ToogleScheduling value)? toogleScheduling,
    required TResult orElse(),
  }) {
    if (getScheduling != null) {
      return getScheduling(this);
    }
    return orElse();
  }
}

abstract class _GetScheduling implements SchedulingEvent {
  const factory _GetScheduling() = _$GetSchedulingImpl;
}

/// @nodoc
abstract class _$$ToogleSchedulingImplCopyWith<$Res> {
  factory _$$ToogleSchedulingImplCopyWith(_$ToogleSchedulingImpl value,
          $Res Function(_$ToogleSchedulingImpl) then) =
      __$$ToogleSchedulingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$ToogleSchedulingImplCopyWithImpl<$Res>
    extends _$SchedulingEventCopyWithImpl<$Res, _$ToogleSchedulingImpl>
    implements _$$ToogleSchedulingImplCopyWith<$Res> {
  __$$ToogleSchedulingImplCopyWithImpl(_$ToogleSchedulingImpl _value,
      $Res Function(_$ToogleSchedulingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ToogleSchedulingImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToogleSchedulingImpl
    with DiagnosticableTreeMixin
    implements _ToogleScheduling {
  const _$ToogleSchedulingImpl(this.value);

  @override
  final bool value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SchedulingEvent.toogleScheduling(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SchedulingEvent.toogleScheduling'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToogleSchedulingImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToogleSchedulingImplCopyWith<_$ToogleSchedulingImpl> get copyWith =>
      __$$ToogleSchedulingImplCopyWithImpl<_$ToogleSchedulingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getScheduling,
    required TResult Function(bool value) toogleScheduling,
  }) {
    return toogleScheduling(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getScheduling,
    TResult? Function(bool value)? toogleScheduling,
  }) {
    return toogleScheduling?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getScheduling,
    TResult Function(bool value)? toogleScheduling,
    required TResult orElse(),
  }) {
    if (toogleScheduling != null) {
      return toogleScheduling(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetScheduling value) getScheduling,
    required TResult Function(_ToogleScheduling value) toogleScheduling,
  }) {
    return toogleScheduling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetScheduling value)? getScheduling,
    TResult? Function(_ToogleScheduling value)? toogleScheduling,
  }) {
    return toogleScheduling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetScheduling value)? getScheduling,
    TResult Function(_ToogleScheduling value)? toogleScheduling,
    required TResult orElse(),
  }) {
    if (toogleScheduling != null) {
      return toogleScheduling(this);
    }
    return orElse();
  }
}

abstract class _ToogleScheduling implements SchedulingEvent {
  const factory _ToogleScheduling(final bool value) = _$ToogleSchedulingImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$ToogleSchedulingImplCopyWith<_$ToogleSchedulingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SchedulingState {
  bool get isScheduled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SchedulingStateCopyWith<SchedulingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchedulingStateCopyWith<$Res> {
  factory $SchedulingStateCopyWith(
          SchedulingState value, $Res Function(SchedulingState) then) =
      _$SchedulingStateCopyWithImpl<$Res, SchedulingState>;
  @useResult
  $Res call({bool isScheduled});
}

/// @nodoc
class _$SchedulingStateCopyWithImpl<$Res, $Val extends SchedulingState>
    implements $SchedulingStateCopyWith<$Res> {
  _$SchedulingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScheduled = null,
  }) {
    return _then(_value.copyWith(
      isScheduled: null == isScheduled
          ? _value.isScheduled
          : isScheduled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SchedulingStateImplCopyWith<$Res>
    implements $SchedulingStateCopyWith<$Res> {
  factory _$$SchedulingStateImplCopyWith(_$SchedulingStateImpl value,
          $Res Function(_$SchedulingStateImpl) then) =
      __$$SchedulingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isScheduled});
}

/// @nodoc
class __$$SchedulingStateImplCopyWithImpl<$Res>
    extends _$SchedulingStateCopyWithImpl<$Res, _$SchedulingStateImpl>
    implements _$$SchedulingStateImplCopyWith<$Res> {
  __$$SchedulingStateImplCopyWithImpl(
      _$SchedulingStateImpl _value, $Res Function(_$SchedulingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScheduled = null,
  }) {
    return _then(_$SchedulingStateImpl(
      isScheduled: null == isScheduled
          ? _value.isScheduled
          : isScheduled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SchedulingStateImpl
    with DiagnosticableTreeMixin
    implements _SchedulingState {
  const _$SchedulingStateImpl({this.isScheduled = false});

  @override
  @JsonKey()
  final bool isScheduled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SchedulingState(isScheduled: $isScheduled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SchedulingState'))
      ..add(DiagnosticsProperty('isScheduled', isScheduled));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SchedulingStateImpl &&
            (identical(other.isScheduled, isScheduled) ||
                other.isScheduled == isScheduled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isScheduled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SchedulingStateImplCopyWith<_$SchedulingStateImpl> get copyWith =>
      __$$SchedulingStateImplCopyWithImpl<_$SchedulingStateImpl>(
          this, _$identity);
}

abstract class _SchedulingState implements SchedulingState {
  const factory _SchedulingState({final bool isScheduled}) =
      _$SchedulingStateImpl;

  @override
  bool get isScheduled;
  @override
  @JsonKey(ignore: true)
  _$$SchedulingStateImplCopyWith<_$SchedulingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
