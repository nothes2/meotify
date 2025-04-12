class History {
  String id;
  String userId;
  String songId;
  DateTime timestamp;
  int? duration;

  History({
    this.id = '',
    this.userId = '',
    this.songId = '',
    DateTime? timestamp,
    this.duration,
  }) : timestamp = timestamp ?? DateTime.now();

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['_id'] ?? '',
      userId: json['metadata']?['userId'] ?? '',
      songId: json['metadata']?['songId'] ?? '',
      timestamp: DateTime.parse(json['timestamp']),
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'timestamp': timestamp.toIso8601String(),
      'duration': duration,
      'metadata': {'userId': userId, 'songId': songId},
    };
  }
}
