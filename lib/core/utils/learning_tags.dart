class LearningTags {
  static const maxLabelLength = 24;

  static const catalog = <String>[
    'Mindfulness',
    'Focus',
    'Rest',
    'Discipline',
    'Gratitude',
    'Movement',
    'Presence',
  ];

  static const _byLower = <String, String>{
    'mindfulness': 'Mindfulness',
    'focus': 'Focus',
    'rest': 'Rest',
    'discipline': 'Discipline',
    'gratitude': 'Gratitude',
    'movement': 'Movement',
    'presence': 'Presence',
  };

  static String? normalize(String raw) {
    final collapsed = raw.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (collapsed.isEmpty || collapsed.length > maxLabelLength) {
      return null;
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(collapsed)) {
      return null;
    }
    final catalogMatch = _byLower[collapsed.toLowerCase()];
    if (catalogMatch != null) {
      return catalogMatch;
    }
    final words = collapsed.split(' ');
    return [
      for (final word in words)
        word.isEmpty
            ? word
            : '${word[0].toUpperCase()}${word.substring(1)}',
    ].join(' ');
  }

  static List<String> sanitize(Iterable<String> chosen) {
    final unique = <String>[];
    final seen = <String>{};
    for (final raw in chosen) {
      final match = normalize(raw);
      if (match != null && seen.add(match)) {
        unique.add(match);
      }
    }
    return unique;
  }

  static List<String> pickerOrder({
    Iterable<String> previouslyUsed = const [],
  }) {
    final used = sanitize(previouslyUsed);
    final seen = used.toSet();
    return [
      ...used,
      ...catalog.where((label) => !seen.contains(label)),
    ];
  }

  static List<String> resolve({
    required String learning,
    required String wins,
    List<String>? chosen,
  }) {
    if (chosen != null) {
      return sanitize(chosen);
    }
    return infer(learning, wins);
  }

  static List<String> infer(String learning, String wins) {
    final blob = '${learning.toLowerCase()} ${wins.toLowerCase()}';
    final found = <String>{};
    if (_has(blob, ['breath', 'meditat', 'mindful', 'still'])) {
      found.add('Mindfulness');
    }
    if (_has(blob, ['focus', 'work', 'project', 'draft', 'deep'])) {
      found.add('Focus');
    }
    if (_has(blob, ['rest', 'sleep', 'walk', 'pause', 'calm'])) {
      found.add('Rest');
    }
    if (_has(blob, ['habit', 'consist', 'disciplin', 'show up'])) {
      found.add('Discipline');
    }
    if (_has(blob, ['grateful', 'thank', 'proud', 'win'])) {
      found.add('Gratitude');
    }
    if (_has(blob, ['walk', 'run', 'stretch', 'body', 'move'])) {
      found.add('Movement');
    }
    if (found.isEmpty && learning.trim().isNotEmpty) {
      found.add('Presence');
    }
    return found.toList();
  }

  static bool _has(String blob, List<String> keys) =>
      keys.any(blob.contains);
}
