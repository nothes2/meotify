class TrackInfo {
  final double? duration;
  final String? url;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? uploaderId;
  final String? title;
  final String? artist;
  final String? coverUrl;
  final String? genre;
  String? id;

  TrackInfo(
      {this.duration,
      this.url,
      this.createdAt,
      this.updatedAt,
      this.uploaderId,
      this.title,
      this.artist,
      this.coverUrl,
      this.genre,
      this.id});

  factory TrackInfo.fromJson(Map<String, dynamic> json) {
    return TrackInfo(
      duration: (json['duration'] as num?)?.toDouble(),
      url: json['url'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'] as String)
          : null,
      uploaderId: json['uploader_id'] as String?,
      title: json['title'] as String?,
      artist: json['artist'] as String?,
      coverUrl: json['coverUrl'] as String?,
      genre: json['genre'] as String?,
      id: json["_id"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
      'url': url,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'uploader_id': uploaderId,
      'title': title,
      'artist': artist,
      'coverUrl': coverUrl,
      'genre': genre,
      '_id': id
    };
  }

  TrackInfo copyWith({
    double? duration,
    String? url,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? uploaderId,
    String? title,
    String? artist,
    String? coverUrl,
    String? genre,
  }) {
    return TrackInfo(
        duration: duration ?? this.duration,
        url: url ?? this.url,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        uploaderId: uploaderId ?? this.uploaderId,
        title: title ?? this.title,
        artist: artist ?? this.artist,
        coverUrl: coverUrl ?? this.coverUrl,
        genre: genre ?? this.genre,
        id: id ?? id);
  }
}
