String getTimeAgo(DateTime createdAt) {
  final now = DateTime.now();
  final difference = now.difference(createdAt);
  if (difference.inHours < 1) {
    return "${difference.inMinutes}m";
  } else if (difference.inHours < 24) {
    return "${difference.inHours}h";
  } else {
    return "${difference.inDays}d";
  }
}
