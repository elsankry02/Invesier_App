class GetPostsModel {
  final List<Datum> data;
  final Links links;
  final Meta meta;

  GetPostsModel({required this.data, required this.links, required this.meta});

  factory GetPostsModel.fromJson(Map<String, dynamic> json) => GetPostsModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Datum {
  final int id;
  final String content;
  final bool isPostCreator;
  final bool canDelete;
  final bool canReport;
  final bool canPin;
  final int upvotesCount;
  final int downvotesCount;
  final int commentsCount;
  final bool hasUpvoted;
  final bool hasDownvoted;
  final bool isPinned;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Datum({
    required this.id,
    required this.content,
    required this.isPostCreator,
    required this.canDelete,
    required this.canReport,
    required this.canPin,
    required this.upvotesCount,
    required this.downvotesCount,
    required this.commentsCount,
    required this.hasUpvoted,
    required this.hasDownvoted,
    required this.isPinned,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    content: json["content"],
    isPostCreator: json["is_post_creator"],
    canDelete: json["can_delete"],
    canReport: json["can_report"],
    canPin: json["can_pin"],
    upvotesCount: json["upvotes_count"],
    downvotesCount: json["downvotes_count"],
    commentsCount: json["comments_count"],
    hasUpvoted: json["has_upvoted"],
    hasDownvoted: json["has_downvoted"],
    isPinned: json["is_pinned"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "is_post_creator": isPostCreator,
    "can_delete": canDelete,
    "can_report": canReport,
    "can_pin": canPin,
    "upvotes_count": upvotesCount,
    "downvotes_count": downvotesCount,
    "comments_count": commentsCount,
    "has_upvoted": hasUpvoted,
    "has_downvoted": hasDownvoted,
    "is_pinned": isPinned,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toJson(),
  };
}

class User {
  final int id;
  final String username;
  final String name;
  final String avatarUrl;
  final dynamic phone;
  final String email;
  final dynamic inveesBalance;
  final String hostStatus;
  final bool isShown;
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
    required this.isShown,
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
    isShown: json["is_shown"],
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
    "is_shown": isShown,
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

class Links {
  final String first;
  final String last;
  final dynamic prev;
  final dynamic next;

  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  final int currentPage;
  final int from;
  final int lastPage;
  final List<Link> links;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  final String url;
  final String label;
  final bool active;

  Link({required this.url, required this.label, required this.active});

  factory Link.fromJson(Map<String, dynamic> json) =>
      Link(url: json["url"], label: json["label"], active: json["active"]);

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
