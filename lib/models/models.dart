class ProfileModel {
  const ProfileModel({
    required this.id,
    required this.name,
    required this.memberSince,
    required this.theme,
    required this.syncStatus,
    required this.createdAt,
    required this.updatedAt,
    this.email,
    this.birthday,
    this.pinHash,
  });

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

  bool get isDark => theme == 'muted_dark';
  bool get hasPin => pinHash != null && pinHash!.isNotEmpty;

  ProfileModel copyWith({
    String? name,
    String? email,
    String? birthday,
    String? memberSince,
    String? theme,
    String? pinHash,
    String? updatedAt,
    bool clearPin = false,
  }) {
    return ProfileModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      birthday: birthday ?? this.birthday,
      memberSince: memberSince ?? this.memberSince,
      theme: theme ?? this.theme,
      pinHash: clearPin ? null : (pinHash ?? this.pinHash),
      syncStatus: 'notSynced',
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class IntentionModel {
  const IntentionModel({
    required this.id,
    required this.profileId,
    required this.forDate,
    required this.text,
    required this.position,
    required this.isCompleted,
    required this.syncStatus,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
  });

  final String id;
  final String profileId;
  final String forDate;
  final String text;
  final int position;
  final bool isCompleted;
  final String? completedAt;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
}

class ReflectionModel {
  const ReflectionModel({
    required this.id,
    required this.profileId,
    required this.forDate,
    required this.learning,
    required this.wins,
    required this.gratitudeScore,
    required this.syncStatus,
    required this.createdAt,
    required this.updatedAt,
    this.title,
    this.photoPath,
    this.tags = const [],
  });

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
  final List<String> tags;
}

class UsageCounterModel {
  const UsageCounterModel({
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

  static UsageCounterModel empty(String profileId, String today) {
    return UsageCounterModel(
      profileId: profileId,
      totalReflections: 0,
      currentStreak: 0,
      longestStreak: 0,
      intentionsSetCount: 0,
      intentionsCompletedCount: 0,
      daysCompleted: 0,
      appOpenCount: 0,
      lastActiveDate: today,
      updatedAt: today,
      syncStatus: 'notSynced',
    );
  }
}

class InsightModel {
  const InsightModel({
    required this.id,
    required this.profileId,
    required this.period,
    required this.body,
    required this.createdAt,
    required this.syncStatus,
  });

  final String id;
  final String profileId;
  final String period;
  final String body;
  final String createdAt;
  final String syncStatus;
}

class ChartBucket {
  const ChartBucket({required this.label, required this.count});

  final String label;
  final int count;
}
