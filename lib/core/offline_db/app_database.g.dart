// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthdayMeta = const VerificationMeta(
    'birthday',
  );
  @override
  late final GeneratedColumn<String> birthday = GeneratedColumn<String>(
    'birthday',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _memberSinceMeta = const VerificationMeta(
    'memberSince',
  );
  @override
  late final GeneratedColumn<String> memberSince = GeneratedColumn<String>(
    'member_since',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
    'theme',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('muted_light'),
  );
  static const VerificationMeta _pinHashMeta = const VerificationMeta(
    'pinHash',
  );
  @override
  late final GeneratedColumn<String> pinHash = GeneratedColumn<String>(
    'pin_hash',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('notSynced'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    email,
    birthday,
    memberSince,
    theme,
    pinHash,
    syncStatus,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile';
  @override
  VerificationContext validateIntegrity(
    Insertable<Profile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('birthday')) {
      context.handle(
        _birthdayMeta,
        birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta),
      );
    }
    if (data.containsKey('member_since')) {
      context.handle(
        _memberSinceMeta,
        memberSince.isAcceptableOrUnknown(
          data['member_since']!,
          _memberSinceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_memberSinceMeta);
    }
    if (data.containsKey('theme')) {
      context.handle(
        _themeMeta,
        theme.isAcceptableOrUnknown(data['theme']!, _themeMeta),
      );
    }
    if (data.containsKey('pin_hash')) {
      context.handle(
        _pinHashMeta,
        pinHash.isAcceptableOrUnknown(data['pin_hash']!, _pinHashMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      birthday: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}birthday'],
      ),
      memberSince: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}member_since'],
      )!,
      theme: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme'],
      )!,
      pinHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pin_hash'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
  final String id;
  final String name;
  final String? email;
  final String? birthday;
  final String memberSince;
  final String theme;
  final String? pinHash;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  const Profile({
    required this.id,
    required this.name,
    this.email,
    this.birthday,
    required this.memberSince,
    required this.theme,
    this.pinHash,
    required this.syncStatus,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || birthday != null) {
      map['birthday'] = Variable<String>(birthday);
    }
    map['member_since'] = Variable<String>(memberSince);
    map['theme'] = Variable<String>(theme);
    if (!nullToAbsent || pinHash != null) {
      map['pin_hash'] = Variable<String>(pinHash);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      name: Value(name),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      birthday: birthday == null && nullToAbsent
          ? const Value.absent()
          : Value(birthday),
      memberSince: Value(memberSince),
      theme: Value(theme),
      pinHash: pinHash == null && nullToAbsent
          ? const Value.absent()
          : Value(pinHash),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Profile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      birthday: serializer.fromJson<String?>(json['birthday']),
      memberSince: serializer.fromJson<String>(json['memberSince']),
      theme: serializer.fromJson<String>(json['theme']),
      pinHash: serializer.fromJson<String?>(json['pinHash']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'birthday': serializer.toJson<String?>(birthday),
      'memberSince': serializer.toJson<String>(memberSince),
      'theme': serializer.toJson<String>(theme),
      'pinHash': serializer.toJson<String?>(pinHash),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  Profile copyWith({
    String? id,
    String? name,
    Value<String?> email = const Value.absent(),
    Value<String?> birthday = const Value.absent(),
    String? memberSince,
    String? theme,
    Value<String?> pinHash = const Value.absent(),
    String? syncStatus,
    String? createdAt,
    String? updatedAt,
  }) => Profile(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email.present ? email.value : this.email,
    birthday: birthday.present ? birthday.value : this.birthday,
    memberSince: memberSince ?? this.memberSince,
    theme: theme ?? this.theme,
    pinHash: pinHash.present ? pinHash.value : this.pinHash,
    syncStatus: syncStatus ?? this.syncStatus,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      birthday: data.birthday.present ? data.birthday.value : this.birthday,
      memberSince: data.memberSince.present
          ? data.memberSince.value
          : this.memberSince,
      theme: data.theme.present ? data.theme.value : this.theme,
      pinHash: data.pinHash.present ? data.pinHash.value : this.pinHash,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('birthday: $birthday, ')
          ..write('memberSince: $memberSince, ')
          ..write('theme: $theme, ')
          ..write('pinHash: $pinHash, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    email,
    birthday,
    memberSince,
    theme,
    pinHash,
    syncStatus,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.birthday == this.birthday &&
          other.memberSince == this.memberSince &&
          other.theme == this.theme &&
          other.pinHash == this.pinHash &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> birthday;
  final Value<String> memberSince;
  final Value<String> theme;
  final Value<String?> pinHash;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.birthday = const Value.absent(),
    this.memberSince = const Value.absent(),
    this.theme = const Value.absent(),
    this.pinHash = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfilesCompanion.insert({
    required String id,
    required String name,
    this.email = const Value.absent(),
    this.birthday = const Value.absent(),
    required String memberSince,
    this.theme = const Value.absent(),
    this.pinHash = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       memberSince = Value(memberSince),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Profile> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? birthday,
    Expression<String>? memberSince,
    Expression<String>? theme,
    Expression<String>? pinHash,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (birthday != null) 'birthday': birthday,
      if (memberSince != null) 'member_since': memberSince,
      if (theme != null) 'theme': theme,
      if (pinHash != null) 'pin_hash': pinHash,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? email,
    Value<String?>? birthday,
    Value<String>? memberSince,
    Value<String>? theme,
    Value<String?>? pinHash,
    Value<String>? syncStatus,
    Value<String>? createdAt,
    Value<String>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      memberSince: memberSince ?? this.memberSince,
      theme: theme ?? this.theme,
      pinHash: pinHash ?? this.pinHash,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<String>(birthday.value);
    }
    if (memberSince.present) {
      map['member_since'] = Variable<String>(memberSince.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (pinHash.present) {
      map['pin_hash'] = Variable<String>(pinHash.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('birthday: $birthday, ')
          ..write('memberSince: $memberSince, ')
          ..write('theme: $theme, ')
          ..write('pinHash: $pinHash, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IntentionsTable extends Intentions
    with TableInfo<$IntentionsTable, Intention> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IntentionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _forDateMeta = const VerificationMeta(
    'forDate',
  );
  @override
  late final GeneratedColumn<String> forDate = GeneratedColumn<String>(
    'for_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<int> isCompleted = GeneratedColumn<int>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<String> completedAt = GeneratedColumn<String>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('notSynced'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    forDate,
    body,
    position,
    isCompleted,
    completedAt,
    syncStatus,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'intention';
  @override
  VerificationContext validateIntegrity(
    Insertable<Intention> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('for_date')) {
      context.handle(
        _forDateMeta,
        forDate.isAcceptableOrUnknown(data['for_date']!, _forDateMeta),
      );
    } else if (isInserting) {
      context.missing(_forDateMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Intention map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Intention(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      forDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}for_date'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_completed'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}completed_at'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $IntentionsTable createAlias(String alias) {
    return $IntentionsTable(attachedDatabase, alias);
  }
}

class Intention extends DataClass implements Insertable<Intention> {
  final String id;
  final String profileId;
  final String forDate;
  final String body;
  final int position;
  final int isCompleted;
  final String? completedAt;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  const Intention({
    required this.id,
    required this.profileId,
    required this.forDate,
    required this.body,
    required this.position,
    required this.isCompleted,
    this.completedAt,
    required this.syncStatus,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['profile_id'] = Variable<String>(profileId);
    map['for_date'] = Variable<String>(forDate);
    map['body'] = Variable<String>(body);
    map['position'] = Variable<int>(position);
    map['is_completed'] = Variable<int>(isCompleted);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<String>(completedAt);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  IntentionsCompanion toCompanion(bool nullToAbsent) {
    return IntentionsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      forDate: Value(forDate),
      body: Value(body),
      position: Value(position),
      isCompleted: Value(isCompleted),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Intention.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Intention(
      id: serializer.fromJson<String>(json['id']),
      profileId: serializer.fromJson<String>(json['profileId']),
      forDate: serializer.fromJson<String>(json['forDate']),
      body: serializer.fromJson<String>(json['body']),
      position: serializer.fromJson<int>(json['position']),
      isCompleted: serializer.fromJson<int>(json['isCompleted']),
      completedAt: serializer.fromJson<String?>(json['completedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'profileId': serializer.toJson<String>(profileId),
      'forDate': serializer.toJson<String>(forDate),
      'body': serializer.toJson<String>(body),
      'position': serializer.toJson<int>(position),
      'isCompleted': serializer.toJson<int>(isCompleted),
      'completedAt': serializer.toJson<String?>(completedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  Intention copyWith({
    String? id,
    String? profileId,
    String? forDate,
    String? body,
    int? position,
    int? isCompleted,
    Value<String?> completedAt = const Value.absent(),
    String? syncStatus,
    String? createdAt,
    String? updatedAt,
  }) => Intention(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    forDate: forDate ?? this.forDate,
    body: body ?? this.body,
    position: position ?? this.position,
    isCompleted: isCompleted ?? this.isCompleted,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    syncStatus: syncStatus ?? this.syncStatus,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Intention copyWithCompanion(IntentionsCompanion data) {
    return Intention(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      forDate: data.forDate.present ? data.forDate.value : this.forDate,
      body: data.body.present ? data.body.value : this.body,
      position: data.position.present ? data.position.value : this.position,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Intention(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('forDate: $forDate, ')
          ..write('body: $body, ')
          ..write('position: $position, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('completedAt: $completedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    forDate,
    body,
    position,
    isCompleted,
    completedAt,
    syncStatus,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Intention &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.forDate == this.forDate &&
          other.body == this.body &&
          other.position == this.position &&
          other.isCompleted == this.isCompleted &&
          other.completedAt == this.completedAt &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class IntentionsCompanion extends UpdateCompanion<Intention> {
  final Value<String> id;
  final Value<String> profileId;
  final Value<String> forDate;
  final Value<String> body;
  final Value<int> position;
  final Value<int> isCompleted;
  final Value<String?> completedAt;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const IntentionsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.forDate = const Value.absent(),
    this.body = const Value.absent(),
    this.position = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IntentionsCompanion.insert({
    required String id,
    required String profileId,
    required String forDate,
    required String body,
    required int position,
    this.isCompleted = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       profileId = Value(profileId),
       forDate = Value(forDate),
       body = Value(body),
       position = Value(position),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Intention> custom({
    Expression<String>? id,
    Expression<String>? profileId,
    Expression<String>? forDate,
    Expression<String>? body,
    Expression<int>? position,
    Expression<int>? isCompleted,
    Expression<String>? completedAt,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (forDate != null) 'for_date': forDate,
      if (body != null) 'body': body,
      if (position != null) 'position': position,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (completedAt != null) 'completed_at': completedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IntentionsCompanion copyWith({
    Value<String>? id,
    Value<String>? profileId,
    Value<String>? forDate,
    Value<String>? body,
    Value<int>? position,
    Value<int>? isCompleted,
    Value<String?>? completedAt,
    Value<String>? syncStatus,
    Value<String>? createdAt,
    Value<String>? updatedAt,
    Value<int>? rowid,
  }) {
    return IntentionsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      forDate: forDate ?? this.forDate,
      body: body ?? this.body,
      position: position ?? this.position,
      isCompleted: isCompleted ?? this.isCompleted,
      completedAt: completedAt ?? this.completedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (forDate.present) {
      map['for_date'] = Variable<String>(forDate.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<int>(isCompleted.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<String>(completedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IntentionsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('forDate: $forDate, ')
          ..write('body: $body, ')
          ..write('position: $position, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('completedAt: $completedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReflectionsTable extends Reflections
    with TableInfo<$ReflectionsTable, Reflection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReflectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _forDateMeta = const VerificationMeta(
    'forDate',
  );
  @override
  late final GeneratedColumn<String> forDate = GeneratedColumn<String>(
    'for_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _learningMeta = const VerificationMeta(
    'learning',
  );
  @override
  late final GeneratedColumn<String> learning = GeneratedColumn<String>(
    'learning',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _winsMeta = const VerificationMeta('wins');
  @override
  late final GeneratedColumn<String> wins = GeneratedColumn<String>(
    'wins',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gratitudeScoreMeta = const VerificationMeta(
    'gratitudeScore',
  );
  @override
  late final GeneratedColumn<int> gratitudeScore = GeneratedColumn<int>(
    'gratitude_score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('notSynced'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    forDate,
    title,
    learning,
    wins,
    gratitudeScore,
    photoPath,
    syncStatus,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reflection';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reflection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('for_date')) {
      context.handle(
        _forDateMeta,
        forDate.isAcceptableOrUnknown(data['for_date']!, _forDateMeta),
      );
    } else if (isInserting) {
      context.missing(_forDateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    }
    if (data.containsKey('learning')) {
      context.handle(
        _learningMeta,
        learning.isAcceptableOrUnknown(data['learning']!, _learningMeta),
      );
    } else if (isInserting) {
      context.missing(_learningMeta);
    }
    if (data.containsKey('wins')) {
      context.handle(
        _winsMeta,
        wins.isAcceptableOrUnknown(data['wins']!, _winsMeta),
      );
    } else if (isInserting) {
      context.missing(_winsMeta);
    }
    if (data.containsKey('gratitude_score')) {
      context.handle(
        _gratitudeScoreMeta,
        gratitudeScore.isAcceptableOrUnknown(
          data['gratitude_score']!,
          _gratitudeScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_gratitudeScoreMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reflection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reflection(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      forDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}for_date'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      ),
      learning: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}learning'],
      )!,
      wins: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wins'],
      )!,
      gratitudeScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}gratitude_score'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      ),
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ReflectionsTable createAlias(String alias) {
    return $ReflectionsTable(attachedDatabase, alias);
  }
}

class Reflection extends DataClass implements Insertable<Reflection> {
  final String id;
  final String profileId;
  final String forDate;
  final String? title;
  final String learning;
  final String wins;
  final int gratitudeScore;
  final String? photoPath;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  const Reflection({
    required this.id,
    required this.profileId,
    required this.forDate,
    this.title,
    required this.learning,
    required this.wins,
    required this.gratitudeScore,
    this.photoPath,
    required this.syncStatus,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['profile_id'] = Variable<String>(profileId);
    map['for_date'] = Variable<String>(forDate);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    map['learning'] = Variable<String>(learning);
    map['wins'] = Variable<String>(wins);
    map['gratitude_score'] = Variable<int>(gratitudeScore);
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  ReflectionsCompanion toCompanion(bool nullToAbsent) {
    return ReflectionsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      forDate: Value(forDate),
      title: title == null && nullToAbsent
          ? const Value.absent()
          : Value(title),
      learning: Value(learning),
      wins: Value(wins),
      gratitudeScore: Value(gratitudeScore),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Reflection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reflection(
      id: serializer.fromJson<String>(json['id']),
      profileId: serializer.fromJson<String>(json['profileId']),
      forDate: serializer.fromJson<String>(json['forDate']),
      title: serializer.fromJson<String?>(json['title']),
      learning: serializer.fromJson<String>(json['learning']),
      wins: serializer.fromJson<String>(json['wins']),
      gratitudeScore: serializer.fromJson<int>(json['gratitudeScore']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'profileId': serializer.toJson<String>(profileId),
      'forDate': serializer.toJson<String>(forDate),
      'title': serializer.toJson<String?>(title),
      'learning': serializer.toJson<String>(learning),
      'wins': serializer.toJson<String>(wins),
      'gratitudeScore': serializer.toJson<int>(gratitudeScore),
      'photoPath': serializer.toJson<String?>(photoPath),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  Reflection copyWith({
    String? id,
    String? profileId,
    String? forDate,
    Value<String?> title = const Value.absent(),
    String? learning,
    String? wins,
    int? gratitudeScore,
    Value<String?> photoPath = const Value.absent(),
    String? syncStatus,
    String? createdAt,
    String? updatedAt,
  }) => Reflection(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    forDate: forDate ?? this.forDate,
    title: title.present ? title.value : this.title,
    learning: learning ?? this.learning,
    wins: wins ?? this.wins,
    gratitudeScore: gratitudeScore ?? this.gratitudeScore,
    photoPath: photoPath.present ? photoPath.value : this.photoPath,
    syncStatus: syncStatus ?? this.syncStatus,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Reflection copyWithCompanion(ReflectionsCompanion data) {
    return Reflection(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      forDate: data.forDate.present ? data.forDate.value : this.forDate,
      title: data.title.present ? data.title.value : this.title,
      learning: data.learning.present ? data.learning.value : this.learning,
      wins: data.wins.present ? data.wins.value : this.wins,
      gratitudeScore: data.gratitudeScore.present
          ? data.gratitudeScore.value
          : this.gratitudeScore,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reflection(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('forDate: $forDate, ')
          ..write('title: $title, ')
          ..write('learning: $learning, ')
          ..write('wins: $wins, ')
          ..write('gratitudeScore: $gratitudeScore, ')
          ..write('photoPath: $photoPath, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    forDate,
    title,
    learning,
    wins,
    gratitudeScore,
    photoPath,
    syncStatus,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reflection &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.forDate == this.forDate &&
          other.title == this.title &&
          other.learning == this.learning &&
          other.wins == this.wins &&
          other.gratitudeScore == this.gratitudeScore &&
          other.photoPath == this.photoPath &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ReflectionsCompanion extends UpdateCompanion<Reflection> {
  final Value<String> id;
  final Value<String> profileId;
  final Value<String> forDate;
  final Value<String?> title;
  final Value<String> learning;
  final Value<String> wins;
  final Value<int> gratitudeScore;
  final Value<String?> photoPath;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const ReflectionsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.forDate = const Value.absent(),
    this.title = const Value.absent(),
    this.learning = const Value.absent(),
    this.wins = const Value.absent(),
    this.gratitudeScore = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReflectionsCompanion.insert({
    required String id,
    required String profileId,
    required String forDate,
    this.title = const Value.absent(),
    required String learning,
    required String wins,
    required int gratitudeScore,
    this.photoPath = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       profileId = Value(profileId),
       forDate = Value(forDate),
       learning = Value(learning),
       wins = Value(wins),
       gratitudeScore = Value(gratitudeScore),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Reflection> custom({
    Expression<String>? id,
    Expression<String>? profileId,
    Expression<String>? forDate,
    Expression<String>? title,
    Expression<String>? learning,
    Expression<String>? wins,
    Expression<int>? gratitudeScore,
    Expression<String>? photoPath,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (forDate != null) 'for_date': forDate,
      if (title != null) 'title': title,
      if (learning != null) 'learning': learning,
      if (wins != null) 'wins': wins,
      if (gratitudeScore != null) 'gratitude_score': gratitudeScore,
      if (photoPath != null) 'photo_path': photoPath,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReflectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? profileId,
    Value<String>? forDate,
    Value<String?>? title,
    Value<String>? learning,
    Value<String>? wins,
    Value<int>? gratitudeScore,
    Value<String?>? photoPath,
    Value<String>? syncStatus,
    Value<String>? createdAt,
    Value<String>? updatedAt,
    Value<int>? rowid,
  }) {
    return ReflectionsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      forDate: forDate ?? this.forDate,
      title: title ?? this.title,
      learning: learning ?? this.learning,
      wins: wins ?? this.wins,
      gratitudeScore: gratitudeScore ?? this.gratitudeScore,
      photoPath: photoPath ?? this.photoPath,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (forDate.present) {
      map['for_date'] = Variable<String>(forDate.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (learning.present) {
      map['learning'] = Variable<String>(learning.value);
    }
    if (wins.present) {
      map['wins'] = Variable<String>(wins.value);
    }
    if (gratitudeScore.present) {
      map['gratitude_score'] = Variable<int>(gratitudeScore.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReflectionsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('forDate: $forDate, ')
          ..write('title: $title, ')
          ..write('learning: $learning, ')
          ..write('wins: $wins, ')
          ..write('gratitudeScore: $gratitudeScore, ')
          ..write('photoPath: $photoPath, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $KeyLearningsTable extends KeyLearnings
    with TableInfo<$KeyLearningsTable, KeyLearning> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KeyLearningsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reflectionIdMeta = const VerificationMeta(
    'reflectionId',
  );
  @override
  late final GeneratedColumn<String> reflectionId = GeneratedColumn<String>(
    'reflection_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('notSynced'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, reflectionId, label, syncStatus];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'key_learning';
  @override
  VerificationContext validateIntegrity(
    Insertable<KeyLearning> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('reflection_id')) {
      context.handle(
        _reflectionIdMeta,
        reflectionId.isAcceptableOrUnknown(
          data['reflection_id']!,
          _reflectionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reflectionIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KeyLearning map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KeyLearning(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      reflectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reflection_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $KeyLearningsTable createAlias(String alias) {
    return $KeyLearningsTable(attachedDatabase, alias);
  }
}

class KeyLearning extends DataClass implements Insertable<KeyLearning> {
  final String id;
  final String reflectionId;
  final String label;
  final String syncStatus;
  const KeyLearning({
    required this.id,
    required this.reflectionId,
    required this.label,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['reflection_id'] = Variable<String>(reflectionId);
    map['label'] = Variable<String>(label);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  KeyLearningsCompanion toCompanion(bool nullToAbsent) {
    return KeyLearningsCompanion(
      id: Value(id),
      reflectionId: Value(reflectionId),
      label: Value(label),
      syncStatus: Value(syncStatus),
    );
  }

  factory KeyLearning.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KeyLearning(
      id: serializer.fromJson<String>(json['id']),
      reflectionId: serializer.fromJson<String>(json['reflectionId']),
      label: serializer.fromJson<String>(json['label']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'reflectionId': serializer.toJson<String>(reflectionId),
      'label': serializer.toJson<String>(label),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  KeyLearning copyWith({
    String? id,
    String? reflectionId,
    String? label,
    String? syncStatus,
  }) => KeyLearning(
    id: id ?? this.id,
    reflectionId: reflectionId ?? this.reflectionId,
    label: label ?? this.label,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  KeyLearning copyWithCompanion(KeyLearningsCompanion data) {
    return KeyLearning(
      id: data.id.present ? data.id.value : this.id,
      reflectionId: data.reflectionId.present
          ? data.reflectionId.value
          : this.reflectionId,
      label: data.label.present ? data.label.value : this.label,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KeyLearning(')
          ..write('id: $id, ')
          ..write('reflectionId: $reflectionId, ')
          ..write('label: $label, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reflectionId, label, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KeyLearning &&
          other.id == this.id &&
          other.reflectionId == this.reflectionId &&
          other.label == this.label &&
          other.syncStatus == this.syncStatus);
}

class KeyLearningsCompanion extends UpdateCompanion<KeyLearning> {
  final Value<String> id;
  final Value<String> reflectionId;
  final Value<String> label;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const KeyLearningsCompanion({
    this.id = const Value.absent(),
    this.reflectionId = const Value.absent(),
    this.label = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KeyLearningsCompanion.insert({
    required String id,
    required String reflectionId,
    required String label,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       reflectionId = Value(reflectionId),
       label = Value(label);
  static Insertable<KeyLearning> custom({
    Expression<String>? id,
    Expression<String>? reflectionId,
    Expression<String>? label,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reflectionId != null) 'reflection_id': reflectionId,
      if (label != null) 'label': label,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KeyLearningsCompanion copyWith({
    Value<String>? id,
    Value<String>? reflectionId,
    Value<String>? label,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return KeyLearningsCompanion(
      id: id ?? this.id,
      reflectionId: reflectionId ?? this.reflectionId,
      label: label ?? this.label,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (reflectionId.present) {
      map['reflection_id'] = Variable<String>(reflectionId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeyLearningsCompanion(')
          ..write('id: $id, ')
          ..write('reflectionId: $reflectionId, ')
          ..write('label: $label, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsageCountersTable extends UsageCounters
    with TableInfo<$UsageCountersTable, UsageCounter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsageCountersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalReflectionsMeta = const VerificationMeta(
    'totalReflections',
  );
  @override
  late final GeneratedColumn<int> totalReflections = GeneratedColumn<int>(
    'total_reflections',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currentStreakMeta = const VerificationMeta(
    'currentStreak',
  );
  @override
  late final GeneratedColumn<int> currentStreak = GeneratedColumn<int>(
    'current_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _longestStreakMeta = const VerificationMeta(
    'longestStreak',
  );
  @override
  late final GeneratedColumn<int> longestStreak = GeneratedColumn<int>(
    'longest_streak',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _intentionsSetCountMeta =
      const VerificationMeta('intentionsSetCount');
  @override
  late final GeneratedColumn<int> intentionsSetCount = GeneratedColumn<int>(
    'intentions_set_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _intentionsCompletedCountMeta =
      const VerificationMeta('intentionsCompletedCount');
  @override
  late final GeneratedColumn<int> intentionsCompletedCount =
      GeneratedColumn<int>(
        'intentions_completed_count',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _daysCompletedMeta = const VerificationMeta(
    'daysCompleted',
  );
  @override
  late final GeneratedColumn<int> daysCompleted = GeneratedColumn<int>(
    'days_completed',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _appOpenCountMeta = const VerificationMeta(
    'appOpenCount',
  );
  @override
  late final GeneratedColumn<int> appOpenCount = GeneratedColumn<int>(
    'app_open_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastActiveDateMeta = const VerificationMeta(
    'lastActiveDate',
  );
  @override
  late final GeneratedColumn<String> lastActiveDate = GeneratedColumn<String>(
    'last_active_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('notSynced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    profileId,
    totalReflections,
    currentStreak,
    longestStreak,
    intentionsSetCount,
    intentionsCompletedCount,
    daysCompleted,
    appOpenCount,
    lastActiveDate,
    updatedAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usage_counter';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsageCounter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('total_reflections')) {
      context.handle(
        _totalReflectionsMeta,
        totalReflections.isAcceptableOrUnknown(
          data['total_reflections']!,
          _totalReflectionsMeta,
        ),
      );
    }
    if (data.containsKey('current_streak')) {
      context.handle(
        _currentStreakMeta,
        currentStreak.isAcceptableOrUnknown(
          data['current_streak']!,
          _currentStreakMeta,
        ),
      );
    }
    if (data.containsKey('longest_streak')) {
      context.handle(
        _longestStreakMeta,
        longestStreak.isAcceptableOrUnknown(
          data['longest_streak']!,
          _longestStreakMeta,
        ),
      );
    }
    if (data.containsKey('intentions_set_count')) {
      context.handle(
        _intentionsSetCountMeta,
        intentionsSetCount.isAcceptableOrUnknown(
          data['intentions_set_count']!,
          _intentionsSetCountMeta,
        ),
      );
    }
    if (data.containsKey('intentions_completed_count')) {
      context.handle(
        _intentionsCompletedCountMeta,
        intentionsCompletedCount.isAcceptableOrUnknown(
          data['intentions_completed_count']!,
          _intentionsCompletedCountMeta,
        ),
      );
    }
    if (data.containsKey('days_completed')) {
      context.handle(
        _daysCompletedMeta,
        daysCompleted.isAcceptableOrUnknown(
          data['days_completed']!,
          _daysCompletedMeta,
        ),
      );
    }
    if (data.containsKey('app_open_count')) {
      context.handle(
        _appOpenCountMeta,
        appOpenCount.isAcceptableOrUnknown(
          data['app_open_count']!,
          _appOpenCountMeta,
        ),
      );
    }
    if (data.containsKey('last_active_date')) {
      context.handle(
        _lastActiveDateMeta,
        lastActiveDate.isAcceptableOrUnknown(
          data['last_active_date']!,
          _lastActiveDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastActiveDateMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {profileId};
  @override
  UsageCounter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsageCounter(
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      totalReflections: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_reflections'],
      )!,
      currentStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_streak'],
      )!,
      longestStreak: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}longest_streak'],
      )!,
      intentionsSetCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}intentions_set_count'],
      )!,
      intentionsCompletedCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}intentions_completed_count'],
      )!,
      daysCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}days_completed'],
      )!,
      appOpenCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}app_open_count'],
      )!,
      lastActiveDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_active_date'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $UsageCountersTable createAlias(String alias) {
    return $UsageCountersTable(attachedDatabase, alias);
  }
}

class UsageCounter extends DataClass implements Insertable<UsageCounter> {
  final String profileId;
  final int totalReflections;
  final int currentStreak;
  final int longestStreak;
  final int intentionsSetCount;
  final int intentionsCompletedCount;
  final int daysCompleted;
  final int appOpenCount;
  final String lastActiveDate;
  final String updatedAt;
  final String syncStatus;
  const UsageCounter({
    required this.profileId,
    required this.totalReflections,
    required this.currentStreak,
    required this.longestStreak,
    required this.intentionsSetCount,
    required this.intentionsCompletedCount,
    required this.daysCompleted,
    required this.appOpenCount,
    required this.lastActiveDate,
    required this.updatedAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['profile_id'] = Variable<String>(profileId);
    map['total_reflections'] = Variable<int>(totalReflections);
    map['current_streak'] = Variable<int>(currentStreak);
    map['longest_streak'] = Variable<int>(longestStreak);
    map['intentions_set_count'] = Variable<int>(intentionsSetCount);
    map['intentions_completed_count'] = Variable<int>(intentionsCompletedCount);
    map['days_completed'] = Variable<int>(daysCompleted);
    map['app_open_count'] = Variable<int>(appOpenCount);
    map['last_active_date'] = Variable<String>(lastActiveDate);
    map['updated_at'] = Variable<String>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  UsageCountersCompanion toCompanion(bool nullToAbsent) {
    return UsageCountersCompanion(
      profileId: Value(profileId),
      totalReflections: Value(totalReflections),
      currentStreak: Value(currentStreak),
      longestStreak: Value(longestStreak),
      intentionsSetCount: Value(intentionsSetCount),
      intentionsCompletedCount: Value(intentionsCompletedCount),
      daysCompleted: Value(daysCompleted),
      appOpenCount: Value(appOpenCount),
      lastActiveDate: Value(lastActiveDate),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory UsageCounter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsageCounter(
      profileId: serializer.fromJson<String>(json['profileId']),
      totalReflections: serializer.fromJson<int>(json['totalReflections']),
      currentStreak: serializer.fromJson<int>(json['currentStreak']),
      longestStreak: serializer.fromJson<int>(json['longestStreak']),
      intentionsSetCount: serializer.fromJson<int>(json['intentionsSetCount']),
      intentionsCompletedCount: serializer.fromJson<int>(
        json['intentionsCompletedCount'],
      ),
      daysCompleted: serializer.fromJson<int>(json['daysCompleted']),
      appOpenCount: serializer.fromJson<int>(json['appOpenCount']),
      lastActiveDate: serializer.fromJson<String>(json['lastActiveDate']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'profileId': serializer.toJson<String>(profileId),
      'totalReflections': serializer.toJson<int>(totalReflections),
      'currentStreak': serializer.toJson<int>(currentStreak),
      'longestStreak': serializer.toJson<int>(longestStreak),
      'intentionsSetCount': serializer.toJson<int>(intentionsSetCount),
      'intentionsCompletedCount': serializer.toJson<int>(
        intentionsCompletedCount,
      ),
      'daysCompleted': serializer.toJson<int>(daysCompleted),
      'appOpenCount': serializer.toJson<int>(appOpenCount),
      'lastActiveDate': serializer.toJson<String>(lastActiveDate),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  UsageCounter copyWith({
    String? profileId,
    int? totalReflections,
    int? currentStreak,
    int? longestStreak,
    int? intentionsSetCount,
    int? intentionsCompletedCount,
    int? daysCompleted,
    int? appOpenCount,
    String? lastActiveDate,
    String? updatedAt,
    String? syncStatus,
  }) => UsageCounter(
    profileId: profileId ?? this.profileId,
    totalReflections: totalReflections ?? this.totalReflections,
    currentStreak: currentStreak ?? this.currentStreak,
    longestStreak: longestStreak ?? this.longestStreak,
    intentionsSetCount: intentionsSetCount ?? this.intentionsSetCount,
    intentionsCompletedCount:
        intentionsCompletedCount ?? this.intentionsCompletedCount,
    daysCompleted: daysCompleted ?? this.daysCompleted,
    appOpenCount: appOpenCount ?? this.appOpenCount,
    lastActiveDate: lastActiveDate ?? this.lastActiveDate,
    updatedAt: updatedAt ?? this.updatedAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  UsageCounter copyWithCompanion(UsageCountersCompanion data) {
    return UsageCounter(
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      totalReflections: data.totalReflections.present
          ? data.totalReflections.value
          : this.totalReflections,
      currentStreak: data.currentStreak.present
          ? data.currentStreak.value
          : this.currentStreak,
      longestStreak: data.longestStreak.present
          ? data.longestStreak.value
          : this.longestStreak,
      intentionsSetCount: data.intentionsSetCount.present
          ? data.intentionsSetCount.value
          : this.intentionsSetCount,
      intentionsCompletedCount: data.intentionsCompletedCount.present
          ? data.intentionsCompletedCount.value
          : this.intentionsCompletedCount,
      daysCompleted: data.daysCompleted.present
          ? data.daysCompleted.value
          : this.daysCompleted,
      appOpenCount: data.appOpenCount.present
          ? data.appOpenCount.value
          : this.appOpenCount,
      lastActiveDate: data.lastActiveDate.present
          ? data.lastActiveDate.value
          : this.lastActiveDate,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsageCounter(')
          ..write('profileId: $profileId, ')
          ..write('totalReflections: $totalReflections, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('intentionsSetCount: $intentionsSetCount, ')
          ..write('intentionsCompletedCount: $intentionsCompletedCount, ')
          ..write('daysCompleted: $daysCompleted, ')
          ..write('appOpenCount: $appOpenCount, ')
          ..write('lastActiveDate: $lastActiveDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    profileId,
    totalReflections,
    currentStreak,
    longestStreak,
    intentionsSetCount,
    intentionsCompletedCount,
    daysCompleted,
    appOpenCount,
    lastActiveDate,
    updatedAt,
    syncStatus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsageCounter &&
          other.profileId == this.profileId &&
          other.totalReflections == this.totalReflections &&
          other.currentStreak == this.currentStreak &&
          other.longestStreak == this.longestStreak &&
          other.intentionsSetCount == this.intentionsSetCount &&
          other.intentionsCompletedCount == this.intentionsCompletedCount &&
          other.daysCompleted == this.daysCompleted &&
          other.appOpenCount == this.appOpenCount &&
          other.lastActiveDate == this.lastActiveDate &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class UsageCountersCompanion extends UpdateCompanion<UsageCounter> {
  final Value<String> profileId;
  final Value<int> totalReflections;
  final Value<int> currentStreak;
  final Value<int> longestStreak;
  final Value<int> intentionsSetCount;
  final Value<int> intentionsCompletedCount;
  final Value<int> daysCompleted;
  final Value<int> appOpenCount;
  final Value<String> lastActiveDate;
  final Value<String> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const UsageCountersCompanion({
    this.profileId = const Value.absent(),
    this.totalReflections = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.intentionsSetCount = const Value.absent(),
    this.intentionsCompletedCount = const Value.absent(),
    this.daysCompleted = const Value.absent(),
    this.appOpenCount = const Value.absent(),
    this.lastActiveDate = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsageCountersCompanion.insert({
    required String profileId,
    this.totalReflections = const Value.absent(),
    this.currentStreak = const Value.absent(),
    this.longestStreak = const Value.absent(),
    this.intentionsSetCount = const Value.absent(),
    this.intentionsCompletedCount = const Value.absent(),
    this.daysCompleted = const Value.absent(),
    this.appOpenCount = const Value.absent(),
    required String lastActiveDate,
    required String updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : profileId = Value(profileId),
       lastActiveDate = Value(lastActiveDate),
       updatedAt = Value(updatedAt);
  static Insertable<UsageCounter> custom({
    Expression<String>? profileId,
    Expression<int>? totalReflections,
    Expression<int>? currentStreak,
    Expression<int>? longestStreak,
    Expression<int>? intentionsSetCount,
    Expression<int>? intentionsCompletedCount,
    Expression<int>? daysCompleted,
    Expression<int>? appOpenCount,
    Expression<String>? lastActiveDate,
    Expression<String>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (profileId != null) 'profile_id': profileId,
      if (totalReflections != null) 'total_reflections': totalReflections,
      if (currentStreak != null) 'current_streak': currentStreak,
      if (longestStreak != null) 'longest_streak': longestStreak,
      if (intentionsSetCount != null)
        'intentions_set_count': intentionsSetCount,
      if (intentionsCompletedCount != null)
        'intentions_completed_count': intentionsCompletedCount,
      if (daysCompleted != null) 'days_completed': daysCompleted,
      if (appOpenCount != null) 'app_open_count': appOpenCount,
      if (lastActiveDate != null) 'last_active_date': lastActiveDate,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsageCountersCompanion copyWith({
    Value<String>? profileId,
    Value<int>? totalReflections,
    Value<int>? currentStreak,
    Value<int>? longestStreak,
    Value<int>? intentionsSetCount,
    Value<int>? intentionsCompletedCount,
    Value<int>? daysCompleted,
    Value<int>? appOpenCount,
    Value<String>? lastActiveDate,
    Value<String>? updatedAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return UsageCountersCompanion(
      profileId: profileId ?? this.profileId,
      totalReflections: totalReflections ?? this.totalReflections,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      intentionsSetCount: intentionsSetCount ?? this.intentionsSetCount,
      intentionsCompletedCount:
          intentionsCompletedCount ?? this.intentionsCompletedCount,
      daysCompleted: daysCompleted ?? this.daysCompleted,
      appOpenCount: appOpenCount ?? this.appOpenCount,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (totalReflections.present) {
      map['total_reflections'] = Variable<int>(totalReflections.value);
    }
    if (currentStreak.present) {
      map['current_streak'] = Variable<int>(currentStreak.value);
    }
    if (longestStreak.present) {
      map['longest_streak'] = Variable<int>(longestStreak.value);
    }
    if (intentionsSetCount.present) {
      map['intentions_set_count'] = Variable<int>(intentionsSetCount.value);
    }
    if (intentionsCompletedCount.present) {
      map['intentions_completed_count'] = Variable<int>(
        intentionsCompletedCount.value,
      );
    }
    if (daysCompleted.present) {
      map['days_completed'] = Variable<int>(daysCompleted.value);
    }
    if (appOpenCount.present) {
      map['app_open_count'] = Variable<int>(appOpenCount.value);
    }
    if (lastActiveDate.present) {
      map['last_active_date'] = Variable<String>(lastActiveDate.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsageCountersCompanion(')
          ..write('profileId: $profileId, ')
          ..write('totalReflections: $totalReflections, ')
          ..write('currentStreak: $currentStreak, ')
          ..write('longestStreak: $longestStreak, ')
          ..write('intentionsSetCount: $intentionsSetCount, ')
          ..write('intentionsCompletedCount: $intentionsCompletedCount, ')
          ..write('daysCompleted: $daysCompleted, ')
          ..write('appOpenCount: $appOpenCount, ')
          ..write('lastActiveDate: $lastActiveDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LearningTagCountsTable extends LearningTagCounts
    with TableInfo<$LearningTagCountsTable, LearningTagCount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningTagCountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [profileId, label, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_tag_count';
  @override
  VerificationContext validateIntegrity(
    Insertable<LearningTagCount> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {profileId, label};
  @override
  LearningTagCount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningTagCount(
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
    );
  }

  @override
  $LearningTagCountsTable createAlias(String alias) {
    return $LearningTagCountsTable(attachedDatabase, alias);
  }
}

class LearningTagCount extends DataClass
    implements Insertable<LearningTagCount> {
  final String profileId;
  final String label;
  final int count;
  const LearningTagCount({
    required this.profileId,
    required this.label,
    required this.count,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['profile_id'] = Variable<String>(profileId);
    map['label'] = Variable<String>(label);
    map['count'] = Variable<int>(count);
    return map;
  }

  LearningTagCountsCompanion toCompanion(bool nullToAbsent) {
    return LearningTagCountsCompanion(
      profileId: Value(profileId),
      label: Value(label),
      count: Value(count),
    );
  }

  factory LearningTagCount.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningTagCount(
      profileId: serializer.fromJson<String>(json['profileId']),
      label: serializer.fromJson<String>(json['label']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'profileId': serializer.toJson<String>(profileId),
      'label': serializer.toJson<String>(label),
      'count': serializer.toJson<int>(count),
    };
  }

  LearningTagCount copyWith({String? profileId, String? label, int? count}) =>
      LearningTagCount(
        profileId: profileId ?? this.profileId,
        label: label ?? this.label,
        count: count ?? this.count,
      );
  LearningTagCount copyWithCompanion(LearningTagCountsCompanion data) {
    return LearningTagCount(
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      label: data.label.present ? data.label.value : this.label,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningTagCount(')
          ..write('profileId: $profileId, ')
          ..write('label: $label, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(profileId, label, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningTagCount &&
          other.profileId == this.profileId &&
          other.label == this.label &&
          other.count == this.count);
}

class LearningTagCountsCompanion extends UpdateCompanion<LearningTagCount> {
  final Value<String> profileId;
  final Value<String> label;
  final Value<int> count;
  final Value<int> rowid;
  const LearningTagCountsCompanion({
    this.profileId = const Value.absent(),
    this.label = const Value.absent(),
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LearningTagCountsCompanion.insert({
    required String profileId,
    required String label,
    this.count = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : profileId = Value(profileId),
       label = Value(label);
  static Insertable<LearningTagCount> custom({
    Expression<String>? profileId,
    Expression<String>? label,
    Expression<int>? count,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (profileId != null) 'profile_id': profileId,
      if (label != null) 'label': label,
      if (count != null) 'count': count,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LearningTagCountsCompanion copyWith({
    Value<String>? profileId,
    Value<String>? label,
    Value<int>? count,
    Value<int>? rowid,
  }) {
    return LearningTagCountsCompanion(
      profileId: profileId ?? this.profileId,
      label: label ?? this.label,
      count: count ?? this.count,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningTagCountsCompanion(')
          ..write('profileId: $profileId, ')
          ..write('label: $label, ')
          ..write('count: $count, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InsightsTable extends Insights with TableInfo<$InsightsTable, Insight> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InsightsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<String> profileId = GeneratedColumn<String>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodMeta = const VerificationMeta('period');
  @override
  late final GeneratedColumn<String> period = GeneratedColumn<String>(
    'period',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('notSynced'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    period,
    body,
    createdAt,
    syncStatus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'insight';
  @override
  VerificationContext validateIntegrity(
    Insertable<Insight> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('period')) {
      context.handle(
        _periodMeta,
        period.isAcceptableOrUnknown(data['period']!, _periodMeta),
      );
    } else if (isInserting) {
      context.missing(_periodMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Insight map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Insight(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_id'],
      )!,
      period: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
    );
  }

  @override
  $InsightsTable createAlias(String alias) {
    return $InsightsTable(attachedDatabase, alias);
  }
}

class Insight extends DataClass implements Insertable<Insight> {
  final String id;
  final String profileId;
  final String period;
  final String body;
  final String createdAt;
  final String syncStatus;
  const Insight({
    required this.id,
    required this.profileId,
    required this.period,
    required this.body,
    required this.createdAt,
    required this.syncStatus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['profile_id'] = Variable<String>(profileId);
    map['period'] = Variable<String>(period);
    map['body'] = Variable<String>(body);
    map['created_at'] = Variable<String>(createdAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  InsightsCompanion toCompanion(bool nullToAbsent) {
    return InsightsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      period: Value(period),
      body: Value(body),
      createdAt: Value(createdAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory Insight.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Insight(
      id: serializer.fromJson<String>(json['id']),
      profileId: serializer.fromJson<String>(json['profileId']),
      period: serializer.fromJson<String>(json['period']),
      body: serializer.fromJson<String>(json['body']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'profileId': serializer.toJson<String>(profileId),
      'period': serializer.toJson<String>(period),
      'body': serializer.toJson<String>(body),
      'createdAt': serializer.toJson<String>(createdAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  Insight copyWith({
    String? id,
    String? profileId,
    String? period,
    String? body,
    String? createdAt,
    String? syncStatus,
  }) => Insight(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    period: period ?? this.period,
    body: body ?? this.body,
    createdAt: createdAt ?? this.createdAt,
    syncStatus: syncStatus ?? this.syncStatus,
  );
  Insight copyWithCompanion(InsightsCompanion data) {
    return Insight(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      period: data.period.present ? data.period.value : this.period,
      body: data.body.present ? data.body.value : this.body,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Insight(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('period: $period, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, profileId, period, body, createdAt, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Insight &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.period == this.period &&
          other.body == this.body &&
          other.createdAt == this.createdAt &&
          other.syncStatus == this.syncStatus);
}

class InsightsCompanion extends UpdateCompanion<Insight> {
  final Value<String> id;
  final Value<String> profileId;
  final Value<String> period;
  final Value<String> body;
  final Value<String> createdAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const InsightsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.period = const Value.absent(),
    this.body = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InsightsCompanion.insert({
    required String id,
    required String profileId,
    required String period,
    required String body,
    required String createdAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       profileId = Value(profileId),
       period = Value(period),
       body = Value(body),
       createdAt = Value(createdAt);
  static Insertable<Insight> custom({
    Expression<String>? id,
    Expression<String>? profileId,
    Expression<String>? period,
    Expression<String>? body,
    Expression<String>? createdAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (period != null) 'period': period,
      if (body != null) 'body': body,
      if (createdAt != null) 'created_at': createdAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InsightsCompanion copyWith({
    Value<String>? id,
    Value<String>? profileId,
    Value<String>? period,
    Value<String>? body,
    Value<String>? createdAt,
    Value<String>? syncStatus,
    Value<int>? rowid,
  }) {
    return InsightsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      period: period ?? this.period,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<String>(profileId.value);
    }
    if (period.present) {
      map['period'] = Variable<String>(period.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InsightsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('period: $period, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppLogsTable extends AppLogs with TableInfo<$AppLogsTable, AppLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, level, message, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_log';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}level'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AppLogsTable createAlias(String alias) {
    return $AppLogsTable(attachedDatabase, alias);
  }
}

class AppLog extends DataClass implements Insertable<AppLog> {
  final String id;
  final String level;
  final String message;
  final String createdAt;
  const AppLog({
    required this.id,
    required this.level,
    required this.message,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['level'] = Variable<String>(level);
    map['message'] = Variable<String>(message);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  AppLogsCompanion toCompanion(bool nullToAbsent) {
    return AppLogsCompanion(
      id: Value(id),
      level: Value(level),
      message: Value(message),
      createdAt: Value(createdAt),
    );
  }

  factory AppLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppLog(
      id: serializer.fromJson<String>(json['id']),
      level: serializer.fromJson<String>(json['level']),
      message: serializer.fromJson<String>(json['message']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'level': serializer.toJson<String>(level),
      'message': serializer.toJson<String>(message),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  AppLog copyWith({
    String? id,
    String? level,
    String? message,
    String? createdAt,
  }) => AppLog(
    id: id ?? this.id,
    level: level ?? this.level,
    message: message ?? this.message,
    createdAt: createdAt ?? this.createdAt,
  );
  AppLog copyWithCompanion(AppLogsCompanion data) {
    return AppLog(
      id: data.id.present ? data.id.value : this.id,
      level: data.level.present ? data.level.value : this.level,
      message: data.message.present ? data.message.value : this.message,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppLog(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, level, message, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLog &&
          other.id == this.id &&
          other.level == this.level &&
          other.message == this.message &&
          other.createdAt == this.createdAt);
}

class AppLogsCompanion extends UpdateCompanion<AppLog> {
  final Value<String> id;
  final Value<String> level;
  final Value<String> message;
  final Value<String> createdAt;
  final Value<int> rowid;
  const AppLogsCompanion({
    this.id = const Value.absent(),
    this.level = const Value.absent(),
    this.message = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppLogsCompanion.insert({
    required String id,
    required String level,
    required String message,
    required String createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       level = Value(level),
       message = Value(message),
       createdAt = Value(createdAt);
  static Insertable<AppLog> custom({
    Expression<String>? id,
    Expression<String>? level,
    Expression<String>? message,
    Expression<String>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (level != null) 'level': level,
      if (message != null) 'message': message,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? level,
    Value<String>? message,
    Value<String>? createdAt,
    Value<int>? rowid,
  }) {
    return AppLogsCompanion(
      id: id ?? this.id,
      level: level ?? this.level,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppLogsCompanion(')
          ..write('id: $id, ')
          ..write('level: $level, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $IntentionsTable intentions = $IntentionsTable(this);
  late final $ReflectionsTable reflections = $ReflectionsTable(this);
  late final $KeyLearningsTable keyLearnings = $KeyLearningsTable(this);
  late final $UsageCountersTable usageCounters = $UsageCountersTable(this);
  late final $LearningTagCountsTable learningTagCounts =
      $LearningTagCountsTable(this);
  late final $InsightsTable insights = $InsightsTable(this);
  late final $AppLogsTable appLogs = $AppLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    profiles,
    intentions,
    reflections,
    keyLearnings,
    usageCounters,
    learningTagCounts,
    insights,
    appLogs,
  ];
}

typedef $$ProfilesTableCreateCompanionBuilder =
    ProfilesCompanion Function({
      required String id,
      required String name,
      Value<String?> email,
      Value<String?> birthday,
      required String memberSince,
      Value<String> theme,
      Value<String?> pinHash,
      Value<String> syncStatus,
      required String createdAt,
      required String updatedAt,
      Value<int> rowid,
    });
typedef $$ProfilesTableUpdateCompanionBuilder =
    ProfilesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> email,
      Value<String?> birthday,
      Value<String> memberSince,
      Value<String> theme,
      Value<String?> pinHash,
      Value<String> syncStatus,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<int> rowid,
    });

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get memberSince => $composableBuilder(
    column: $table.memberSince,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get theme => $composableBuilder(
    column: $table.theme,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pinHash => $composableBuilder(
    column: $table.pinHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get memberSince => $composableBuilder(
    column: $table.memberSince,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get theme => $composableBuilder(
    column: $table.theme,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pinHash => $composableBuilder(
    column: $table.pinHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
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

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get birthday =>
      $composableBuilder(column: $table.birthday, builder: (column) => column);

  GeneratedColumn<String> get memberSince => $composableBuilder(
    column: $table.memberSince,
    builder: (column) => column,
  );

  GeneratedColumn<String> get theme =>
      $composableBuilder(column: $table.theme, builder: (column) => column);

  GeneratedColumn<String> get pinHash =>
      $composableBuilder(column: $table.pinHash, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          Profile,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
          Profile,
          PrefetchHooks Function()
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> birthday = const Value.absent(),
                Value<String> memberSince = const Value.absent(),
                Value<String> theme = const Value.absent(),
                Value<String?> pinHash = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                name: name,
                email: email,
                birthday: birthday,
                memberSince: memberSince,
                theme: theme,
                pinHash: pinHash,
                syncStatus: syncStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> email = const Value.absent(),
                Value<String?> birthday = const Value.absent(),
                required String memberSince,
                Value<String> theme = const Value.absent(),
                Value<String?> pinHash = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                required String createdAt,
                required String updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ProfilesCompanion.insert(
                id: id,
                name: name,
                email: email,
                birthday: birthday,
                memberSince: memberSince,
                theme: theme,
                pinHash: pinHash,
                syncStatus: syncStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      Profile,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (Profile, BaseReferences<_$AppDatabase, $ProfilesTable, Profile>),
      Profile,
      PrefetchHooks Function()
    >;
typedef $$IntentionsTableCreateCompanionBuilder =
    IntentionsCompanion Function({
      required String id,
      required String profileId,
      required String forDate,
      required String body,
      required int position,
      Value<int> isCompleted,
      Value<String?> completedAt,
      Value<String> syncStatus,
      required String createdAt,
      required String updatedAt,
      Value<int> rowid,
    });
typedef $$IntentionsTableUpdateCompanionBuilder =
    IntentionsCompanion Function({
      Value<String> id,
      Value<String> profileId,
      Value<String> forDate,
      Value<String> body,
      Value<int> position,
      Value<int> isCompleted,
      Value<String?> completedAt,
      Value<String> syncStatus,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<int> rowid,
    });

class $$IntentionsTableFilterComposer
    extends Composer<_$AppDatabase, $IntentionsTable> {
  $$IntentionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get forDate => $composableBuilder(
    column: $table.forDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$IntentionsTableOrderingComposer
    extends Composer<_$AppDatabase, $IntentionsTable> {
  $$IntentionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get forDate => $composableBuilder(
    column: $table.forDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IntentionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $IntentionsTable> {
  $$IntentionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get forDate =>
      $composableBuilder(column: $table.forDate, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<int> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$IntentionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IntentionsTable,
          Intention,
          $$IntentionsTableFilterComposer,
          $$IntentionsTableOrderingComposer,
          $$IntentionsTableAnnotationComposer,
          $$IntentionsTableCreateCompanionBuilder,
          $$IntentionsTableUpdateCompanionBuilder,
          (
            Intention,
            BaseReferences<_$AppDatabase, $IntentionsTable, Intention>,
          ),
          Intention,
          PrefetchHooks Function()
        > {
  $$IntentionsTableTableManager(_$AppDatabase db, $IntentionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IntentionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IntentionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IntentionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> profileId = const Value.absent(),
                Value<String> forDate = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int> isCompleted = const Value.absent(),
                Value<String?> completedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IntentionsCompanion(
                id: id,
                profileId: profileId,
                forDate: forDate,
                body: body,
                position: position,
                isCompleted: isCompleted,
                completedAt: completedAt,
                syncStatus: syncStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String profileId,
                required String forDate,
                required String body,
                required int position,
                Value<int> isCompleted = const Value.absent(),
                Value<String?> completedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                required String createdAt,
                required String updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => IntentionsCompanion.insert(
                id: id,
                profileId: profileId,
                forDate: forDate,
                body: body,
                position: position,
                isCompleted: isCompleted,
                completedAt: completedAt,
                syncStatus: syncStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$IntentionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IntentionsTable,
      Intention,
      $$IntentionsTableFilterComposer,
      $$IntentionsTableOrderingComposer,
      $$IntentionsTableAnnotationComposer,
      $$IntentionsTableCreateCompanionBuilder,
      $$IntentionsTableUpdateCompanionBuilder,
      (Intention, BaseReferences<_$AppDatabase, $IntentionsTable, Intention>),
      Intention,
      PrefetchHooks Function()
    >;
typedef $$ReflectionsTableCreateCompanionBuilder =
    ReflectionsCompanion Function({
      required String id,
      required String profileId,
      required String forDate,
      Value<String?> title,
      required String learning,
      required String wins,
      required int gratitudeScore,
      Value<String?> photoPath,
      Value<String> syncStatus,
      required String createdAt,
      required String updatedAt,
      Value<int> rowid,
    });
typedef $$ReflectionsTableUpdateCompanionBuilder =
    ReflectionsCompanion Function({
      Value<String> id,
      Value<String> profileId,
      Value<String> forDate,
      Value<String?> title,
      Value<String> learning,
      Value<String> wins,
      Value<int> gratitudeScore,
      Value<String?> photoPath,
      Value<String> syncStatus,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<int> rowid,
    });

class $$ReflectionsTableFilterComposer
    extends Composer<_$AppDatabase, $ReflectionsTable> {
  $$ReflectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get forDate => $composableBuilder(
    column: $table.forDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get learning => $composableBuilder(
    column: $table.learning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wins => $composableBuilder(
    column: $table.wins,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get gratitudeScore => $composableBuilder(
    column: $table.gratitudeScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReflectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReflectionsTable> {
  $$ReflectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get forDate => $composableBuilder(
    column: $table.forDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get learning => $composableBuilder(
    column: $table.learning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wins => $composableBuilder(
    column: $table.wins,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get gratitudeScore => $composableBuilder(
    column: $table.gratitudeScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReflectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReflectionsTable> {
  $$ReflectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get forDate =>
      $composableBuilder(column: $table.forDate, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get learning =>
      $composableBuilder(column: $table.learning, builder: (column) => column);

  GeneratedColumn<String> get wins =>
      $composableBuilder(column: $table.wins, builder: (column) => column);

  GeneratedColumn<int> get gratitudeScore => $composableBuilder(
    column: $table.gratitudeScore,
    builder: (column) => column,
  );

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ReflectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReflectionsTable,
          Reflection,
          $$ReflectionsTableFilterComposer,
          $$ReflectionsTableOrderingComposer,
          $$ReflectionsTableAnnotationComposer,
          $$ReflectionsTableCreateCompanionBuilder,
          $$ReflectionsTableUpdateCompanionBuilder,
          (
            Reflection,
            BaseReferences<_$AppDatabase, $ReflectionsTable, Reflection>,
          ),
          Reflection,
          PrefetchHooks Function()
        > {
  $$ReflectionsTableTableManager(_$AppDatabase db, $ReflectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReflectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReflectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReflectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> profileId = const Value.absent(),
                Value<String> forDate = const Value.absent(),
                Value<String?> title = const Value.absent(),
                Value<String> learning = const Value.absent(),
                Value<String> wins = const Value.absent(),
                Value<int> gratitudeScore = const Value.absent(),
                Value<String?> photoPath = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReflectionsCompanion(
                id: id,
                profileId: profileId,
                forDate: forDate,
                title: title,
                learning: learning,
                wins: wins,
                gratitudeScore: gratitudeScore,
                photoPath: photoPath,
                syncStatus: syncStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String profileId,
                required String forDate,
                Value<String?> title = const Value.absent(),
                required String learning,
                required String wins,
                required int gratitudeScore,
                Value<String?> photoPath = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                required String createdAt,
                required String updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ReflectionsCompanion.insert(
                id: id,
                profileId: profileId,
                forDate: forDate,
                title: title,
                learning: learning,
                wins: wins,
                gratitudeScore: gratitudeScore,
                photoPath: photoPath,
                syncStatus: syncStatus,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReflectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReflectionsTable,
      Reflection,
      $$ReflectionsTableFilterComposer,
      $$ReflectionsTableOrderingComposer,
      $$ReflectionsTableAnnotationComposer,
      $$ReflectionsTableCreateCompanionBuilder,
      $$ReflectionsTableUpdateCompanionBuilder,
      (
        Reflection,
        BaseReferences<_$AppDatabase, $ReflectionsTable, Reflection>,
      ),
      Reflection,
      PrefetchHooks Function()
    >;
typedef $$KeyLearningsTableCreateCompanionBuilder =
    KeyLearningsCompanion Function({
      required String id,
      required String reflectionId,
      required String label,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$KeyLearningsTableUpdateCompanionBuilder =
    KeyLearningsCompanion Function({
      Value<String> id,
      Value<String> reflectionId,
      Value<String> label,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$KeyLearningsTableFilterComposer
    extends Composer<_$AppDatabase, $KeyLearningsTable> {
  $$KeyLearningsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reflectionId => $composableBuilder(
    column: $table.reflectionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KeyLearningsTableOrderingComposer
    extends Composer<_$AppDatabase, $KeyLearningsTable> {
  $$KeyLearningsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reflectionId => $composableBuilder(
    column: $table.reflectionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KeyLearningsTableAnnotationComposer
    extends Composer<_$AppDatabase, $KeyLearningsTable> {
  $$KeyLearningsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get reflectionId => $composableBuilder(
    column: $table.reflectionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$KeyLearningsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $KeyLearningsTable,
          KeyLearning,
          $$KeyLearningsTableFilterComposer,
          $$KeyLearningsTableOrderingComposer,
          $$KeyLearningsTableAnnotationComposer,
          $$KeyLearningsTableCreateCompanionBuilder,
          $$KeyLearningsTableUpdateCompanionBuilder,
          (
            KeyLearning,
            BaseReferences<_$AppDatabase, $KeyLearningsTable, KeyLearning>,
          ),
          KeyLearning,
          PrefetchHooks Function()
        > {
  $$KeyLearningsTableTableManager(_$AppDatabase db, $KeyLearningsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KeyLearningsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KeyLearningsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KeyLearningsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> reflectionId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KeyLearningsCompanion(
                id: id,
                reflectionId: reflectionId,
                label: label,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String reflectionId,
                required String label,
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KeyLearningsCompanion.insert(
                id: id,
                reflectionId: reflectionId,
                label: label,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KeyLearningsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $KeyLearningsTable,
      KeyLearning,
      $$KeyLearningsTableFilterComposer,
      $$KeyLearningsTableOrderingComposer,
      $$KeyLearningsTableAnnotationComposer,
      $$KeyLearningsTableCreateCompanionBuilder,
      $$KeyLearningsTableUpdateCompanionBuilder,
      (
        KeyLearning,
        BaseReferences<_$AppDatabase, $KeyLearningsTable, KeyLearning>,
      ),
      KeyLearning,
      PrefetchHooks Function()
    >;
typedef $$UsageCountersTableCreateCompanionBuilder =
    UsageCountersCompanion Function({
      required String profileId,
      Value<int> totalReflections,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<int> intentionsSetCount,
      Value<int> intentionsCompletedCount,
      Value<int> daysCompleted,
      Value<int> appOpenCount,
      required String lastActiveDate,
      required String updatedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$UsageCountersTableUpdateCompanionBuilder =
    UsageCountersCompanion Function({
      Value<String> profileId,
      Value<int> totalReflections,
      Value<int> currentStreak,
      Value<int> longestStreak,
      Value<int> intentionsSetCount,
      Value<int> intentionsCompletedCount,
      Value<int> daysCompleted,
      Value<int> appOpenCount,
      Value<String> lastActiveDate,
      Value<String> updatedAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$UsageCountersTableFilterComposer
    extends Composer<_$AppDatabase, $UsageCountersTable> {
  $$UsageCountersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalReflections => $composableBuilder(
    column: $table.totalReflections,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intentionsSetCount => $composableBuilder(
    column: $table.intentionsSetCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intentionsCompletedCount => $composableBuilder(
    column: $table.intentionsCompletedCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get daysCompleted => $composableBuilder(
    column: $table.daysCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get appOpenCount => $composableBuilder(
    column: $table.appOpenCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastActiveDate => $composableBuilder(
    column: $table.lastActiveDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UsageCountersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsageCountersTable> {
  $$UsageCountersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalReflections => $composableBuilder(
    column: $table.totalReflections,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intentionsSetCount => $composableBuilder(
    column: $table.intentionsSetCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intentionsCompletedCount => $composableBuilder(
    column: $table.intentionsCompletedCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get daysCompleted => $composableBuilder(
    column: $table.daysCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get appOpenCount => $composableBuilder(
    column: $table.appOpenCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastActiveDate => $composableBuilder(
    column: $table.lastActiveDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsageCountersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsageCountersTable> {
  $$UsageCountersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<int> get totalReflections => $composableBuilder(
    column: $table.totalReflections,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentStreak => $composableBuilder(
    column: $table.currentStreak,
    builder: (column) => column,
  );

  GeneratedColumn<int> get longestStreak => $composableBuilder(
    column: $table.longestStreak,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intentionsSetCount => $composableBuilder(
    column: $table.intentionsSetCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intentionsCompletedCount => $composableBuilder(
    column: $table.intentionsCompletedCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get daysCompleted => $composableBuilder(
    column: $table.daysCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get appOpenCount => $composableBuilder(
    column: $table.appOpenCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastActiveDate => $composableBuilder(
    column: $table.lastActiveDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$UsageCountersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsageCountersTable,
          UsageCounter,
          $$UsageCountersTableFilterComposer,
          $$UsageCountersTableOrderingComposer,
          $$UsageCountersTableAnnotationComposer,
          $$UsageCountersTableCreateCompanionBuilder,
          $$UsageCountersTableUpdateCompanionBuilder,
          (
            UsageCounter,
            BaseReferences<_$AppDatabase, $UsageCountersTable, UsageCounter>,
          ),
          UsageCounter,
          PrefetchHooks Function()
        > {
  $$UsageCountersTableTableManager(_$AppDatabase db, $UsageCountersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsageCountersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsageCountersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsageCountersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> profileId = const Value.absent(),
                Value<int> totalReflections = const Value.absent(),
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<int> intentionsSetCount = const Value.absent(),
                Value<int> intentionsCompletedCount = const Value.absent(),
                Value<int> daysCompleted = const Value.absent(),
                Value<int> appOpenCount = const Value.absent(),
                Value<String> lastActiveDate = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsageCountersCompanion(
                profileId: profileId,
                totalReflections: totalReflections,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                intentionsSetCount: intentionsSetCount,
                intentionsCompletedCount: intentionsCompletedCount,
                daysCompleted: daysCompleted,
                appOpenCount: appOpenCount,
                lastActiveDate: lastActiveDate,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String profileId,
                Value<int> totalReflections = const Value.absent(),
                Value<int> currentStreak = const Value.absent(),
                Value<int> longestStreak = const Value.absent(),
                Value<int> intentionsSetCount = const Value.absent(),
                Value<int> intentionsCompletedCount = const Value.absent(),
                Value<int> daysCompleted = const Value.absent(),
                Value<int> appOpenCount = const Value.absent(),
                required String lastActiveDate,
                required String updatedAt,
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsageCountersCompanion.insert(
                profileId: profileId,
                totalReflections: totalReflections,
                currentStreak: currentStreak,
                longestStreak: longestStreak,
                intentionsSetCount: intentionsSetCount,
                intentionsCompletedCount: intentionsCompletedCount,
                daysCompleted: daysCompleted,
                appOpenCount: appOpenCount,
                lastActiveDate: lastActiveDate,
                updatedAt: updatedAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UsageCountersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsageCountersTable,
      UsageCounter,
      $$UsageCountersTableFilterComposer,
      $$UsageCountersTableOrderingComposer,
      $$UsageCountersTableAnnotationComposer,
      $$UsageCountersTableCreateCompanionBuilder,
      $$UsageCountersTableUpdateCompanionBuilder,
      (
        UsageCounter,
        BaseReferences<_$AppDatabase, $UsageCountersTable, UsageCounter>,
      ),
      UsageCounter,
      PrefetchHooks Function()
    >;
typedef $$LearningTagCountsTableCreateCompanionBuilder =
    LearningTagCountsCompanion Function({
      required String profileId,
      required String label,
      Value<int> count,
      Value<int> rowid,
    });
typedef $$LearningTagCountsTableUpdateCompanionBuilder =
    LearningTagCountsCompanion Function({
      Value<String> profileId,
      Value<String> label,
      Value<int> count,
      Value<int> rowid,
    });

class $$LearningTagCountsTableFilterComposer
    extends Composer<_$AppDatabase, $LearningTagCountsTable> {
  $$LearningTagCountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LearningTagCountsTableOrderingComposer
    extends Composer<_$AppDatabase, $LearningTagCountsTable> {
  $$LearningTagCountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LearningTagCountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LearningTagCountsTable> {
  $$LearningTagCountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);
}

class $$LearningTagCountsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LearningTagCountsTable,
          LearningTagCount,
          $$LearningTagCountsTableFilterComposer,
          $$LearningTagCountsTableOrderingComposer,
          $$LearningTagCountsTableAnnotationComposer,
          $$LearningTagCountsTableCreateCompanionBuilder,
          $$LearningTagCountsTableUpdateCompanionBuilder,
          (
            LearningTagCount,
            BaseReferences<
              _$AppDatabase,
              $LearningTagCountsTable,
              LearningTagCount
            >,
          ),
          LearningTagCount,
          PrefetchHooks Function()
        > {
  $$LearningTagCountsTableTableManager(
    _$AppDatabase db,
    $LearningTagCountsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningTagCountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningTagCountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningTagCountsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> profileId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LearningTagCountsCompanion(
                profileId: profileId,
                label: label,
                count: count,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String profileId,
                required String label,
                Value<int> count = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LearningTagCountsCompanion.insert(
                profileId: profileId,
                label: label,
                count: count,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LearningTagCountsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LearningTagCountsTable,
      LearningTagCount,
      $$LearningTagCountsTableFilterComposer,
      $$LearningTagCountsTableOrderingComposer,
      $$LearningTagCountsTableAnnotationComposer,
      $$LearningTagCountsTableCreateCompanionBuilder,
      $$LearningTagCountsTableUpdateCompanionBuilder,
      (
        LearningTagCount,
        BaseReferences<
          _$AppDatabase,
          $LearningTagCountsTable,
          LearningTagCount
        >,
      ),
      LearningTagCount,
      PrefetchHooks Function()
    >;
typedef $$InsightsTableCreateCompanionBuilder =
    InsightsCompanion Function({
      required String id,
      required String profileId,
      required String period,
      required String body,
      required String createdAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });
typedef $$InsightsTableUpdateCompanionBuilder =
    InsightsCompanion Function({
      Value<String> id,
      Value<String> profileId,
      Value<String> period,
      Value<String> body,
      Value<String> createdAt,
      Value<String> syncStatus,
      Value<int> rowid,
    });

class $$InsightsTableFilterComposer
    extends Composer<_$AppDatabase, $InsightsTable> {
  $$InsightsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InsightsTableOrderingComposer
    extends Composer<_$AppDatabase, $InsightsTable> {
  $$InsightsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileId => $composableBuilder(
    column: $table.profileId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InsightsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InsightsTable> {
  $$InsightsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get profileId =>
      $composableBuilder(column: $table.profileId, builder: (column) => column);

  GeneratedColumn<String> get period =>
      $composableBuilder(column: $table.period, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );
}

class $$InsightsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InsightsTable,
          Insight,
          $$InsightsTableFilterComposer,
          $$InsightsTableOrderingComposer,
          $$InsightsTableAnnotationComposer,
          $$InsightsTableCreateCompanionBuilder,
          $$InsightsTableUpdateCompanionBuilder,
          (Insight, BaseReferences<_$AppDatabase, $InsightsTable, Insight>),
          Insight,
          PrefetchHooks Function()
        > {
  $$InsightsTableTableManager(_$AppDatabase db, $InsightsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InsightsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InsightsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InsightsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> profileId = const Value.absent(),
                Value<String> period = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InsightsCompanion(
                id: id,
                profileId: profileId,
                period: period,
                body: body,
                createdAt: createdAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String profileId,
                required String period,
                required String body,
                required String createdAt,
                Value<String> syncStatus = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InsightsCompanion.insert(
                id: id,
                profileId: profileId,
                period: period,
                body: body,
                createdAt: createdAt,
                syncStatus: syncStatus,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InsightsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InsightsTable,
      Insight,
      $$InsightsTableFilterComposer,
      $$InsightsTableOrderingComposer,
      $$InsightsTableAnnotationComposer,
      $$InsightsTableCreateCompanionBuilder,
      $$InsightsTableUpdateCompanionBuilder,
      (Insight, BaseReferences<_$AppDatabase, $InsightsTable, Insight>),
      Insight,
      PrefetchHooks Function()
    >;
typedef $$AppLogsTableCreateCompanionBuilder =
    AppLogsCompanion Function({
      required String id,
      required String level,
      required String message,
      required String createdAt,
      Value<int> rowid,
    });
typedef $$AppLogsTableUpdateCompanionBuilder =
    AppLogsCompanion Function({
      Value<String> id,
      Value<String> level,
      Value<String> message,
      Value<String> createdAt,
      Value<int> rowid,
    });

class $$AppLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AppLogsTable> {
  $$AppLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppLogsTable> {
  $$AppLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppLogsTable> {
  $$AppLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AppLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppLogsTable,
          AppLog,
          $$AppLogsTableFilterComposer,
          $$AppLogsTableOrderingComposer,
          $$AppLogsTableAnnotationComposer,
          $$AppLogsTableCreateCompanionBuilder,
          $$AppLogsTableUpdateCompanionBuilder,
          (AppLog, BaseReferences<_$AppDatabase, $AppLogsTable, AppLog>),
          AppLog,
          PrefetchHooks Function()
        > {
  $$AppLogsTableTableManager(_$AppDatabase db, $AppLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> level = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppLogsCompanion(
                id: id,
                level: level,
                message: message,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String level,
                required String message,
                required String createdAt,
                Value<int> rowid = const Value.absent(),
              }) => AppLogsCompanion.insert(
                id: id,
                level: level,
                message: message,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppLogsTable,
      AppLog,
      $$AppLogsTableFilterComposer,
      $$AppLogsTableOrderingComposer,
      $$AppLogsTableAnnotationComposer,
      $$AppLogsTableCreateCompanionBuilder,
      $$AppLogsTableUpdateCompanionBuilder,
      (AppLog, BaseReferences<_$AppDatabase, $AppLogsTable, AppLog>),
      AppLog,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$IntentionsTableTableManager get intentions =>
      $$IntentionsTableTableManager(_db, _db.intentions);
  $$ReflectionsTableTableManager get reflections =>
      $$ReflectionsTableTableManager(_db, _db.reflections);
  $$KeyLearningsTableTableManager get keyLearnings =>
      $$KeyLearningsTableTableManager(_db, _db.keyLearnings);
  $$UsageCountersTableTableManager get usageCounters =>
      $$UsageCountersTableTableManager(_db, _db.usageCounters);
  $$LearningTagCountsTableTableManager get learningTagCounts =>
      $$LearningTagCountsTableTableManager(_db, _db.learningTagCounts);
  $$InsightsTableTableManager get insights =>
      $$InsightsTableTableManager(_db, _db.insights);
  $$AppLogsTableTableManager get appLogs =>
      $$AppLogsTableTableManager(_db, _db.appLogs);
}
