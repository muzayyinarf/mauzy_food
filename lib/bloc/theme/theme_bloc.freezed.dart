// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) toogleTheme,
    required TResult Function() getTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool value)? toogleTheme,
    TResult? Function()? getTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? toogleTheme,
    TResult Function()? getTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToogleTheme value) toogleTheme,
    required TResult Function(_GetTheme value) getTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToogleTheme value)? toogleTheme,
    TResult? Function(_GetTheme value)? getTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToogleTheme value)? toogleTheme,
    TResult Function(_GetTheme value)? getTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ToogleThemeImplCopyWith<$Res> {
  factory _$$ToogleThemeImplCopyWith(
          _$ToogleThemeImpl value, $Res Function(_$ToogleThemeImpl) then) =
      __$$ToogleThemeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$ToogleThemeImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$ToogleThemeImpl>
    implements _$$ToogleThemeImplCopyWith<$Res> {
  __$$ToogleThemeImplCopyWithImpl(
      _$ToogleThemeImpl _value, $Res Function(_$ToogleThemeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ToogleThemeImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToogleThemeImpl implements _ToogleTheme {
  const _$ToogleThemeImpl(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'ThemeEvent.toogleTheme(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToogleThemeImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToogleThemeImplCopyWith<_$ToogleThemeImpl> get copyWith =>
      __$$ToogleThemeImplCopyWithImpl<_$ToogleThemeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) toogleTheme,
    required TResult Function() getTheme,
  }) {
    return toogleTheme(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool value)? toogleTheme,
    TResult? Function()? getTheme,
  }) {
    return toogleTheme?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? toogleTheme,
    TResult Function()? getTheme,
    required TResult orElse(),
  }) {
    if (toogleTheme != null) {
      return toogleTheme(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToogleTheme value) toogleTheme,
    required TResult Function(_GetTheme value) getTheme,
  }) {
    return toogleTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToogleTheme value)? toogleTheme,
    TResult? Function(_GetTheme value)? getTheme,
  }) {
    return toogleTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToogleTheme value)? toogleTheme,
    TResult Function(_GetTheme value)? getTheme,
    required TResult orElse(),
  }) {
    if (toogleTheme != null) {
      return toogleTheme(this);
    }
    return orElse();
  }
}

abstract class _ToogleTheme implements ThemeEvent {
  const factory _ToogleTheme(final bool value) = _$ToogleThemeImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$ToogleThemeImplCopyWith<_$ToogleThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetThemeImplCopyWith<$Res> {
  factory _$$GetThemeImplCopyWith(
          _$GetThemeImpl value, $Res Function(_$GetThemeImpl) then) =
      __$$GetThemeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetThemeImplCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$GetThemeImpl>
    implements _$$GetThemeImplCopyWith<$Res> {
  __$$GetThemeImplCopyWithImpl(
      _$GetThemeImpl _value, $Res Function(_$GetThemeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetThemeImpl implements _GetTheme {
  const _$GetThemeImpl();

  @override
  String toString() {
    return 'ThemeEvent.getTheme()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetThemeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool value) toogleTheme,
    required TResult Function() getTheme,
  }) {
    return getTheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool value)? toogleTheme,
    TResult? Function()? getTheme,
  }) {
    return getTheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool value)? toogleTheme,
    TResult Function()? getTheme,
    required TResult orElse(),
  }) {
    if (getTheme != null) {
      return getTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToogleTheme value) toogleTheme,
    required TResult Function(_GetTheme value) getTheme,
  }) {
    return getTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToogleTheme value)? toogleTheme,
    TResult? Function(_GetTheme value)? getTheme,
  }) {
    return getTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToogleTheme value)? toogleTheme,
    TResult Function(_GetTheme value)? getTheme,
    required TResult orElse(),
  }) {
    if (getTheme != null) {
      return getTheme(this);
    }
    return orElse();
  }
}

abstract class _GetTheme implements ThemeEvent {
  const factory _GetTheme() = _$GetThemeImpl;
}

/// @nodoc
mixin _$ThemeState {
  bool get isDarkmode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeStateCopyWith<ThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res, ThemeState>;
  @useResult
  $Res call({bool isDarkmode});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res, $Val extends ThemeState>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkmode = null,
  }) {
    return _then(_value.copyWith(
      isDarkmode: null == isDarkmode
          ? _value.isDarkmode
          : isDarkmode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeStateImplCopyWith<$Res>
    implements $ThemeStateCopyWith<$Res> {
  factory _$$ThemeStateImplCopyWith(
          _$ThemeStateImpl value, $Res Function(_$ThemeStateImpl) then) =
      __$$ThemeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDarkmode});
}

/// @nodoc
class __$$ThemeStateImplCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$ThemeStateImpl>
    implements _$$ThemeStateImplCopyWith<$Res> {
  __$$ThemeStateImplCopyWithImpl(
      _$ThemeStateImpl _value, $Res Function(_$ThemeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDarkmode = null,
  }) {
    return _then(_$ThemeStateImpl(
      isDarkmode: null == isDarkmode
          ? _value.isDarkmode
          : isDarkmode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ThemeStateImpl implements _ThemeState {
  const _$ThemeStateImpl({this.isDarkmode = false});

  @override
  @JsonKey()
  final bool isDarkmode;

  @override
  String toString() {
    return 'ThemeState(isDarkmode: $isDarkmode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeStateImpl &&
            (identical(other.isDarkmode, isDarkmode) ||
                other.isDarkmode == isDarkmode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDarkmode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeStateImplCopyWith<_$ThemeStateImpl> get copyWith =>
      __$$ThemeStateImplCopyWithImpl<_$ThemeStateImpl>(this, _$identity);
}

abstract class _ThemeState implements ThemeState {
  const factory _ThemeState({final bool isDarkmode}) = _$ThemeStateImpl;

  @override
  bool get isDarkmode;
  @override
  @JsonKey(ignore: true)
  _$$ThemeStateImplCopyWith<_$ThemeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
