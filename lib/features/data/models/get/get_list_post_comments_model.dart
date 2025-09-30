class ListPostCommentsModel {
  final dynamic id;
  final dynamic content;
  final bool isCommentCreator;
  final bool canDelete;
  final bool canReport;
  final int upvotesCount;
  final int downvotesCount;
  final bool hasUpvoted;
  final bool hasDownvoted;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic commentableId;
  final dynamic commentableType;
  final bool isReply;

  ListPostCommentsModel({
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
    required this.commentableId,
    required this.commentableType,
    required this.isReply,
  });

  factory ListPostCommentsModel.fromJson(Map<String, dynamic> json) =>
      ListPostCommentsModel(
        id: json["id"],
        content: json["content"],
        isCommentCreator: json["is_comment_creator"],
        canDelete: json["can_delete"],
        canReport: json["can_report"],
        upvotesCount: json["upvotes_count"],
        downvotesCount: json["downvotes_count"],
        hasUpvoted: json["has_upvoted"],
        hasDownvoted: json["has_downvoted"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        commentableId: json["commentable_id"],
        commentableType: json["commentable_type"],
        isReply: json["is_reply"],
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
    "created_at": createdAt,
    "updated_at": updatedAt,
    "commentable_id": commentableId,
    "commentable_type": commentableType,
    "is_reply": isReply,
  };
}
