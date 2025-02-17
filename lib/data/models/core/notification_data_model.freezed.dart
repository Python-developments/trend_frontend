// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationDataModel _$NotificationDataModelFromJson(
    Map<String, dynamic> json) {
  switch (json['topic']) {
    case 'product':
      return _Product.fromJson(json);
    case 'vendor':
      return _Vendor.fromJson(json);
    case 'order':
      return _Order.fromJson(json);
    case 'event':
      return _Event.fromJson(json);
    case 'cart':
      return _Cart.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'topic', 'NotificationDataModel',
          'Invalid union type "${json['topic']}"!');
  }
}

/// @nodoc
mixin _$NotificationDataModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) product,
    required TResult Function(String vendorId) vendor,
    required TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)
        order,
    required TResult Function(String eventId) event,
    required TResult Function() cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? product,
    TResult? Function(String vendorId)? vendor,
    TResult? Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult? Function(String eventId)? event,
    TResult? Function()? cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? product,
    TResult Function(String vendorId)? vendor,
    TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult Function(String eventId)? event,
    TResult Function()? cart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_Vendor value) vendor,
    required TResult Function(_Order value) order,
    required TResult Function(_Event value) event,
    required TResult Function(_Cart value) cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_Vendor value)? vendor,
    TResult? Function(_Order value)? order,
    TResult? Function(_Event value)? event,
    TResult? Function(_Cart value)? cart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_Vendor value)? vendor,
    TResult Function(_Order value)? order,
    TResult Function(_Event value)? event,
    TResult Function(_Cart value)? cart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this NotificationDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationDataModelCopyWith<$Res> {
  factory $NotificationDataModelCopyWith(NotificationDataModel value,
          $Res Function(NotificationDataModel) then) =
      _$NotificationDataModelCopyWithImpl<$Res, NotificationDataModel>;
}

/// @nodoc
class _$NotificationDataModelCopyWithImpl<$Res,
        $Val extends NotificationDataModel>
    implements $NotificationDataModelCopyWith<$Res> {
  _$NotificationDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$NotificationDataModelCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$ProductImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl extends _Product {
  _$ProductImpl({required this.productId, final String? $type})
      : $type = $type ?? 'product',
        super._();

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String productId;

  @JsonKey(name: 'topic')
  final String $type;

  @override
  String toString() {
    return 'NotificationDataModel.product(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) product,
    required TResult Function(String vendorId) vendor,
    required TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)
        order,
    required TResult Function(String eventId) event,
    required TResult Function() cart,
  }) {
    return product(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? product,
    TResult? Function(String vendorId)? vendor,
    TResult? Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult? Function(String eventId)? event,
    TResult? Function()? cart,
  }) {
    return product?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? product,
    TResult Function(String vendorId)? vendor,
    TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult Function(String eventId)? event,
    TResult Function()? cart,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_Vendor value) vendor,
    required TResult Function(_Order value) order,
    required TResult Function(_Event value) event,
    required TResult Function(_Cart value) cart,
  }) {
    return product(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_Vendor value)? vendor,
    TResult? Function(_Order value)? order,
    TResult? Function(_Event value)? event,
    TResult? Function(_Cart value)? cart,
  }) {
    return product?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_Vendor value)? vendor,
    TResult Function(_Order value)? order,
    TResult Function(_Event value)? event,
    TResult Function(_Cart value)? cart,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product extends NotificationDataModel {
  factory _Product({required final String productId}) = _$ProductImpl;
  _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  String get productId;

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VendorImplCopyWith<$Res> {
  factory _$$VendorImplCopyWith(
          _$VendorImpl value, $Res Function(_$VendorImpl) then) =
      __$$VendorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String vendorId});
}

