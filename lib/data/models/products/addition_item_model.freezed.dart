// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'addition_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdditionItemModel _$AdditionItemModelFromJson(Map<String, dynamic> json) {
  return _AdditionItemModel.fromJson(json);
}

/// @nodoc
mixin _$AdditionItemModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this AdditionItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdditionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdditionItemModelCopyWith<AdditionItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdditionItemModelCopyWith<$Res> {
  factory $AdditionItemModelCopyWith(
          AdditionItemModel value, $Res Function(AdditionItemModel) then) =
      _$AdditionItemModelCopyWithImpl<$Res, AdditionItemModel>;
  @useResult
  $Res call({String id, String name, double price});
}

/// @nodoc
class _$AdditionItemModelCopyWithImpl<$Res, $Val extends AdditionItemModel>
    implements $AdditionItemModelCopyWith<$Res> {
  _$AdditionItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdditionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdditionItemModelImplCopyWith<$Res>
    implements $AdditionItemModelCopyWith<$Res> {
  factory _$$AdditionItemModelImplCopyWith(_$AdditionItemModelImpl value,
          $Res Function(_$AdditionItemModelImpl) then) =
      __$$AdditionItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double price});
}

/// @nodoc
class __$$AdditionItemModelImplCopyWithImpl<$Res>
    extends _$AdditionItemModelCopyWithImpl<$Res, _$AdditionItemModelImpl>
    implements _$$AdditionItemModelImplCopyWith<$Res> {
  __$$AdditionItemModelImplCopyWithImpl(_$AdditionItemModelImpl _value,
      $Res Function(_$AdditionItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdditionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$AdditionItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdditionItemModelImpl implements _AdditionItemModel {
  _$AdditionItemModelImpl(
      {required this.id, required this.name, required this.price});

  factory _$AdditionItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdditionItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;

  @override
  String toString() {
    return 'AdditionItemModel(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdditionItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price);

  /// Create a copy of AdditionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdditionItemModelImplCopyWith<_$AdditionItemModelImpl> get copyWith =>
      __$$AdditionItemModelImplCopyWithImpl<_$AdditionItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdditionItemModelImplToJson(
      this,
    );
  }
}

abstract class _AdditionItemModel implements AdditionItemModel {
  factory _AdditionItemModel(
      {required final String id,
      required final String name,
      required final double price}) = _$AdditionItemModelImpl;

  factory _AdditionItemModel.fromJson(Map<String, dynamic> json) =
      _$AdditionItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;

  /// Create a copy of AdditionItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdditionItemModelImplCopyWith<_$AdditionItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
