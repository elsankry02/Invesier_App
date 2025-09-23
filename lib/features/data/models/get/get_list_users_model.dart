class Datum {
  final int id;
  final String? name;
  final String? username;
  final String? email;
  final String? avatar;
  final bool isVerified;
  final int? followersCount;
  final int? followingCount;
  final int? postsCount;

  Datum({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.avatar,
    required this.isVerified,
    required this.followersCount,
    required this.followingCount,
    required this.postsCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    avatar: json["avatar"],
    isVerified: json["is_verified"],
    followersCount: json["followers_count"],
    followingCount: json["following_count"],
    postsCount: json["posts_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "avatar": avatar,
    "is_verified": isVerified,
    "followers_count": followersCount,
    "following_count": followingCount,
    "posts_count": postsCount,
  };
}