/// @nodoc
class __$$VendorImplCopyWithImpl<$Res>
    extends _$NotificationDataModelCopyWithImpl<$Res, _$VendorImpl>
    implements _$$VendorImplCopyWith<$Res> {
  __$$VendorImplCopyWithImpl(
      _$VendorImpl _value, $Res Function(_$VendorImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorId = null,
  }) {
    return _then(_$VendorImpl(
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorImpl extends _Vendor {
  _$VendorImpl({required this.vendorId, final String? $type})
      : $type = $type ?? 'vendor',
        super._();

  factory _$VendorImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorImplFromJson(json);

  @override
  final String vendorId;

  @JsonKey(name: 'topic')
  final String $type;

  @override
  String toString() {
    return 'NotificationDataModel.vendor(vendorId: $vendorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorImpl &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vendorId);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorImplCopyWith<_$VendorImpl> get copyWith =>
      __$$VendorImplCopyWithImpl<_$VendorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) product,
    required TResult Function(String vendorId) vendor,
    required TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)
        order,
    required TResult Function(String eventId) event,
    required TResult Function() cart,
  }) {
    return vendor(vendorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? product,
    TResult? Function(String vendorId)? vendor,
    TResult? Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult? Function(String eventId)? event,
    TResult? Function()? cart,
  }) {
    return vendor?.call(vendorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? product,
    TResult Function(String vendorId)? vendor,
    TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult Function(String eventId)? event,
    TResult Function()? cart,
    required TResult orElse(),
  }) {
    if (vendor != null) {
      return vendor(vendorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_Vendor value) vendor,
    required TResult Function(_Order value) order,
    required TResult Function(_Event value) event,
    required TResult Function(_Cart value) cart,
  }) {
    return vendor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_Vendor value)? vendor,
    TResult? Function(_Order value)? order,
    TResult? Function(_Event value)? event,
    TResult? Function(_Cart value)? cart,
  }) {
    return vendor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_Vendor value)? vendor,
    TResult Function(_Order value)? order,
    TResult Function(_Event value)? event,
    TResult Function(_Cart value)? cart,
    required TResult orElse(),
  }) {
    if (vendor != null) {
      return vendor(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorImplToJson(
      this,
    );
  }
}

abstract class _Vendor extends NotificationDataModel {
  factory _Vendor({required final String vendorId}) = _$VendorImpl;
  _Vendor._() : super._();

  factory _Vendor.fromJson(Map<String, dynamic> json) = _$VendorImpl.fromJson;

  String get vendorId;

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorImplCopyWith<_$VendorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String orderId,
      @JsonKey(name: 'oId', defaultValue: Global.generateDefaultValue ? '1' : null)
      String orderNumber,
      @JsonKey(
          name: 'event',
          defaultValue: Global.generateDefaultValue
              ? OrderNotificationType.orderPreparing
              : null)
      OrderNotificationType notificationType,
      @JsonKey(
          name: 'status',
          defaultValue:
              Global.generateDefaultValue ? OrderStatus.preparing : null)
      OrderStatus orderStatus,
      @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
      DateTime estimatedDeliveryTime,
      @JsonKey(name: 'shopName', defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
      String vendorName,
      @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
      OrderType orderType,
      @JsonKey(
          name: 'fulfilledBy',
          defaultValue:
              Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
      OrderDeliveryBy orderDeliveryBy,
      @JsonKey(
          name: 'mainCategory',
          defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
      CategoryExtension categoryExtension});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$NotificationDataModelCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderNumber = null,
    Object? notificationType = null,
    Object? orderStatus = null,
    Object? estimatedDeliveryTime = null,
    Object? vendorName = null,
    Object? orderType = null,
    Object? orderDeliveryBy = null,
    Object? categoryExtension = null,
  }) {
    return _then(_$OrderImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as OrderNotificationType,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      estimatedDeliveryTime: null == estimatedDeliveryTime
          ? _value.estimatedDeliveryTime
          : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      vendorName: null == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String,
      orderType: null == orderType
          ? _value.orderType
          : orderType // ignore: cast_nullable_to_non_nullable
              as OrderType,
      orderDeliveryBy: null == orderDeliveryBy
          ? _value.orderDeliveryBy
          : orderDeliveryBy // ignore: cast_nullable_to_non_nullable
              as OrderDeliveryBy,
      categoryExtension: null == categoryExtension
          ? _value.categoryExtension
          : categoryExtension // ignore: cast_nullable_to_non_nullable
              as CategoryExtension,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl extends _Order {
  _$OrderImpl(
      {required this.orderId,
      @JsonKey(
          name: 'oId', defaultValue: Global.generateDefaultValue ? '1' : null)
      required this.orderNumber,
      @JsonKey(
          name: 'event',
          defaultValue: Global.generateDefaultValue
              ? OrderNotificationType.orderPreparing
              : null)
      required this.notificationType,
      @JsonKey(
          name: 'status',
          defaultValue:
              Global.generateDefaultValue ? OrderStatus.preparing : null)
      required this.orderStatus,
      @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
      required this.estimatedDeliveryTime,
      @JsonKey(
          name: 'shopName',
          defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
      required this.vendorName,
      @JsonKey(
          defaultValue:
              Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
      required this.orderType,
      @JsonKey(
          name: 'fulfilledBy',
          defaultValue:
              Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
      required this.orderDeliveryBy,
      @JsonKey(
          name: 'mainCategory',
          defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
      required this.categoryExtension,
      final String? $type})
      : $type = $type ?? 'order',
        super._();

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String orderId;
  @override
  @JsonKey(name: 'oId', defaultValue: Global.generateDefaultValue ? '1' : null)
  final String orderNumber;
  @override
  @JsonKey(
      name: 'event',
      defaultValue: Global.generateDefaultValue
          ? OrderNotificationType.orderPreparing
          : null)
  final OrderNotificationType notificationType;
  @override
  @JsonKey(
      name: 'status',
      defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
  final OrderStatus orderStatus;
  @override
  @JsonKey(
      defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
  final DateTime estimatedDeliveryTime;
  @override
  @JsonKey(
      name: 'shopName',
      defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
  final String vendorName;
  @override
  @JsonKey(
      defaultValue:
          Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
  final OrderType orderType;
  @override
  @JsonKey(
      name: 'fulfilledBy',
      defaultValue: Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
  final OrderDeliveryBy orderDeliveryBy;
  @override
  @JsonKey(
      name: 'mainCategory',
      defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
  final CategoryExtension categoryExtension;

  @JsonKey(name: 'topic')
  final String $type;

  @override
  String toString() {
    return 'NotificationDataModel.order(orderId: $orderId, orderNumber: $orderNumber, notificationType: $notificationType, orderStatus: $orderStatus, estimatedDeliveryTime: $estimatedDeliveryTime, vendorName: $vendorName, orderType: $orderType, orderDeliveryBy: $orderDeliveryBy, categoryExtension: $categoryExtension)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.estimatedDeliveryTime, estimatedDeliveryTime) ||
                other.estimatedDeliveryTime == estimatedDeliveryTime) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.orderType, orderType) ||
                other.orderType == orderType) &&
            (identical(other.orderDeliveryBy, orderDeliveryBy) ||
                other.orderDeliveryBy == orderDeliveryBy) &&
            (identical(other.categoryExtension, categoryExtension) ||
                other.categoryExtension == categoryExtension));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      orderNumber,
      notificationType,
      orderStatus,
      estimatedDeliveryTime,
      vendorName,
      orderType,
      orderDeliveryBy,
      categoryExtension);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) product,
    required TResult Function(String vendorId) vendor,
    required TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)
        order,
    required TResult Function(String eventId) event,
    required TResult Function() cart,
  }) {
    return order(
        orderId,
        orderNumber,
        notificationType,
        orderStatus,
        estimatedDeliveryTime,
        vendorName,
        orderType,
        orderDeliveryBy,
        categoryExtension);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? product,
    TResult? Function(String vendorId)? vendor,
    TResult? Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult? Function(String eventId)? event,
    TResult? Function()? cart,
  }) {
    return order?.call(
        orderId,
        orderNumber,
        notificationType,
        orderStatus,
        estimatedDeliveryTime,
        vendorName,
        orderType,
        orderDeliveryBy,
        categoryExtension);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? product,
    TResult Function(String vendorId)? vendor,
    TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult Function(String eventId)? event,
    TResult Function()? cart,
    required TResult orElse(),
  }) {
    if (order != null) {
      return order(
          orderId,
          orderNumber,
          notificationType,
          orderStatus,
          estimatedDeliveryTime,
          vendorName,
          orderType,
          orderDeliveryBy,
          categoryExtension);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_Vendor value) vendor,
    required TResult Function(_Order value) order,
    required TResult Function(_Event value) event,
    required TResult Function(_Cart value) cart,
  }) {
    return order(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_Vendor value)? vendor,
    TResult? Function(_Order value)? order,
    TResult? Function(_Event value)? event,
    TResult? Function(_Cart value)? cart,
  }) {
    return order?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_Vendor value)? vendor,
    TResult Function(_Order value)? order,
    TResult Function(_Event value)? event,
    TResult Function(_Cart value)? cart,
    required TResult orElse(),
  }) {
    if (order != null) {
      return order(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order extends NotificationDataModel {
  factory _Order(
      {required final String orderId,
      @JsonKey(
          name: 'oId', defaultValue: Global.generateDefaultValue ? '1' : null)
      required final String orderNumber,
      @JsonKey(
          name: 'event',
          defaultValue: Global.generateDefaultValue
              ? OrderNotificationType.orderPreparing
              : null)
      required final OrderNotificationType notificationType,
      @JsonKey(
          name: 'status',
          defaultValue:
              Global.generateDefaultValue ? OrderStatus.preparing : null)
      required final OrderStatus orderStatus,
      @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
      required final DateTime estimatedDeliveryTime,
      @JsonKey(
          name: 'shopName',
          defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
      required final String vendorName,
      @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
      required final OrderType orderType,
      @JsonKey(
          name: 'fulfilledBy',
          defaultValue:
              Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
      required final OrderDeliveryBy orderDeliveryBy,
      @JsonKey(
          name: 'mainCategory',
          defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
      required final CategoryExtension categoryExtension}) = _$OrderImpl;
  _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  String get orderId;
  @JsonKey(name: 'oId', defaultValue: Global.generateDefaultValue ? '1' : null)
  String get orderNumber;
  @JsonKey(
      name: 'event',
      defaultValue: Global.generateDefaultValue
          ? OrderNotificationType.orderPreparing
          : null)
  OrderNotificationType get notificationType;
  @JsonKey(
      name: 'status',
      defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
  OrderStatus get orderStatus;
  @JsonKey(
      defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
  DateTime get estimatedDeliveryTime;
  @JsonKey(
      name: 'shopName',
      defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
  String get vendorName;
  @JsonKey(
      defaultValue:
          Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
  OrderType get orderType;
  @JsonKey(
      name: 'fulfilledBy',
      defaultValue: Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
  OrderDeliveryBy get orderDeliveryBy;
  @JsonKey(
      name: 'mainCategory',
      defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
  CategoryExtension get categoryExtension;

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId});
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$NotificationDataModelCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_$EventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventImpl extends _Event {
  _$EventImpl({required this.eventId, final String? $type})
      : $type = $type ?? 'event',
        super._();

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  final String eventId;

  @JsonKey(name: 'topic')
  final String $type;

  @override
  String toString() {
    return 'NotificationDataModel.event(eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) product,
    required TResult Function(String vendorId) vendor,
    required TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)
        order,
    required TResult Function(String eventId) event,
    required TResult Function() cart,
  }) {
    return event(eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? product,
    TResult? Function(String vendorId)? vendor,
    TResult? Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult? Function(String eventId)? event,
    TResult? Function()? cart,
  }) {
    return event?.call(eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? product,
    TResult Function(String vendorId)? vendor,
    TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult Function(String eventId)? event,
    TResult Function()? cart,
    required TResult orElse(),
  }) {
    if (event != null) {
      return event(eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_Vendor value) vendor,
    required TResult Function(_Order value) order,
    required TResult Function(_Event value) event,
    required TResult Function(_Cart value) cart,
  }) {
    return event(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_Vendor value)? vendor,
    TResult? Function(_Order value)? order,
    TResult? Function(_Event value)? event,
    TResult? Function(_Cart value)? cart,
  }) {
    return event?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_Vendor value)? vendor,
    TResult Function(_Order value)? order,
    TResult Function(_Event value)? event,
    TResult Function(_Cart value)? cart,
    required TResult orElse(),
  }) {
    if (event != null) {
      return event(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event extends NotificationDataModel {
  factory _Event({required final String eventId}) = _$EventImpl;
  _Event._() : super._();

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  String get eventId;

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$NotificationDataModelCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationDataModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CartImpl extends _Cart {
  _$CartImpl({final String? $type})
      : $type = $type ?? 'cart',
        super._();

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @JsonKey(name: 'topic')
  final String $type;

  @override
  String toString() {
    return 'NotificationDataModel.cart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) product,
    required TResult Function(String vendorId) vendor,
    required TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)
        order,
    required TResult Function(String eventId) event,
    required TResult Function() cart,
  }) {
    return cart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? product,
    TResult? Function(String vendorId)? vendor,
    TResult? Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult? Function(String eventId)? event,
    TResult? Function()? cart,
  }) {
    return cart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? product,
    TResult Function(String vendorId)? vendor,
    TResult Function(
            String orderId,
            @JsonKey(
                name: 'oId',
                defaultValue: Global.generateDefaultValue ? '1' : null)
            String orderNumber,
            @JsonKey(
                name: 'event',
                defaultValue: Global.generateDefaultValue
                    ? OrderNotificationType.orderPreparing
                    : null)
            OrderNotificationType notificationType,
            @JsonKey(name: 'status', defaultValue: Global.generateDefaultValue ? OrderStatus.preparing : null)
            OrderStatus orderStatus,
            @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime : null)
            DateTime estimatedDeliveryTime,
            @JsonKey(
                name: 'shopName',
                defaultValue: Global.generateDefaultValue ? 'Shop Name' : null)
            String vendorName,
            @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery : null)
            OrderType orderType,
            @JsonKey(
                name: 'fulfilledBy',
                defaultValue:
                    Global.generateDefaultValue ? OrderDeliveryBy.Vendor : null)
            OrderDeliveryBy orderDeliveryBy,
            @JsonKey(
                name: 'mainCategory',
                defaultValue: Global.generateDefaultValue ? CategoryExtension.CK : null)
            CategoryExtension categoryExtension)?
        order,
    TResult Function(String eventId)? event,
    TResult Function()? cart,
    required TResult orElse(),
  }) {
    if (cart != null) {
      return cart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Product value) product,
    required TResult Function(_Vendor value) vendor,
    required TResult Function(_Order value) order,
    required TResult Function(_Event value) event,
    required TResult Function(_Cart value) cart,
  }) {
    return cart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Product value)? product,
    TResult? Function(_Vendor value)? vendor,
    TResult? Function(_Order value)? order,
    TResult? Function(_Event value)? event,
    TResult? Function(_Cart value)? cart,
  }) {
    return cart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Product value)? product,
    TResult Function(_Vendor value)? vendor,
    TResult Function(_Order value)? order,
    TResult Function(_Event value)? event,
    TResult Function(_Cart value)? cart,
    required TResult orElse(),
  }) {
    if (cart != null) {
      return cart(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart extends NotificationDataModel {
  factory _Cart() = _$CartImpl;
  _Cart._() : super._();

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;
}
