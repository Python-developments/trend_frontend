// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_tracking_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationTrackingMessageModel _$LocationTrackingMessageModelFromJson(
    Map<String, dynamic> json) {
  switch (json['event']) {
    case 'order:tracking:update':
      return NewLocationMessage.fromJson(json);
    case 'tracking:error':
      return FinishTrackingMessage.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'event',
          'LocationTrackingMessageModel',
          'Invalid union type "${json['event']}"!');
  }
}

/// @nodoc
mixin _$LocationTrackingMessageModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude,
            String driverName, String driverPhone)
        newLocationMessage,
    required TResult Function() finishTrackingMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude, String driverName,
            String driverPhone)?
        newLocationMessage,
    TResult? Function()? finishTrackingMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude, String driverName,
            String driverPhone)?
        newLocationMessage,
    TResult Function()? finishTrackingMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewLocationMessage value) newLocationMessage,
    required TResult Function(FinishTrackingMessage value)
        finishTrackingMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewLocationMessage value)? newLocationMessage,
    TResult? Function(FinishTrackingMessage value)? finishTrackingMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewLocationMessage value)? newLocationMessage,
    TResult Function(FinishTrackingMessage value)? finishTrackingMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this LocationTrackingMessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationTrackingMessageModelCopyWith<$Res> {
  factory $LocationTrackingMessageModelCopyWith(
          LocationTrackingMessageModel value,
          $Res Function(LocationTrackingMessageModel) then) =
      _$LocationTrackingMessageModelCopyWithImpl<$Res,
          LocationTrackingMessageModel>;
}

/// @nodoc
class _$LocationTrackingMessageModelCopyWithImpl<$Res,
        $Val extends LocationTrackingMessageModel>
    implements $LocationTrackingMessageModelCopyWith<$Res> {
  _$LocationTrackingMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationTrackingMessageModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NewLocationMessageImplCopyWith<$Res> {
  factory _$$NewLocationMessageImplCopyWith(_$NewLocationMessageImpl value,
          $Res Function(_$NewLocationMessageImpl) then) =
      __$$NewLocationMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String driverName,
      String driverPhone});
}

/// @nodoc
class __$$NewLocationMessageImplCopyWithImpl<$Res>
    extends _$LocationTrackingMessageModelCopyWithImpl<$Res,
        _$NewLocationMessageImpl>
    implements _$$NewLocationMessageImplCopyWith<$Res> {
  __$$NewLocationMessageImplCopyWithImpl(_$NewLocationMessageImpl _value,
      $Res Function(_$NewLocationMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationTrackingMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? driverName = null,
    Object? driverPhone = null,
  }) {
    return _then(_$NewLocationMessageImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      driverPhone: null == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewLocationMessageImpl extends NewLocationMessage {
  _$NewLocationMessageImpl(
      {required this.latitude,
      required this.longitude,
      required this.driverName,
      required this.driverPhone,
      final String? $type})
      : $type = $type ?? 'order:tracking:update',
        super._();

  factory _$NewLocationMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewLocationMessageImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String driverName;
  @override
  final String driverPhone;

  @JsonKey(name: 'event')
  final String $type;

  @override
  String toString() {
    return 'LocationTrackingMessageModel.newLocationMessage(latitude: $latitude, longitude: $longitude, driverName: $driverName, driverPhone: $driverPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewLocationMessageImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, driverName, driverPhone);

  /// Create a copy of LocationTrackingMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewLocationMessageImplCopyWith<_$NewLocationMessageImpl> get copyWith =>
      __$$NewLocationMessageImplCopyWithImpl<_$NewLocationMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude,
            String driverName, String driverPhone)
        newLocationMessage,
    required TResult Function() finishTrackingMessage,
  }) {
    return newLocationMessage(latitude, longitude, driverName, driverPhone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude, String driverName,
            String driverPhone)?
        newLocationMessage,
    TResult? Function()? finishTrackingMessage,
  }) {
    return newLocationMessage?.call(
        latitude, longitude, driverName, driverPhone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude, String driverName,
            String driverPhone)?
        newLocationMessage,
    TResult Function()? finishTrackingMessage,
    required TResult orElse(),
  }) {
    if (newLocationMessage != null) {
      return newLocationMessage(latitude, longitude, driverName, driverPhone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewLocationMessage value) newLocationMessage,
    required TResult Function(FinishTrackingMessage value)
        finishTrackingMessage,
  }) {
    return newLocationMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewLocationMessage value)? newLocationMessage,
    TResult? Function(FinishTrackingMessage value)? finishTrackingMessage,
  }) {
    return newLocationMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewLocationMessage value)? newLocationMessage,
    TResult Function(FinishTrackingMessage value)? finishTrackingMessage,
    required TResult orElse(),
  }) {
    if (newLocationMessage != null) {
      return newLocationMessage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NewLocationMessageImplToJson(
      this,
    );
  }
}

