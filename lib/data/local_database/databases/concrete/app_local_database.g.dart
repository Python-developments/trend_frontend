// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_local_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastLocationStringMeta =
      const VerificationMeta('lastLocationString');
  @override
  late final GeneratedColumn<String> lastLocationString =
      GeneratedColumn<String>('last_location_string', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastLocationLatitudeMeta =
      const VerificationMeta('lastLocationLatitude');
  @override
  late final GeneratedColumn<double> lastLocationLatitude =
      GeneratedColumn<double>('last_location_latitude', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lastLocationLongitudeMeta =
      const VerificationMeta('lastLocationLongitude');
  @override
  late final GeneratedColumn<double> lastLocationLongitude =
      GeneratedColumn<double>('last_location_longitude', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _addressIdMeta =
      const VerificationMeta('addressId');
  @override
  late final GeneratedColumn<String> addressId = GeneratedColumn<String>(
      'address_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressTitleMeta =
      const VerificationMeta('addressTitle');
  @override
  late final GeneratedColumn<String> addressTitle = GeneratedColumn<String>(
      'address_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressAreaMeta =
      const VerificationMeta('addressArea');
  @override
  late final GeneratedColumn<String> addressArea = GeneratedColumn<String>(
      'address_area', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressDescriptionMeta =
      const VerificationMeta('addressDescription');
  @override
  late final GeneratedColumn<String> addressDescription =
      GeneratedColumn<String>('address_description', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressAdditionalInfoMeta =
      const VerificationMeta('addressAdditionalInfo');
  @override
  late final GeneratedColumn<String> addressAdditionalInfo =
      GeneratedColumn<String>('address_additional_info', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        token,
        lastLocationString,
        lastLocationLatitude,
        lastLocationLongitude,
        addressId,
        addressTitle,
        addressArea,
        addressDescription,
        addressAdditionalInfo
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('last_location_string')) {
      context.handle(
          _lastLocationStringMeta,
          lastLocationString.isAcceptableOrUnknown(
              data['last_location_string']!, _lastLocationStringMeta));
    }
    if (data.containsKey('last_location_latitude')) {
      context.handle(
          _lastLocationLatitudeMeta,
          lastLocationLatitude.isAcceptableOrUnknown(
              data['last_location_latitude']!, _lastLocationLatitudeMeta));
    } else if (isInserting) {
      context.missing(_lastLocationLatitudeMeta);
    }
    if (data.containsKey('last_location_longitude')) {
      context.handle(
          _lastLocationLongitudeMeta,
          lastLocationLongitude.isAcceptableOrUnknown(
              data['last_location_longitude']!, _lastLocationLongitudeMeta));
    } else if (isInserting) {
      context.missing(_lastLocationLongitudeMeta);
    }
    if (data.containsKey('address_id')) {
      context.handle(_addressIdMeta,
          addressId.isAcceptableOrUnknown(data['address_id']!, _addressIdMeta));
    }
    if (data.containsKey('address_title')) {
      context.handle(
          _addressTitleMeta,
          addressTitle.isAcceptableOrUnknown(
              data['address_title']!, _addressTitleMeta));
    }
    if (data.containsKey('address_area')) {
      context.handle(
          _addressAreaMeta,
          addressArea.isAcceptableOrUnknown(
              data['address_area']!, _addressAreaMeta));
    }
    if (data.containsKey('address_description')) {
      context.handle(
          _addressDescriptionMeta,
          addressDescription.isAcceptableOrUnknown(
              data['address_description']!, _addressDescriptionMeta));
    }
    if (data.containsKey('address_additional_info')) {
      context.handle(
          _addressAdditionalInfoMeta,
          addressAdditionalInfo.isAcceptableOrUnknown(
              data['address_additional_info']!, _addressAdditionalInfoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
      lastLocationString: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}last_location_string']),
      lastLocationLatitude: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}last_location_latitude'])!,
      lastLocationLongitude: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}last_location_longitude'])!,
      addressId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address_id']),
      addressTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address_title']),
      addressArea: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address_area']),
      addressDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}address_description']),
      addressAdditionalInfo: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}address_additional_info']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String token;
  final String? lastLocationString;
  final double lastLocationLatitude;
  final double lastLocationLongitude;
  final String? addressId;
  final String? addressTitle;
  final String? addressArea;
  final String? addressDescription;
  final String? addressAdditionalInfo;
  const User(
      {required this.token,
      this.lastLocationString,
      required this.lastLocationLatitude,
      required this.lastLocationLongitude,
      this.addressId,
      this.addressTitle,
      this.addressArea,
      this.addressDescription,
      this.addressAdditionalInfo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['token'] = Variable<String>(token);
    if (!nullToAbsent || lastLocationString != null) {
      map['last_location_string'] = Variable<String>(lastLocationString);
    }
    map['last_location_latitude'] = Variable<double>(lastLocationLatitude);
    map['last_location_longitude'] = Variable<double>(lastLocationLongitude);
    if (!nullToAbsent || addressId != null) {
      map['address_id'] = Variable<String>(addressId);
    }
    if (!nullToAbsent || addressTitle != null) {
      map['address_title'] = Variable<String>(addressTitle);
    }
    if (!nullToAbsent || addressArea != null) {
      map['address_area'] = Variable<String>(addressArea);
    }
    if (!nullToAbsent || addressDescription != null) {
      map['address_description'] = Variable<String>(addressDescription);
    }
    if (!nullToAbsent || addressAdditionalInfo != null) {
      map['address_additional_info'] = Variable<String>(addressAdditionalInfo);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      token: Value(token),
      lastLocationString: lastLocationString == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLocationString),
      lastLocationLatitude: Value(lastLocationLatitude),
      lastLocationLongitude: Value(lastLocationLongitude),
      addressId: addressId == null && nullToAbsent
          ? const Value.absent()
          : Value(addressId),
      addressTitle: addressTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(addressTitle),
      addressArea: addressArea == null && nullToAbsent
          ? const Value.absent()
          : Value(addressArea),
      addressDescription: addressDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(addressDescription),
      addressAdditionalInfo: addressAdditionalInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(addressAdditionalInfo),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      token: serializer.fromJson<String>(json['token']),
      lastLocationString:
          serializer.fromJson<String?>(json['lastLocationString']),
      lastLocationLatitude:
          serializer.fromJson<double>(json['lastLocationLatitude']),
      lastLocationLongitude:
          serializer.fromJson<double>(json['lastLocationLongitude']),
      addressId: serializer.fromJson<String?>(json['addressId']),
      addressTitle: serializer.fromJson<String?>(json['addressTitle']),
      addressArea: serializer.fromJson<String?>(json['addressArea']),
      addressDescription:
          serializer.fromJson<String?>(json['addressDescription']),
      addressAdditionalInfo:
          serializer.fromJson<String?>(json['addressAdditionalInfo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'token': serializer.toJson<String>(token),
      'lastLocationString': serializer.toJson<String?>(lastLocationString),
      'lastLocationLatitude': serializer.toJson<double>(lastLocationLatitude),
      'lastLocationLongitude': serializer.toJson<double>(lastLocationLongitude),
      'addressId': serializer.toJson<String?>(addressId),
      'addressTitle': serializer.toJson<String?>(addressTitle),
      'addressArea': serializer.toJson<String?>(addressArea),
      'addressDescription': serializer.toJson<String?>(addressDescription),
      'addressAdditionalInfo':
          serializer.toJson<String?>(addressAdditionalInfo),
    };
  }

  User copyWith(
          {String? token,
          Value<String?> lastLocationString = const Value.absent(),
          double? lastLocationLatitude,
          double? lastLocationLongitude,
          Value<String?> addressId = const Value.absent(),
          Value<String?> addressTitle = const Value.absent(),
          Value<String?> addressArea = const Value.absent(),
          Value<String?> addressDescription = const Value.absent(),
          Value<String?> addressAdditionalInfo = const Value.absent()}) =>
      User(
        token: token ?? this.token,
        lastLocationString: lastLocationString.present
            ? lastLocationString.value
            : this.lastLocationString,
        lastLocationLatitude: lastLocationLatitude ?? this.lastLocationLatitude,
        lastLocationLongitude:
            lastLocationLongitude ?? this.lastLocationLongitude,
        addressId: addressId.present ? addressId.value : this.addressId,
        addressTitle:
            addressTitle.present ? addressTitle.value : this.addressTitle,
        addressArea: addressArea.present ? addressArea.value : this.addressArea,
        addressDescription: addressDescription.present
            ? addressDescription.value
            : this.addressDescription,
        addressAdditionalInfo: addressAdditionalInfo.present
            ? addressAdditionalInfo.value
            : this.addressAdditionalInfo,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      token: data.token.present ? data.token.value : this.token,
      lastLocationString: data.lastLocationString.present
          ? data.lastLocationString.value
          : this.lastLocationString,
      lastLocationLatitude: data.lastLocationLatitude.present
          ? data.lastLocationLatitude.value
          : this.lastLocationLatitude,
      lastLocationLongitude: data.lastLocationLongitude.present
          ? data.lastLocationLongitude.value
          : this.lastLocationLongitude,
      addressId: data.addressId.present ? data.addressId.value : this.addressId,
      addressTitle: data.addressTitle.present
          ? data.addressTitle.value
          : this.addressTitle,
      addressArea:
          data.addressArea.present ? data.addressArea.value : this.addressArea,
      addressDescription: data.addressDescription.present
          ? data.addressDescription.value
          : this.addressDescription,
      addressAdditionalInfo: data.addressAdditionalInfo.present
          ? data.addressAdditionalInfo.value
          : this.addressAdditionalInfo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('token: $token, ')
          ..write('lastLocationString: $lastLocationString, ')
          ..write('lastLocationLatitude: $lastLocationLatitude, ')
          ..write('lastLocationLongitude: $lastLocationLongitude, ')
          ..write('addressId: $addressId, ')
          ..write('addressTitle: $addressTitle, ')
          ..write('addressArea: $addressArea, ')
          ..write('addressDescription: $addressDescription, ')
          ..write('addressAdditionalInfo: $addressAdditionalInfo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      token,
      lastLocationString,
      lastLocationLatitude,
      lastLocationLongitude,
      addressId,
      addressTitle,
      addressArea,
      addressDescription,
      addressAdditionalInfo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.token == this.token &&
          other.lastLocationString == this.lastLocationString &&
          other.lastLocationLatitude == this.lastLocationLatitude &&
          other.lastLocationLongitude == this.lastLocationLongitude &&
          other.addressId == this.addressId &&
          other.addressTitle == this.addressTitle &&
          other.addressArea == this.addressArea &&
          other.addressDescription == this.addressDescription &&
          other.addressAdditionalInfo == this.addressAdditionalInfo);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> token;
  final Value<String?> lastLocationString;
  final Value<double> lastLocationLatitude;
  final Value<double> lastLocationLongitude;
  final Value<String?> addressId;
  final Value<String?> addressTitle;
  final Value<String?> addressArea;
  final Value<String?> addressDescription;
  final Value<String?> addressAdditionalInfo;
  final Value<int> rowid;
  const UsersCompanion({
    this.token = const Value.absent(),
    this.lastLocationString = const Value.absent(),
    this.lastLocationLatitude = const Value.absent(),
    this.lastLocationLongitude = const Value.absent(),
    this.addressId = const Value.absent(),
    this.addressTitle = const Value.absent(),
    this.addressArea = const Value.absent(),
    this.addressDescription = const Value.absent(),
    this.addressAdditionalInfo = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String token,
    this.lastLocationString = const Value.absent(),
    required double lastLocationLatitude,
    required double lastLocationLongitude,
    this.addressId = const Value.absent(),
    this.addressTitle = const Value.absent(),
    this.addressArea = const Value.absent(),
    this.addressDescription = const Value.absent(),
    this.addressAdditionalInfo = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : token = Value(token),
        lastLocationLatitude = Value(lastLocationLatitude),
        lastLocationLongitude = Value(lastLocationLongitude);
  static Insertable<User> custom({
    Expression<String>? token,
    Expression<String>? lastLocationString,
    Expression<double>? lastLocationLatitude,
    Expression<double>? lastLocationLongitude,
    Expression<String>? addressId,
    Expression<String>? addressTitle,
    Expression<String>? addressArea,
    Expression<String>? addressDescription,
    Expression<String>? addressAdditionalInfo,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (token != null) 'token': token,
      if (lastLocationString != null)
        'last_location_string': lastLocationString,
      if (lastLocationLatitude != null)
        'last_location_latitude': lastLocationLatitude,
      if (lastLocationLongitude != null)
        'last_location_longitude': lastLocationLongitude,
      if (addressId != null) 'address_id': addressId,
      if (addressTitle != null) 'address_title': addressTitle,
      if (addressArea != null) 'address_area': addressArea,
      if (addressDescription != null) 'address_description': addressDescription,
      if (addressAdditionalInfo != null)
        'address_additional_info': addressAdditionalInfo,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? token,
      Value<String?>? lastLocationString,
      Value<double>? lastLocationLatitude,
      Value<double>? lastLocationLongitude,
      Value<String?>? addressId,
      Value<String?>? addressTitle,
      Value<String?>? addressArea,
      Value<String?>? addressDescription,
      Value<String?>? addressAdditionalInfo,
      Value<int>? rowid}) {
    return UsersCompanion(
      token: token ?? this.token,
      lastLocationString: lastLocationString ?? this.lastLocationString,
      lastLocationLatitude: lastLocationLatitude ?? this.lastLocationLatitude,
      lastLocationLongitude:
          lastLocationLongitude ?? this.lastLocationLongitude,
      addressId: addressId ?? this.addressId,
      addressTitle: addressTitle ?? this.addressTitle,
      addressArea: addressArea ?? this.addressArea,
      addressDescription: addressDescription ?? this.addressDescription,
      addressAdditionalInfo:
          addressAdditionalInfo ?? this.addressAdditionalInfo,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (lastLocationString.present) {
      map['last_location_string'] = Variable<String>(lastLocationString.value);
    }
    if (lastLocationLatitude.present) {
      map['last_location_latitude'] =
          Variable<double>(lastLocationLatitude.value);
    }
    if (lastLocationLongitude.present) {
      map['last_location_longitude'] =
          Variable<double>(lastLocationLongitude.value);
    }
    if (addressId.present) {
      map['address_id'] = Variable<String>(addressId.value);
    }
    if (addressTitle.present) {
      map['address_title'] = Variable<String>(addressTitle.value);
    }
    if (addressArea.present) {
      map['address_area'] = Variable<String>(addressArea.value);
    }
    if (addressDescription.present) {
      map['address_description'] = Variable<String>(addressDescription.value);
    }
    if (addressAdditionalInfo.present) {
      map['address_additional_info'] =
          Variable<String>(addressAdditionalInfo.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('token: $token, ')
          ..write('lastLocationString: $lastLocationString, ')
          ..write('lastLocationLatitude: $lastLocationLatitude, ')
          ..write('lastLocationLongitude: $lastLocationLongitude, ')
          ..write('addressId: $addressId, ')
          ..write('addressTitle: $addressTitle, ')
          ..write('addressArea: $addressArea, ')
          ..write('addressDescription: $addressDescription, ')
          ..write('addressAdditionalInfo: $addressAdditionalInfo, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchHistoriesTable extends SearchHistories
    with TableInfo<$SearchHistoriesTable, SearchHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _searchCacheTypeMeta =
      const VerificationMeta('searchCacheType');
  @override
  late final GeneratedColumnWithTypeConverter<SearchCacheType, String>
      searchCacheType = GeneratedColumn<String>(
              'search_cache_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<SearchCacheType>(
              $SearchHistoriesTable.$convertersearchCacheType);
  @override
  List<GeneratedColumn> get $columns => [content, searchCacheType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_histories';
  @override
  VerificationContext validateIntegrity(Insertable<SearchHistory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    context.handle(_searchCacheTypeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {content, searchCacheType};
  @override
  SearchHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchHistory(
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      searchCacheType: $SearchHistoriesTable.$convertersearchCacheType.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}search_cache_type'])!),
    );
  }

  @override
  $SearchHistoriesTable createAlias(String alias) {
    return $SearchHistoriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SearchCacheType, String, String>
      $convertersearchCacheType =
      const EnumNameConverter<SearchCacheType>(SearchCacheType.values);
}

class SearchHistory extends DataClass implements Insertable<SearchHistory> {
  final String content;
  final SearchCacheType searchCacheType;
  const SearchHistory({required this.content, required this.searchCacheType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['content'] = Variable<String>(content);
    {
      map['search_cache_type'] = Variable<String>($SearchHistoriesTable
          .$convertersearchCacheType
          .toSql(searchCacheType));
    }
    return map;
  }

  SearchHistoriesCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoriesCompanion(
      content: Value(content),
      searchCacheType: Value(searchCacheType),
    );
  }

  factory SearchHistory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchHistory(
      content: serializer.fromJson<String>(json['content']),
      searchCacheType: $SearchHistoriesTable.$convertersearchCacheType
          .fromJson(serializer.fromJson<String>(json['searchCacheType'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'content': serializer.toJson<String>(content),
      'searchCacheType': serializer.toJson<String>($SearchHistoriesTable
          .$convertersearchCacheType
          .toJson(searchCacheType)),
    };
  }

  SearchHistory copyWith({String? content, SearchCacheType? searchCacheType}) =>
      SearchHistory(
        content: content ?? this.content,
        searchCacheType: searchCacheType ?? this.searchCacheType,
      );
  SearchHistory copyWithCompanion(SearchHistoriesCompanion data) {
    return SearchHistory(
      content: data.content.present ? data.content.value : this.content,
      searchCacheType: data.searchCacheType.present
          ? data.searchCacheType.value
          : this.searchCacheType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistory(')
          ..write('content: $content, ')
          ..write('searchCacheType: $searchCacheType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(content, searchCacheType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchHistory &&
          other.content == this.content &&
          other.searchCacheType == this.searchCacheType);
}

class SearchHistoriesCompanion extends UpdateCompanion<SearchHistory> {
  final Value<String> content;
  final Value<SearchCacheType> searchCacheType;
  final Value<int> rowid;
  const SearchHistoriesCompanion({
    this.content = const Value.absent(),
    this.searchCacheType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchHistoriesCompanion.insert({
    required String content,
    required SearchCacheType searchCacheType,
    this.rowid = const Value.absent(),
  })  : content = Value(content),
        searchCacheType = Value(searchCacheType);
  static Insertable<SearchHistory> custom({
    Expression<String>? content,
    Expression<String>? searchCacheType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (content != null) 'content': content,
      if (searchCacheType != null) 'search_cache_type': searchCacheType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchHistoriesCompanion copyWith(
      {Value<String>? content,
      Value<SearchCacheType>? searchCacheType,
      Value<int>? rowid}) {
    return SearchHistoriesCompanion(
      content: content ?? this.content,
      searchCacheType: searchCacheType ?? this.searchCacheType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (searchCacheType.present) {
      map['search_cache_type'] = Variable<String>($SearchHistoriesTable
          .$convertersearchCacheType
          .toSql(searchCacheType.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoriesCompanion(')
          ..write('content: $content, ')
          ..write('searchCacheType: $searchCacheType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _originalPriceMeta =
      const VerificationMeta('originalPrice');
  @override
  late final GeneratedColumn<double> originalPrice = GeneratedColumn<double>(
      'original_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _discountPriceMeta =
      const VerificationMeta('discountPrice');
  @override
  late final GeneratedColumn<double> discountPrice = GeneratedColumn<double>(
      'discount_price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _subtitleMeta =
      const VerificationMeta('subtitle');
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
      'subtitle', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _productCacheTypeMeta =
      const VerificationMeta('productCacheType');
  @override
  late final GeneratedColumnWithTypeConverter<ProductsCacheType, String>
      productCacheType = GeneratedColumn<String>(
              'product_cache_type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<ProductsCacheType>(
              $ProductsTable.$converterproductCacheType);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        imageUrl,
        originalPrice,
        discountPrice,
        subtitle,
        productCacheType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('original_price')) {
      context.handle(
          _originalPriceMeta,
          originalPrice.isAcceptableOrUnknown(
              data['original_price']!, _originalPriceMeta));
    } else if (isInserting) {
      context.missing(_originalPriceMeta);
    }
    if (data.containsKey('discount_price')) {
      context.handle(
          _discountPriceMeta,
          discountPrice.isAcceptableOrUnknown(
              data['discount_price']!, _discountPriceMeta));
    }
    if (data.containsKey('subtitle')) {
      context.handle(_subtitleMeta,
          subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta));
    }
    context.handle(_productCacheTypeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      originalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}original_price'])!,
      discountPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount_price']),
      subtitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subtitle']),
      productCacheType: $ProductsTable.$converterproductCacheType.fromSql(
          attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}product_cache_type'])!),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ProductsCacheType, String, String>
      $converterproductCacheType =
      const EnumNameConverter<ProductsCacheType>(ProductsCacheType.values);
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final String name;
  final String? imageUrl;
  final double originalPrice;
  final double? discountPrice;
  final String? subtitle;
  final ProductsCacheType productCacheType;
  const Product(
      {required this.id,
      required this.name,
      this.imageUrl,
      required this.originalPrice,
      this.discountPrice,
      this.subtitle,
      required this.productCacheType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['original_price'] = Variable<double>(originalPrice);
    if (!nullToAbsent || discountPrice != null) {
      map['discount_price'] = Variable<double>(discountPrice);
    }
    if (!nullToAbsent || subtitle != null) {
      map['subtitle'] = Variable<String>(subtitle);
    }
    {
      map['product_cache_type'] = Variable<String>(
          $ProductsTable.$converterproductCacheType.toSql(productCacheType));
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      originalPrice: Value(originalPrice),
      discountPrice: discountPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(discountPrice),
      subtitle: subtitle == null && nullToAbsent
          ? const Value.absent()
          : Value(subtitle),
      productCacheType: Value(productCacheType),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      originalPrice: serializer.fromJson<double>(json['originalPrice']),
      discountPrice: serializer.fromJson<double?>(json['discountPrice']),
      subtitle: serializer.fromJson<String?>(json['subtitle']),
      productCacheType: $ProductsTable.$converterproductCacheType
          .fromJson(serializer.fromJson<String>(json['productCacheType'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'originalPrice': serializer.toJson<double>(originalPrice),
      'discountPrice': serializer.toJson<double?>(discountPrice),
      'subtitle': serializer.toJson<String?>(subtitle),
      'productCacheType': serializer.toJson<String>(
          $ProductsTable.$converterproductCacheType.toJson(productCacheType)),
    };
  }

  Product copyWith(
          {String? id,
          String? name,
          Value<String?> imageUrl = const Value.absent(),
          double? originalPrice,
          Value<double?> discountPrice = const Value.absent(),
          Value<String?> subtitle = const Value.absent(),
          ProductsCacheType? productCacheType}) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        originalPrice: originalPrice ?? this.originalPrice,
        discountPrice:
            discountPrice.present ? discountPrice.value : this.discountPrice,
        subtitle: subtitle.present ? subtitle.value : this.subtitle,
        productCacheType: productCacheType ?? this.productCacheType,
      );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      originalPrice: data.originalPrice.present
          ? data.originalPrice.value
          : this.originalPrice,
      discountPrice: data.discountPrice.present
          ? data.discountPrice.value
          : this.discountPrice,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      productCacheType: data.productCacheType.present
          ? data.productCacheType.value
          : this.productCacheType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('originalPrice: $originalPrice, ')
          ..write('discountPrice: $discountPrice, ')
          ..write('subtitle: $subtitle, ')
          ..write('productCacheType: $productCacheType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, imageUrl, originalPrice,
      discountPrice, subtitle, productCacheType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.originalPrice == this.originalPrice &&
          other.discountPrice == this.discountPrice &&
          other.subtitle == this.subtitle &&
          other.productCacheType == this.productCacheType);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> imageUrl;
  final Value<double> originalPrice;
  final Value<double?> discountPrice;
  final Value<String?> subtitle;
  final Value<ProductsCacheType> productCacheType;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.originalPrice = const Value.absent(),
    this.discountPrice = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.productCacheType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required String name,
    this.imageUrl = const Value.absent(),
    required double originalPrice,
    this.discountPrice = const Value.absent(),
    this.subtitle = const Value.absent(),
    required ProductsCacheType productCacheType,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        originalPrice = Value(originalPrice),
        productCacheType = Value(productCacheType);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<double>? originalPrice,
    Expression<double>? discountPrice,
    Expression<String>? subtitle,
    Expression<String>? productCacheType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (originalPrice != null) 'original_price': originalPrice,
      if (discountPrice != null) 'discount_price': discountPrice,
      if (subtitle != null) 'subtitle': subtitle,
      if (productCacheType != null) 'product_cache_type': productCacheType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? imageUrl,
      Value<double>? originalPrice,
      Value<double?>? discountPrice,
      Value<String?>? subtitle,
      Value<ProductsCacheType>? productCacheType,
      Value<int>? rowid}) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPrice: discountPrice ?? this.discountPrice,
      subtitle: subtitle ?? this.subtitle,
      productCacheType: productCacheType ?? this.productCacheType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (originalPrice.present) {
      map['original_price'] = Variable<double>(originalPrice.value);
    }
    if (discountPrice.present) {
      map['discount_price'] = Variable<double>(discountPrice.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (productCacheType.present) {
      map['product_cache_type'] = Variable<String>($ProductsTable
          .$converterproductCacheType
          .toSql(productCacheType.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('originalPrice: $originalPrice, ')
          ..write('discountPrice: $discountPrice, ')
          ..write('subtitle: $subtitle, ')
          ..write('productCacheType: $productCacheType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VendorsTable extends Vendors with TableInfo<$VendorsTable, Vendor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VendorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _logoUrlMeta =
      const VerificationMeta('logoUrl');
  @override
  late final GeneratedColumn<String> logoUrl = GeneratedColumn<String>(
      'logo_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverUrlMeta =
      const VerificationMeta('coverUrl');
  @override
  late final GeneratedColumn<String> coverUrl = GeneratedColumn<String>(
      'cover_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reviewsCountMeta =
      const VerificationMeta('reviewsCount');
  @override
  late final GeneratedColumn<int> reviewsCount = GeneratedColumn<int>(
      'reviews_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _orderEstimationTimeMeta =
      const VerificationMeta('orderEstimationTime');
  @override
  late final GeneratedColumn<String> orderEstimationTime =
      GeneratedColumn<String>('order_estimation_time', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
      'rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _minimumOrderAmountMeta =
      const VerificationMeta('minimumOrderAmount');
  @override
  late final GeneratedColumn<double> minimumOrderAmount =
      GeneratedColumn<double>('minimum_order_amount', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        logoUrl,
        coverUrl,
        reviewsCount,
        orderEstimationTime,
        rate,
        minimumOrderAmount
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vendors';
  @override
  VerificationContext validateIntegrity(Insertable<Vendor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('logo_url')) {
      context.handle(_logoUrlMeta,
          logoUrl.isAcceptableOrUnknown(data['logo_url']!, _logoUrlMeta));
    }
    if (data.containsKey('cover_url')) {
      context.handle(_coverUrlMeta,
          coverUrl.isAcceptableOrUnknown(data['cover_url']!, _coverUrlMeta));
    }
    if (data.containsKey('reviews_count')) {
      context.handle(
          _reviewsCountMeta,
          reviewsCount.isAcceptableOrUnknown(
              data['reviews_count']!, _reviewsCountMeta));
    } else if (isInserting) {
      context.missing(_reviewsCountMeta);
    }
    if (data.containsKey('order_estimation_time')) {
      context.handle(
          _orderEstimationTimeMeta,
          orderEstimationTime.isAcceptableOrUnknown(
              data['order_estimation_time']!, _orderEstimationTimeMeta));
    } else if (isInserting) {
      context.missing(_orderEstimationTimeMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('minimum_order_amount')) {
      context.handle(
          _minimumOrderAmountMeta,
          minimumOrderAmount.isAcceptableOrUnknown(
              data['minimum_order_amount']!, _minimumOrderAmountMeta));
    } else if (isInserting) {
      context.missing(_minimumOrderAmountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Vendor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vendor(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      logoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logo_url']),
      coverUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_url']),
      reviewsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reviews_count'])!,
      orderEstimationTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}order_estimation_time'])!,
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rate'])!,
      minimumOrderAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}minimum_order_amount'])!,
    );
  }

  @override
  $VendorsTable createAlias(String alias) {
    return $VendorsTable(attachedDatabase, alias);
  }
}

class Vendor extends DataClass implements Insertable<Vendor> {
  final String id;
  final String name;
  final String? logoUrl;
  final String? coverUrl;
  final int reviewsCount;
  final String orderEstimationTime;
  final double rate;
  final double minimumOrderAmount;
  const Vendor(
      {required this.id,
      required this.name,
      this.logoUrl,
      this.coverUrl,
      required this.reviewsCount,
      required this.orderEstimationTime,
      required this.rate,
      required this.minimumOrderAmount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || logoUrl != null) {
      map['logo_url'] = Variable<String>(logoUrl);
    }
    if (!nullToAbsent || coverUrl != null) {
      map['cover_url'] = Variable<String>(coverUrl);
    }
    map['reviews_count'] = Variable<int>(reviewsCount);
    map['order_estimation_time'] = Variable<String>(orderEstimationTime);
    map['rate'] = Variable<double>(rate);
    map['minimum_order_amount'] = Variable<double>(minimumOrderAmount);
    return map;
  }

  VendorsCompanion toCompanion(bool nullToAbsent) {
    return VendorsCompanion(
      id: Value(id),
      name: Value(name),
      logoUrl: logoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUrl),
      coverUrl: coverUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(coverUrl),
      reviewsCount: Value(reviewsCount),
      orderEstimationTime: Value(orderEstimationTime),
      rate: Value(rate),
      minimumOrderAmount: Value(minimumOrderAmount),
    );
  }

  factory Vendor.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vendor(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      logoUrl: serializer.fromJson<String?>(json['logoUrl']),
      coverUrl: serializer.fromJson<String?>(json['coverUrl']),
      reviewsCount: serializer.fromJson<int>(json['reviewsCount']),
      orderEstimationTime:
          serializer.fromJson<String>(json['orderEstimationTime']),
      rate: serializer.fromJson<double>(json['rate']),
      minimumOrderAmount:
          serializer.fromJson<double>(json['minimumOrderAmount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'logoUrl': serializer.toJson<String?>(logoUrl),
      'coverUrl': serializer.toJson<String?>(coverUrl),
      'reviewsCount': serializer.toJson<int>(reviewsCount),
      'orderEstimationTime': serializer.toJson<String>(orderEstimationTime),
      'rate': serializer.toJson<double>(rate),
      'minimumOrderAmount': serializer.toJson<double>(minimumOrderAmount),
    };
  }

  Vendor copyWith(
          {String? id,
          String? name,
          Value<String?> logoUrl = const Value.absent(),
          Value<String?> coverUrl = const Value.absent(),
          int? reviewsCount,
          String? orderEstimationTime,
          double? rate,
          double? minimumOrderAmount}) =>
      Vendor(
        id: id ?? this.id,
        name: name ?? this.name,
        logoUrl: logoUrl.present ? logoUrl.value : this.logoUrl,
        coverUrl: coverUrl.present ? coverUrl.value : this.coverUrl,
        reviewsCount: reviewsCount ?? this.reviewsCount,
        orderEstimationTime: orderEstimationTime ?? this.orderEstimationTime,
        rate: rate ?? this.rate,
        minimumOrderAmount: minimumOrderAmount ?? this.minimumOrderAmount,
      );
  Vendor copyWithCompanion(VendorsCompanion data) {
    return Vendor(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      logoUrl: data.logoUrl.present ? data.logoUrl.value : this.logoUrl,
      coverUrl: data.coverUrl.present ? data.coverUrl.value : this.coverUrl,
      reviewsCount: data.reviewsCount.present
          ? data.reviewsCount.value
          : this.reviewsCount,
      orderEstimationTime: data.orderEstimationTime.present
          ? data.orderEstimationTime.value
          : this.orderEstimationTime,
      rate: data.rate.present ? data.rate.value : this.rate,
      minimumOrderAmount: data.minimumOrderAmount.present
          ? data.minimumOrderAmount.value
          : this.minimumOrderAmount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vendor(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('coverUrl: $coverUrl, ')
          ..write('reviewsCount: $reviewsCount, ')
          ..write('orderEstimationTime: $orderEstimationTime, ')
          ..write('rate: $rate, ')
          ..write('minimumOrderAmount: $minimumOrderAmount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, logoUrl, coverUrl, reviewsCount,
      orderEstimationTime, rate, minimumOrderAmount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vendor &&
          other.id == this.id &&
          other.name == this.name &&
          other.logoUrl == this.logoUrl &&
          other.coverUrl == this.coverUrl &&
          other.reviewsCount == this.reviewsCount &&
          other.orderEstimationTime == this.orderEstimationTime &&
          other.rate == this.rate &&
          other.minimumOrderAmount == this.minimumOrderAmount);
}

class VendorsCompanion extends UpdateCompanion<Vendor> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> logoUrl;
  final Value<String?> coverUrl;
  final Value<int> reviewsCount;
  final Value<String> orderEstimationTime;
  final Value<double> rate;
  final Value<double> minimumOrderAmount;
  final Value<int> rowid;
  const VendorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.logoUrl = const Value.absent(),
    this.coverUrl = const Value.absent(),
    this.reviewsCount = const Value.absent(),
    this.orderEstimationTime = const Value.absent(),
    this.rate = const Value.absent(),
    this.minimumOrderAmount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VendorsCompanion.insert({
    required String id,
    required String name,
    this.logoUrl = const Value.absent(),
    this.coverUrl = const Value.absent(),
    required int reviewsCount,
    required String orderEstimationTime,
    required double rate,
    required double minimumOrderAmount,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        reviewsCount = Value(reviewsCount),
        orderEstimationTime = Value(orderEstimationTime),
        rate = Value(rate),
        minimumOrderAmount = Value(minimumOrderAmount);
  static Insertable<Vendor> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? logoUrl,
    Expression<String>? coverUrl,
    Expression<int>? reviewsCount,
    Expression<String>? orderEstimationTime,
    Expression<double>? rate,
    Expression<double>? minimumOrderAmount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (logoUrl != null) 'logo_url': logoUrl,
      if (coverUrl != null) 'cover_url': coverUrl,
      if (reviewsCount != null) 'reviews_count': reviewsCount,
      if (orderEstimationTime != null)
        'order_estimation_time': orderEstimationTime,
      if (rate != null) 'rate': rate,
      if (minimumOrderAmount != null)
        'minimum_order_amount': minimumOrderAmount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VendorsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? logoUrl,
      Value<String?>? coverUrl,
      Value<int>? reviewsCount,
      Value<String>? orderEstimationTime,
      Value<double>? rate,
      Value<double>? minimumOrderAmount,
      Value<int>? rowid}) {
    return VendorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      coverUrl: coverUrl ?? this.coverUrl,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      orderEstimationTime: orderEstimationTime ?? this.orderEstimationTime,
      rate: rate ?? this.rate,
      minimumOrderAmount: minimumOrderAmount ?? this.minimumOrderAmount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (logoUrl.present) {
      map['logo_url'] = Variable<String>(logoUrl.value);
    }
    if (coverUrl.present) {
      map['cover_url'] = Variable<String>(coverUrl.value);
    }
    if (reviewsCount.present) {
      map['reviews_count'] = Variable<int>(reviewsCount.value);
    }
    if (orderEstimationTime.present) {
      map['order_estimation_time'] =
          Variable<String>(orderEstimationTime.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (minimumOrderAmount.present) {
      map['minimum_order_amount'] = Variable<double>(minimumOrderAmount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VendorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logoUrl: $logoUrl, ')
          ..write('coverUrl: $coverUrl, ')
          ..write('reviewsCount: $reviewsCount, ')
          ..write('orderEstimationTime: $orderEstimationTime, ')
          ..write('rate: $rate, ')
          ..write('minimumOrderAmount: $minimumOrderAmount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _remindersMeta =
      const VerificationMeta('reminders');
  @override
  late final GeneratedColumn<Uint8List> reminders = GeneratedColumn<Uint8List>(
      'reminders', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, imagePath, date, reminders];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(Insertable<Event> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('reminders')) {
      context.handle(_remindersMeta,
          reminders.isAcceptableOrUnknown(data['reminders']!, _remindersMeta));
    } else if (isInserting) {
      context.missing(_remindersMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      reminders: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}reminders'])!,
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final String id;
  final String name;
  final String? description;
  final String? imagePath;
  final DateTime date;
  final Uint8List reminders;
  const Event(
      {required this.id,
      required this.name,
      this.description,
      this.imagePath,
      required this.date,
      required this.reminders});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['date'] = Variable<DateTime>(date);
    map['reminders'] = Variable<Uint8List>(reminders);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      date: Value(date),
      reminders: Value(reminders),
    );
  }

  factory Event.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      date: serializer.fromJson<DateTime>(json['date']),
      reminders: serializer.fromJson<Uint8List>(json['reminders']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'imagePath': serializer.toJson<String?>(imagePath),
      'date': serializer.toJson<DateTime>(date),
      'reminders': serializer.toJson<Uint8List>(reminders),
    };
  }

  Event copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
          DateTime? date,
          Uint8List? reminders}) =>
      Event(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        date: date ?? this.date,
        reminders: reminders ?? this.reminders,
      );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      date: data.date.present ? data.date.value : this.date,
      reminders: data.reminders.present ? data.reminders.value : this.reminders,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('date: $date, ')
          ..write('reminders: $reminders')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, imagePath, date,
      $driftBlobEquality.hash(reminders));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.imagePath == this.imagePath &&
          other.date == this.date &&
          $driftBlobEquality.equals(other.reminders, this.reminders));
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> imagePath;
  final Value<DateTime> date;
  final Value<Uint8List> reminders;
  final Value<int> rowid;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.date = const Value.absent(),
    this.reminders = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.imagePath = const Value.absent(),
    required DateTime date,
    required Uint8List reminders,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        date = Value(date),
        reminders = Value(reminders);
  static Insertable<Event> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? imagePath,
    Expression<DateTime>? date,
    Expression<Uint8List>? reminders,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (imagePath != null) 'image_path': imagePath,
      if (date != null) 'date': date,
      if (reminders != null) 'reminders': reminders,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? imagePath,
      Value<DateTime>? date,
      Value<Uint8List>? reminders,
      Value<int>? rowid}) {
    return EventsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      date: date ?? this.date,
      reminders: reminders ?? this.reminders,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (reminders.present) {
      map['reminders'] = Variable<Uint8List>(reminders.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('imagePath: $imagePath, ')
          ..write('date: $date, ')
          ..write('reminders: $reminders, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VendorCategoriesProductsTable extends VendorCategoriesProducts
    with TableInfo<$VendorCategoriesProductsTable, VendorCategoriesProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VendorCategoriesProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _vendorIdMeta =
      const VerificationMeta('vendorId');
  @override
  late final GeneratedColumn<String> vendorId = GeneratedColumn<String>(
      'vendor_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  @override
  List<GeneratedColumn> get $columns => [vendorId, categoryId, productId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vendor_categories_products';
  @override
  VerificationContext validateIntegrity(
      Insertable<VendorCategoriesProduct> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('vendor_id')) {
      context.handle(_vendorIdMeta,
          vendorId.isAcceptableOrUnknown(data['vendor_id']!, _vendorIdMeta));
    } else if (isInserting) {
      context.missing(_vendorIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  VendorCategoriesProduct map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VendorCategoriesProduct(
      vendorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vendor_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
    );
  }

  @override
  $VendorCategoriesProductsTable createAlias(String alias) {
    return $VendorCategoriesProductsTable(attachedDatabase, alias);
  }
}

class VendorCategoriesProduct extends DataClass
    implements Insertable<VendorCategoriesProduct> {
  final String vendorId;
  final String categoryId;
  final String productId;
  const VendorCategoriesProduct(
      {required this.vendorId,
      required this.categoryId,
      required this.productId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['vendor_id'] = Variable<String>(vendorId);
    map['category_id'] = Variable<String>(categoryId);
    map['product_id'] = Variable<String>(productId);
    return map;
  }

  VendorCategoriesProductsCompanion toCompanion(bool nullToAbsent) {
    return VendorCategoriesProductsCompanion(
      vendorId: Value(vendorId),
      categoryId: Value(categoryId),
      productId: Value(productId),
    );
  }

  factory VendorCategoriesProduct.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VendorCategoriesProduct(
      vendorId: serializer.fromJson<String>(json['vendorId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      productId: serializer.fromJson<String>(json['productId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'vendorId': serializer.toJson<String>(vendorId),
      'categoryId': serializer.toJson<String>(categoryId),
      'productId': serializer.toJson<String>(productId),
    };
  }

  VendorCategoriesProduct copyWith(
          {String? vendorId, String? categoryId, String? productId}) =>
      VendorCategoriesProduct(
        vendorId: vendorId ?? this.vendorId,
        categoryId: categoryId ?? this.categoryId,
        productId: productId ?? this.productId,
      );
  VendorCategoriesProduct copyWithCompanion(
      VendorCategoriesProductsCompanion data) {
    return VendorCategoriesProduct(
      vendorId: data.vendorId.present ? data.vendorId.value : this.vendorId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      productId: data.productId.present ? data.productId.value : this.productId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VendorCategoriesProduct(')
          ..write('vendorId: $vendorId, ')
          ..write('categoryId: $categoryId, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(vendorId, categoryId, productId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VendorCategoriesProduct &&
          other.vendorId == this.vendorId &&
          other.categoryId == this.categoryId &&
          other.productId == this.productId);
}

class VendorCategoriesProductsCompanion
    extends UpdateCompanion<VendorCategoriesProduct> {
  final Value<String> vendorId;
  final Value<String> categoryId;
  final Value<String> productId;
  final Value<int> rowid;
  const VendorCategoriesProductsCompanion({
    this.vendorId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.productId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VendorCategoriesProductsCompanion.insert({
    required String vendorId,
    required String categoryId,
    required String productId,
    this.rowid = const Value.absent(),
  })  : vendorId = Value(vendorId),
        categoryId = Value(categoryId),
        productId = Value(productId);
  static Insertable<VendorCategoriesProduct> custom({
    Expression<String>? vendorId,
    Expression<String>? categoryId,
    Expression<String>? productId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (vendorId != null) 'vendor_id': vendorId,
      if (categoryId != null) 'category_id': categoryId,
      if (productId != null) 'product_id': productId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VendorCategoriesProductsCompanion copyWith(
      {Value<String>? vendorId,
      Value<String>? categoryId,
      Value<String>? productId,
      Value<int>? rowid}) {
    return VendorCategoriesProductsCompanion(
      vendorId: vendorId ?? this.vendorId,
      categoryId: categoryId ?? this.categoryId,
      productId: productId ?? this.productId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (vendorId.present) {
      map['vendor_id'] = Variable<String>(vendorId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VendorCategoriesProductsCompanion(')
          ..write('vendorId: $vendorId, ')
          ..write('categoryId: $categoryId, ')
          ..write('productId: $productId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppLocalDatabase extends GeneratedDatabase {
  _$AppLocalDatabase(QueryExecutor e) : super(e);
  $AppLocalDatabaseManager get managers => $AppLocalDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $SearchHistoriesTable searchHistories =
      $SearchHistoriesTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $VendorsTable vendors = $VendorsTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $VendorCategoriesProductsTable vendorCategoriesProducts =
      $VendorCategoriesProductsTable(this);
  late final UsersDao usersDao = UsersDao(this as AppLocalDatabase);
  late final SearchHistoriesDao searchHistoriesDao =
      SearchHistoriesDao(this as AppLocalDatabase);
  late final ProductsDao productsDao = ProductsDao(this as AppLocalDatabase);
  late final VendorsDao vendorsDao = VendorsDao(this as AppLocalDatabase);
  late final EventsDao eventsDao = EventsDao(this as AppLocalDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        searchHistories,
        products,
        vendors,
        events,
        vendorCategoriesProducts
      ];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  required String token,
  Value<String?> lastLocationString,
  required double lastLocationLatitude,
  required double lastLocationLongitude,
  Value<String?> addressId,
  Value<String?> addressTitle,
  Value<String?> addressArea,
  Value<String?> addressDescription,
  Value<String?> addressAdditionalInfo,
  Value<int> rowid,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<String> token,
  Value<String?> lastLocationString,
  Value<double> lastLocationLatitude,
  Value<double> lastLocationLongitude,
  Value<String?> addressId,
  Value<String?> addressTitle,
  Value<String?> addressArea,
  Value<String?> addressDescription,
  Value<String?> addressAdditionalInfo,
  Value<int> rowid,
});

class $$UsersTableFilterComposer
    extends Composer<_$AppLocalDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastLocationString => $composableBuilder(
      column: $table.lastLocationString,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lastLocationLatitude => $composableBuilder(
      column: $table.lastLocationLatitude,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lastLocationLongitude => $composableBuilder(
      column: $table.lastLocationLongitude,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get addressId => $composableBuilder(
      column: $table.addressId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get addressTitle => $composableBuilder(
      column: $table.addressTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get addressArea => $composableBuilder(
      column: $table.addressArea, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get addressDescription => $composableBuilder(
      column: $table.addressDescription,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get addressAdditionalInfo => $composableBuilder(
      column: $table.addressAdditionalInfo,
      builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppLocalDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get token => $composableBuilder(
      column: $table.token, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastLocationString => $composableBuilder(
      column: $table.lastLocationString,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lastLocationLatitude => $composableBuilder(
      column: $table.lastLocationLatitude,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lastLocationLongitude => $composableBuilder(
      column: $table.lastLocationLongitude,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get addressId => $composableBuilder(
      column: $table.addressId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get addressTitle => $composableBuilder(
      column: $table.addressTitle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get addressArea => $composableBuilder(
      column: $table.addressArea, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get addressDescription => $composableBuilder(
      column: $table.addressDescription,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get addressAdditionalInfo => $composableBuilder(
      column: $table.addressAdditionalInfo,
      builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppLocalDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get token =>
      $composableBuilder(column: $table.token, builder: (column) => column);

  GeneratedColumn<String> get lastLocationString => $composableBuilder(
      column: $table.lastLocationString, builder: (column) => column);

  GeneratedColumn<double> get lastLocationLatitude => $composableBuilder(
      column: $table.lastLocationLatitude, builder: (column) => column);

  GeneratedColumn<double> get lastLocationLongitude => $composableBuilder(
      column: $table.lastLocationLongitude, builder: (column) => column);

  GeneratedColumn<String> get addressId =>
      $composableBuilder(column: $table.addressId, builder: (column) => column);

  GeneratedColumn<String> get addressTitle => $composableBuilder(
      column: $table.addressTitle, builder: (column) => column);

  GeneratedColumn<String> get addressArea => $composableBuilder(
      column: $table.addressArea, builder: (column) => column);

  GeneratedColumn<String> get addressDescription => $composableBuilder(
      column: $table.addressDescription, builder: (column) => column);

  GeneratedColumn<String> get addressAdditionalInfo => $composableBuilder(
      column: $table.addressAdditionalInfo, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppLocalDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppLocalDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppLocalDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> token = const Value.absent(),
            Value<String?> lastLocationString = const Value.absent(),
            Value<double> lastLocationLatitude = const Value.absent(),
            Value<double> lastLocationLongitude = const Value.absent(),
            Value<String?> addressId = const Value.absent(),
            Value<String?> addressTitle = const Value.absent(),
            Value<String?> addressArea = const Value.absent(),
            Value<String?> addressDescription = const Value.absent(),
            Value<String?> addressAdditionalInfo = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion(
            token: token,
            lastLocationString: lastLocationString,
            lastLocationLatitude: lastLocationLatitude,
            lastLocationLongitude: lastLocationLongitude,
            addressId: addressId,
            addressTitle: addressTitle,
            addressArea: addressArea,
            addressDescription: addressDescription,
            addressAdditionalInfo: addressAdditionalInfo,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String token,
            Value<String?> lastLocationString = const Value.absent(),
            required double lastLocationLatitude,
            required double lastLocationLongitude,
            Value<String?> addressId = const Value.absent(),
            Value<String?> addressTitle = const Value.absent(),
            Value<String?> addressArea = const Value.absent(),
            Value<String?> addressDescription = const Value.absent(),
            Value<String?> addressAdditionalInfo = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersCompanion.insert(
            token: token,
            lastLocationString: lastLocationString,
            lastLocationLatitude: lastLocationLatitude,
            lastLocationLongitude: lastLocationLongitude,
            addressId: addressId,
            addressTitle: addressTitle,
            addressArea: addressArea,
            addressDescription: addressDescription,
            addressAdditionalInfo: addressAdditionalInfo,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppLocalDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppLocalDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$SearchHistoriesTableCreateCompanionBuilder = SearchHistoriesCompanion
    Function({
  required String content,
  required SearchCacheType searchCacheType,
  Value<int> rowid,
});
typedef $$SearchHistoriesTableUpdateCompanionBuilder = SearchHistoriesCompanion
    Function({
  Value<String> content,
  Value<SearchCacheType> searchCacheType,
  Value<int> rowid,
});

class $$SearchHistoriesTableFilterComposer
    extends Composer<_$AppLocalDatabase, $SearchHistoriesTable> {
  $$SearchHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<SearchCacheType, SearchCacheType, String>
      get searchCacheType => $composableBuilder(
          column: $table.searchCacheType,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$SearchHistoriesTableOrderingComposer
    extends Composer<_$AppLocalDatabase, $SearchHistoriesTable> {
  $$SearchHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get searchCacheType => $composableBuilder(
      column: $table.searchCacheType,
      builder: (column) => ColumnOrderings(column));
}

class $$SearchHistoriesTableAnnotationComposer
    extends Composer<_$AppLocalDatabase, $SearchHistoriesTable> {
  $$SearchHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SearchCacheType, String>
      get searchCacheType => $composableBuilder(
          column: $table.searchCacheType, builder: (column) => column);
}

class $$SearchHistoriesTableTableManager extends RootTableManager<
    _$AppLocalDatabase,
    $SearchHistoriesTable,
    SearchHistory,
    $$SearchHistoriesTableFilterComposer,
    $$SearchHistoriesTableOrderingComposer,
    $$SearchHistoriesTableAnnotationComposer,
    $$SearchHistoriesTableCreateCompanionBuilder,
    $$SearchHistoriesTableUpdateCompanionBuilder,
    (
      SearchHistory,
      BaseReferences<_$AppLocalDatabase, $SearchHistoriesTable, SearchHistory>
    ),
    SearchHistory,
    PrefetchHooks Function()> {
  $$SearchHistoriesTableTableManager(
      _$AppLocalDatabase db, $SearchHistoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchHistoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchHistoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> content = const Value.absent(),
            Value<SearchCacheType> searchCacheType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SearchHistoriesCompanion(
            content: content,
            searchCacheType: searchCacheType,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String content,
            required SearchCacheType searchCacheType,
            Value<int> rowid = const Value.absent(),
          }) =>
              SearchHistoriesCompanion.insert(
            content: content,
            searchCacheType: searchCacheType,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SearchHistoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppLocalDatabase,
    $SearchHistoriesTable,
    SearchHistory,
    $$SearchHistoriesTableFilterComposer,
    $$SearchHistoriesTableOrderingComposer,
    $$SearchHistoriesTableAnnotationComposer,
    $$SearchHistoriesTableCreateCompanionBuilder,
    $$SearchHistoriesTableUpdateCompanionBuilder,
    (
      SearchHistory,
      BaseReferences<_$AppLocalDatabase, $SearchHistoriesTable, SearchHistory>
    ),
    SearchHistory,
    PrefetchHooks Function()>;
typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  required String id,
  required String name,
  Value<String?> imageUrl,
  required double originalPrice,
  Value<double?> discountPrice,
  Value<String?> subtitle,
  required ProductsCacheType productCacheType,
  Value<int> rowid,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> imageUrl,
  Value<double> originalPrice,
  Value<double?> discountPrice,
  Value<String?> subtitle,
  Value<ProductsCacheType> productCacheType,
  Value<int> rowid,
});

final class $$ProductsTableReferences
    extends BaseReferences<_$AppLocalDatabase, $ProductsTable, Product> {
  $$ProductsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VendorCategoriesProductsTable,
      List<VendorCategoriesProduct>> _vendorCategoriesProductsRefsTable(
          _$AppLocalDatabase db) =>
      MultiTypedResultKey.fromTable(db.vendorCategoriesProducts,
          aliasName: $_aliasNameGenerator(
              db.products.id, db.vendorCategoriesProducts.productId));

  $$VendorCategoriesProductsTableProcessedTableManager
      get vendorCategoriesProductsRefs {
    final manager = $$VendorCategoriesProductsTableTableManager(
            $_db, $_db.vendorCategoriesProducts)
        .filter((f) => f.productId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_vendorCategoriesProductsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductsTableFilterComposer
    extends Composer<_$AppLocalDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get originalPrice => $composableBuilder(
      column: $table.originalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get discountPrice => $composableBuilder(
      column: $table.discountPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subtitle => $composableBuilder(
      column: $table.subtitle, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ProductsCacheType, ProductsCacheType, String>
      get productCacheType => $composableBuilder(
          column: $table.productCacheType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  Expression<bool> vendorCategoriesProductsRefs(
      Expression<bool> Function($$VendorCategoriesProductsTableFilterComposer f)
          f) {
    final $$VendorCategoriesProductsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.vendorCategoriesProducts,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$VendorCategoriesProductsTableFilterComposer(
                  $db: $db,
                  $table: $db.vendorCategoriesProducts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppLocalDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get originalPrice => $composableBuilder(
      column: $table.originalPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get discountPrice => $composableBuilder(
      column: $table.discountPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subtitle => $composableBuilder(
      column: $table.subtitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productCacheType => $composableBuilder(
      column: $table.productCacheType,
      builder: (column) => ColumnOrderings(column));
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppLocalDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<double> get originalPrice => $composableBuilder(
      column: $table.originalPrice, builder: (column) => column);

  GeneratedColumn<double> get discountPrice => $composableBuilder(
      column: $table.discountPrice, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProductsCacheType, String>
      get productCacheType => $composableBuilder(
          column: $table.productCacheType, builder: (column) => column);

  Expression<T> vendorCategoriesProductsRefs<T extends Object>(
      Expression<T> Function(
              $$VendorCategoriesProductsTableAnnotationComposer a)
          f) {
    final $$VendorCategoriesProductsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.vendorCategoriesProducts,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$VendorCategoriesProductsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.vendorCategoriesProducts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProductsTableTableManager extends RootTableManager<
    _$AppLocalDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (Product, $$ProductsTableReferences),
    Product,
    PrefetchHooks Function({bool vendorCategoriesProductsRefs})> {
  $$ProductsTableTableManager(_$AppLocalDatabase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<double> originalPrice = const Value.absent(),
            Value<double?> discountPrice = const Value.absent(),
            Value<String?> subtitle = const Value.absent(),
            Value<ProductsCacheType> productCacheType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion(
            id: id,
            name: name,
            imageUrl: imageUrl,
            originalPrice: originalPrice,
            discountPrice: discountPrice,
            subtitle: subtitle,
            productCacheType: productCacheType,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> imageUrl = const Value.absent(),
            required double originalPrice,
            Value<double?> discountPrice = const Value.absent(),
            Value<String?> subtitle = const Value.absent(),
            required ProductsCacheType productCacheType,
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            id: id,
            name: name,
            imageUrl: imageUrl,
            originalPrice: originalPrice,
            discountPrice: discountPrice,
            subtitle: subtitle,
            productCacheType: productCacheType,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ProductsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({vendorCategoriesProductsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (vendorCategoriesProductsRefs) db.vendorCategoriesProducts
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (vendorCategoriesProductsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ProductsTableReferences
                            ._vendorCategoriesProductsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableReferences(db, table, p0)
                                .vendorCategoriesProductsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppLocalDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableAnnotationComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder,
    (Product, $$ProductsTableReferences),
    Product,
    PrefetchHooks Function({bool vendorCategoriesProductsRefs})>;
typedef $$VendorsTableCreateCompanionBuilder = VendorsCompanion Function({
  required String id,
  required String name,
  Value<String?> logoUrl,
  Value<String?> coverUrl,
  required int reviewsCount,
  required String orderEstimationTime,
  required double rate,
  required double minimumOrderAmount,
  Value<int> rowid,
});
typedef $$VendorsTableUpdateCompanionBuilder = VendorsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> logoUrl,
  Value<String?> coverUrl,
  Value<int> reviewsCount,
  Value<String> orderEstimationTime,
  Value<double> rate,
  Value<double> minimumOrderAmount,
  Value<int> rowid,
});

class $$VendorsTableFilterComposer
    extends Composer<_$AppLocalDatabase, $VendorsTable> {
  $$VendorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get logoUrl => $composableBuilder(
      column: $table.logoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverUrl => $composableBuilder(
      column: $table.coverUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reviewsCount => $composableBuilder(
      column: $table.reviewsCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderEstimationTime => $composableBuilder(
      column: $table.orderEstimationTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minimumOrderAmount => $composableBuilder(
      column: $table.minimumOrderAmount,
      builder: (column) => ColumnFilters(column));
}

class $$VendorsTableOrderingComposer
    extends Composer<_$AppLocalDatabase, $VendorsTable> {
  $$VendorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get logoUrl => $composableBuilder(
      column: $table.logoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverUrl => $composableBuilder(
      column: $table.coverUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reviewsCount => $composableBuilder(
      column: $table.reviewsCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderEstimationTime => $composableBuilder(
      column: $table.orderEstimationTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minimumOrderAmount => $composableBuilder(
      column: $table.minimumOrderAmount,
      builder: (column) => ColumnOrderings(column));
}

class $$VendorsTableAnnotationComposer
    extends Composer<_$AppLocalDatabase, $VendorsTable> {
  $$VendorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get logoUrl =>
      $composableBuilder(column: $table.logoUrl, builder: (column) => column);

  GeneratedColumn<String> get coverUrl =>
      $composableBuilder(column: $table.coverUrl, builder: (column) => column);

  GeneratedColumn<int> get reviewsCount => $composableBuilder(
      column: $table.reviewsCount, builder: (column) => column);

  GeneratedColumn<String> get orderEstimationTime => $composableBuilder(
      column: $table.orderEstimationTime, builder: (column) => column);

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<double> get minimumOrderAmount => $composableBuilder(
      column: $table.minimumOrderAmount, builder: (column) => column);
}

class $$VendorsTableTableManager extends RootTableManager<
    _$AppLocalDatabase,
    $VendorsTable,
    Vendor,
    $$VendorsTableFilterComposer,
    $$VendorsTableOrderingComposer,
    $$VendorsTableAnnotationComposer,
    $$VendorsTableCreateCompanionBuilder,
    $$VendorsTableUpdateCompanionBuilder,
    (Vendor, BaseReferences<_$AppLocalDatabase, $VendorsTable, Vendor>),
    Vendor,
    PrefetchHooks Function()> {
  $$VendorsTableTableManager(_$AppLocalDatabase db, $VendorsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VendorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VendorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VendorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> logoUrl = const Value.absent(),
            Value<String?> coverUrl = const Value.absent(),
            Value<int> reviewsCount = const Value.absent(),
            Value<String> orderEstimationTime = const Value.absent(),
            Value<double> rate = const Value.absent(),
            Value<double> minimumOrderAmount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VendorsCompanion(
            id: id,
            name: name,
            logoUrl: logoUrl,
            coverUrl: coverUrl,
            reviewsCount: reviewsCount,
            orderEstimationTime: orderEstimationTime,
            rate: rate,
            minimumOrderAmount: minimumOrderAmount,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> logoUrl = const Value.absent(),
            Value<String?> coverUrl = const Value.absent(),
            required int reviewsCount,
            required String orderEstimationTime,
            required double rate,
            required double minimumOrderAmount,
            Value<int> rowid = const Value.absent(),
          }) =>
              VendorsCompanion.insert(
            id: id,
            name: name,
            logoUrl: logoUrl,
            coverUrl: coverUrl,
            reviewsCount: reviewsCount,
            orderEstimationTime: orderEstimationTime,
            rate: rate,
            minimumOrderAmount: minimumOrderAmount,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VendorsTableProcessedTableManager = ProcessedTableManager<
    _$AppLocalDatabase,
    $VendorsTable,
    Vendor,
    $$VendorsTableFilterComposer,
    $$VendorsTableOrderingComposer,
    $$VendorsTableAnnotationComposer,
    $$VendorsTableCreateCompanionBuilder,
    $$VendorsTableUpdateCompanionBuilder,
    (Vendor, BaseReferences<_$AppLocalDatabase, $VendorsTable, Vendor>),
    Vendor,
    PrefetchHooks Function()>;
typedef $$EventsTableCreateCompanionBuilder = EventsCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<String?> imagePath,
  required DateTime date,
  required Uint8List reminders,
  Value<int> rowid,
});
typedef $$EventsTableUpdateCompanionBuilder = EventsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> imagePath,
  Value<DateTime> date,
  Value<Uint8List> reminders,
  Value<int> rowid,
});

class $$EventsTableFilterComposer
    extends Composer<_$AppLocalDatabase, $EventsTable> {
  $$EventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get reminders => $composableBuilder(
      column: $table.reminders, builder: (column) => ColumnFilters(column));
}

class $$EventsTableOrderingComposer
    extends Composer<_$AppLocalDatabase, $EventsTable> {
  $$EventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get reminders => $composableBuilder(
      column: $table.reminders, builder: (column) => ColumnOrderings(column));
}

class $$EventsTableAnnotationComposer
    extends Composer<_$AppLocalDatabase, $EventsTable> {
  $$EventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<Uint8List> get reminders =>
      $composableBuilder(column: $table.reminders, builder: (column) => column);
}

class $$EventsTableTableManager extends RootTableManager<
    _$AppLocalDatabase,
    $EventsTable,
    Event,
    $$EventsTableFilterComposer,
    $$EventsTableOrderingComposer,
    $$EventsTableAnnotationComposer,
    $$EventsTableCreateCompanionBuilder,
    $$EventsTableUpdateCompanionBuilder,
    (Event, BaseReferences<_$AppLocalDatabase, $EventsTable, Event>),
    Event,
    PrefetchHooks Function()> {
  $$EventsTableTableManager(_$AppLocalDatabase db, $EventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<Uint8List> reminders = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventsCompanion(
            id: id,
            name: name,
            description: description,
            imagePath: imagePath,
            date: date,
            reminders: reminders,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            required DateTime date,
            required Uint8List reminders,
            Value<int> rowid = const Value.absent(),
          }) =>
              EventsCompanion.insert(
            id: id,
            name: name,
            description: description,
            imagePath: imagePath,
            date: date,
            reminders: reminders,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EventsTableProcessedTableManager = ProcessedTableManager<
    _$AppLocalDatabase,
    $EventsTable,
    Event,
    $$EventsTableFilterComposer,
    $$EventsTableOrderingComposer,
    $$EventsTableAnnotationComposer,
    $$EventsTableCreateCompanionBuilder,
    $$EventsTableUpdateCompanionBuilder,
    (Event, BaseReferences<_$AppLocalDatabase, $EventsTable, Event>),
    Event,
    PrefetchHooks Function()>;
typedef $$VendorCategoriesProductsTableCreateCompanionBuilder
    = VendorCategoriesProductsCompanion Function({
  required String vendorId,
  required String categoryId,
  required String productId,
  Value<int> rowid,
});
typedef $$VendorCategoriesProductsTableUpdateCompanionBuilder
    = VendorCategoriesProductsCompanion Function({
  Value<String> vendorId,
  Value<String> categoryId,
  Value<String> productId,
  Value<int> rowid,
});

final class $$VendorCategoriesProductsTableReferences extends BaseReferences<
    _$AppLocalDatabase,
    $VendorCategoriesProductsTable,
    VendorCategoriesProduct> {
  $$VendorCategoriesProductsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductsTable _productIdTable(_$AppLocalDatabase db) =>
      db.products.createAlias($_aliasNameGenerator(
          db.vendorCategoriesProducts.productId, db.products.id));

  $$ProductsTableProcessedTableManager get productId {
    final manager = $$ProductsTableTableManager($_db, $_db.products)
        .filter((f) => f.id($_item.productId!));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$VendorCategoriesProductsTableFilterComposer
    extends Composer<_$AppLocalDatabase, $VendorCategoriesProductsTable> {
  $$VendorCategoriesProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get vendorId => $composableBuilder(
      column: $table.vendorId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableFilterComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VendorCategoriesProductsTableOrderingComposer
    extends Composer<_$AppLocalDatabase, $VendorCategoriesProductsTable> {
  $$VendorCategoriesProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get vendorId => $composableBuilder(
      column: $table.vendorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableOrderingComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VendorCategoriesProductsTableAnnotationComposer
    extends Composer<_$AppLocalDatabase, $VendorCategoriesProductsTable> {
  $$VendorCategoriesProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get vendorId =>
      $composableBuilder(column: $table.vendorId, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  $$ProductsTableAnnotationComposer get productId {
    final $$ProductsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableAnnotationComposer(
              $db: $db,
              $table: $db.products,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$VendorCategoriesProductsTableTableManager extends RootTableManager<
    _$AppLocalDatabase,
    $VendorCategoriesProductsTable,
    VendorCategoriesProduct,
    $$VendorCategoriesProductsTableFilterComposer,
    $$VendorCategoriesProductsTableOrderingComposer,
    $$VendorCategoriesProductsTableAnnotationComposer,
    $$VendorCategoriesProductsTableCreateCompanionBuilder,
    $$VendorCategoriesProductsTableUpdateCompanionBuilder,
    (VendorCategoriesProduct, $$VendorCategoriesProductsTableReferences),
    VendorCategoriesProduct,
    PrefetchHooks Function({bool productId})> {
  $$VendorCategoriesProductsTableTableManager(
      _$AppLocalDatabase db, $VendorCategoriesProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VendorCategoriesProductsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$VendorCategoriesProductsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VendorCategoriesProductsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> vendorId = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              VendorCategoriesProductsCompanion(
            vendorId: vendorId,
            categoryId: categoryId,
            productId: productId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String vendorId,
            required String categoryId,
            required String productId,
            Value<int> rowid = const Value.absent(),
          }) =>
              VendorCategoriesProductsCompanion.insert(
            vendorId: vendorId,
            categoryId: categoryId,
            productId: productId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$VendorCategoriesProductsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable: $$VendorCategoriesProductsTableReferences
                        ._productIdTable(db),
                    referencedColumn: $$VendorCategoriesProductsTableReferences
                        ._productIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$VendorCategoriesProductsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppLocalDatabase,
        $VendorCategoriesProductsTable,
        VendorCategoriesProduct,
        $$VendorCategoriesProductsTableFilterComposer,
        $$VendorCategoriesProductsTableOrderingComposer,
        $$VendorCategoriesProductsTableAnnotationComposer,
        $$VendorCategoriesProductsTableCreateCompanionBuilder,
        $$VendorCategoriesProductsTableUpdateCompanionBuilder,
        (VendorCategoriesProduct, $$VendorCategoriesProductsTableReferences),
        VendorCategoriesProduct,
        PrefetchHooks Function({bool productId})>;

class $AppLocalDatabaseManager {
  final _$AppLocalDatabase _db;
  $AppLocalDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$SearchHistoriesTableTableManager get searchHistories =>
      $$SearchHistoriesTableTableManager(_db, _db.searchHistories);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$VendorsTableTableManager get vendors =>
      $$VendorsTableTableManager(_db, _db.vendors);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$VendorCategoriesProductsTableTableManager get vendorCategoriesProducts =>
      $$VendorCategoriesProductsTableTableManager(
          _db, _db.vendorCategoriesProducts);
}
