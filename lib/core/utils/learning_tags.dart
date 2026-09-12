class LearningTags {
  static const catalog = <String>[
    'Mindfulness',
    'Focus',
    'Rest',
    'Discipline',
    'Gratitude',
    'Movement',
    'Presence',
  ];

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
