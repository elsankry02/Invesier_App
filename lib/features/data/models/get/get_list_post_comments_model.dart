class Datum {
  final int id;
  final String content;
  final bool isCommentCreator;
  final bool canDelete;
  final bool canReport;
  final int upvotesCount;
  final int downvotesCount;
  final bool hasUpvoted;
  final bool hasDownvoted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;
  final List<Datum> children;
  final int repliesCount;
  final String commentType;
  final int commentableId;
  final String commentableType;
  final bool isReply;
  final int postId;

  Datum({
    required this.id,
    required this.content,
    required this.isCommentCreator,
    required this.canDelete,
    required this.canReport,
    required this.upvotesCount,
    required this.downvotesCount,
    required this.hasUpvoted,
    required this.hasDownvoted,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.children,
    required this.repliesCount,
    required this.commentType,
    required this.commentableId,
    required this.commentableType,
    required this.isReply,
    required this.postId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    content: json["content"],
    isCommentCreator: json["is_comment_creator"],
    canDelete: json["can_delete"],
    canReport: json["can_report"],
    upvotesCount: json["upvotes_count"],
    downvotesCount: json["downvotes_count"],
    hasUpvoted: json["has_upvoted"],
    hasDownvoted: json["has_downvoted"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: User.fromJson(json["user"]),
    children:
        (json["children"] as List?)?.map((x) => Datum.fromJson(x)).toList() ??
        [],
    repliesCount: json["replies_count"],
    commentType: json["comment_type"],
    commentableId: json["commentable_id"],
    commentableType: json["commentable_type"],
    isReply: json["is_reply"],
    postId: json["post_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "is_comment_creator": isCommentCreator,
    "can_delete": canDelete,
    "can_report": canReport,
    "upvotes_count": upvotesCount,
    "downvotes_count": downvotesCount,
    "has_upvoted": hasUpvoted,
    "has_downvoted": hasDownvoted,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toJson(),
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
    "replies_count": repliesCount,
    "comment_type": commentType,
    "commentable_id": commentableId,
    "commentable_type": commentableType,
    "is_reply": isReply,
    "post_id": postId,
  };
}

class User {
  final int id;
  final String? username;
  final String? name;
  final String? avatarUrl;
  final String? phone;
  final String? email;
  final int inveesBalance;
  final String? hostStatus;
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
  final String? socialRelation;

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
