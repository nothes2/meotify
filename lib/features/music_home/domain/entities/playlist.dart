class Library {
  final String? id;
  final Playlist? playlist;

  Library({
    this.id,
    this.playlist,
  });

  factory Library.fromJson(Map<String, dynamic> json) {
    return Library(
      id: json['_id'] is Map ? json['_id']['id'] : json['_id'],
      playlist: Playlist.fromJson(json['playlist']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': {'\$oid': id},
      'playlist': playlist?.toJson(),
    };
  }
}

class Playlist {
  final String name;
  final String? image;
  final bool canBeRemoved;
  final String type;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userId;
  final List<dynamic> songs;
  final List<dynamic> subfolders;
  final String? description;
  final String? id;

  Playlist({
    required this.name,
    this.image,
    required this.canBeRemoved,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.songs,
    required this.subfolders,
    this.description,
    this.id,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      name: json['name'],
      image: json['image'],
      canBeRemoved: json['can_be_removed'],
      type: json['type'],
      createdAt: json['created_at'] is Map
          ? DateTime.parse(json['created_at']['\$date'])
          : DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] is Map
          ? DateTime.parse(json['updated_at']['\$date'])
          : DateTime.parse(json['updated_at']),
      userId:
          json['user_id'] is Map ? json['user_id']['\$oid'] : json['user_id'],
      songs: List<dynamic>.from(json['songs']),
      subfolders: List<dynamic>.from(json['subfolders']),
      description: json['description'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'can_be_removed': canBeRemoved,
      'type': type,
      'created_at': {'\$date': createdAt.toIso8601String()},
      'updated_at': {'\$date': updatedAt.toIso8601String()},
      'user_id': {'\$oid': userId},
      'songs': songs,
      'subfolders': subfolders,
      'description': description,
      '_id': id,
    };
  }
}
