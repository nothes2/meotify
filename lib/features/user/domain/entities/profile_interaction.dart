class ProfileInteraction {
  int? followers;
  int? following;
  int? listeners;

  ProfileInteraction({
    this.followers,
    this.following,
    this.listeners,
  });

  /// Empty constructor with default values
  factory ProfileInteraction.empty() => ProfileInteraction(
        followers: 0,
        following: 0,
        listeners: 0,
      );

  /// From JSON
  factory ProfileInteraction.fromJson(Map<String, dynamic> json) {
    return ProfileInteraction(
      followers: json['followers'],
      following: json['following'],
      listeners: json['listeners'],
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() {
    return {
      'followers': followers,
      'following': following,
      'listeners': listeners,
    };
  }
}
