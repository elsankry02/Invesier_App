class LoginModel {
  final String token;
  final User user;
  final bool registrationComplete;

  LoginModel({
    required this.token,
    required this.user,
    required this.registrationComplete,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"],
    user: User.fromJson(json["user"]),
    registrationComplete: json["registration_complete"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
    "registration_complete": registrationComplete,
  };
}

class User {
  final int id;
  final dynamic username;
  final dynamic name;
  final String avatarUrl;
  final dynamic phone;
  final String email;
  final dynamic inveesBalance;
  final String hostStatus;
  final bool isLive;
  final int fansCount;
  final int postsCount;
  final int pioneersCount;
  final bool isCompleteProfile;
  final bool isVerified;
  final bool isExpert;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String socialRelation;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.avatarUrl,
    required this.phone,
    required this.email,
    required this.inveesBalance,
    required this.hostStatus,
    required this.isLive,
    required this.fansCount,
    required this.postsCount,
    required this.pioneersCount,
    required this.isCompleteProfile,
    required this.isVerified,
    required this.isExpert,
    required this.createdAt,
    required this.updatedAt,
    required this.socialRelation,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    name: json["name"],
    avatarUrl: json["avatar_url"],
    phone: json["phone"],
    email: json["email"],
    inveesBalance: json["invees_balance"],
    hostStatus: json["host_status"],
    isLive: json["is_live"],
    fansCount: json["fans_count"],
    postsCount: json["posts_count"],
    pioneersCount: json["pioneers_count"],
    isCompleteProfile: json["is_complete_profile"],
    isVerified: json["is_verified"],
    isExpert: json["is_expert"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    socialRelation: json["social_relation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "name": name,
    "avatar_url": avatarUrl,
    "phone": phone,
    "email": email,
    "invees_balance": inveesBalance,
    "host_status": hostStatus,
    "is_live": isLive,
    "fans_count": fansCount,
    "posts_count": postsCount,
    "pioneers_count": pioneersCount,
    "is_complete_profile": isCompleteProfile,
    "is_verified": isVerified,
    "is_expert": isExpert,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "social_relation": socialRelation,
  };
}