abstract class NewLocationMessage extends LocationTrackingMessageModel {
  factory NewLocationMessage(
      {required final double latitude,
      required final double longitude,
      required final String driverName,
      required final String driverPhone}) = _$NewLocationMessageImpl;
  NewLocationMessage._() : super._();

  factory NewLocationMessage.fromJson(Map<String, dynamic> json) =
      _$NewLocationMessageImpl.fromJson;

  double get latitude;
  double get longitude;
  String get driverName;
  String get driverPhone;

  /// Create a copy of LocationTrackingMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewLocationMessageImplCopyWith<_$NewLocationMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishTrackingMessageImplCopyWith<$Res> {
  factory _$$FinishTrackingMessageImplCopyWith(
          _$FinishTrackingMessageImpl value,
          $Res Function(_$FinishTrackingMessageImpl) then) =
      __$$FinishTrackingMessageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FinishTrackingMessageImplCopyWithImpl<$Res>
    extends _$LocationTrackingMessageModelCopyWithImpl<$Res,
        _$FinishTrackingMessageImpl>
    implements _$$FinishTrackingMessageImplCopyWith<$Res> {
  __$$FinishTrackingMessageImplCopyWithImpl(_$FinishTrackingMessageImpl _value,
      $Res Function(_$FinishTrackingMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationTrackingMessageModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$FinishTrackingMessageImpl extends FinishTrackingMessage {
  _$FinishTrackingMessageImpl({final String? $type})
      : $type = $type ?? 'tracking:error',
        super._();

  factory _$FinishTrackingMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinishTrackingMessageImplFromJson(json);

  @JsonKey(name: 'event')
  final String $type;

  @override
  String toString() {
    return 'LocationTrackingMessageModel.finishTrackingMessage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinishTrackingMessageImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double latitude, double longitude,
            String driverName, String driverPhone)
        newLocationMessage,
    required TResult Function() finishTrackingMessage,
  }) {
    return finishTrackingMessage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double latitude, double longitude, String driverName,
            String driverPhone)?
        newLocationMessage,
    TResult? Function()? finishTrackingMessage,
  }) {
    return finishTrackingMessage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double latitude, double longitude, String driverName,
            String driverPhone)?
        newLocationMessage,
    TResult Function()? finishTrackingMessage,
    required TResult orElse(),
  }) {
    if (finishTrackingMessage != null) {
      return finishTrackingMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewLocationMessage value) newLocationMessage,
    required TResult Function(FinishTrackingMessage value)
        finishTrackingMessage,
  }) {
    return finishTrackingMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewLocationMessage value)? newLocationMessage,
    TResult? Function(FinishTrackingMessage value)? finishTrackingMessage,
  }) {
    return finishTrackingMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewLocationMessage value)? newLocationMessage,
    TResult Function(FinishTrackingMessage value)? finishTrackingMessage,
    required TResult orElse(),
  }) {
    if (finishTrackingMessage != null) {
      return finishTrackingMessage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FinishTrackingMessageImplToJson(
      this,
    );
  }
}

abstract class FinishTrackingMessage extends LocationTrackingMessageModel {
  factory FinishTrackingMessage() = _$FinishTrackingMessageImpl;
  FinishTrackingMessage._() : super._();

  factory FinishTrackingMessage.fromJson(Map<String, dynamic> json) =
      _$FinishTrackingMessageImpl.fromJson;
}
