import 'package:invesier/core/constant/app_strings.dart';

class UserModel {
  final int id;
  final String? username;
  final String? name;
  final String? avatarUrl;
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

  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json[AppStrings.id],
    username: json[AppStrings.username],
    name: json[AppStrings.name],
    avatarUrl: json[AppStrings.avatarUrl],
    phone: json[AppStrings.phone],
    email: json[AppStrings.email],
    inveesBalance: json[AppStrings.inveesBalance],
    hostStatus: json[AppStrings.hostStatus],
    isLive: json[AppStrings.isLive],
    fansCount: json[AppStrings.fansCount],
    postsCount: json[AppStrings.postsCount],
    pioneersCount: json[AppStrings.pioneersCount],
    isCompleteProfile: json[AppStrings.isCompleteProfile],
    isVerified: json[AppStrings.isVerified],
    isExpert: json[AppStrings.isExpert],
    createdAt: DateTime.parse(json[AppStrings.createdAt]),
    updatedAt: DateTime.parse(json[AppStrings.updatedAt]),
    socialRelation: json[AppStrings.socialRelation],
  );

  Map<String, dynamic> toJson() => {
    AppStrings.id: id,
    AppStrings.username: username,
    AppStrings.name: name,
    AppStrings.avatarUrl: avatarUrl,
    AppStrings.phone: phone,
    AppStrings.email: email,
    AppStrings.inveesBalance: inveesBalance,
    AppStrings.hostStatus: hostStatus,
    AppStrings.isLive: isLive,
    AppStrings.fansCount: fansCount,
    AppStrings.postsCount: postsCount,
    AppStrings.pioneersCount: pioneersCount,
    AppStrings.isCompleteProfile: isCompleteProfile,
    AppStrings.isVerified: isVerified,
    AppStrings.isExpert: isExpert,
    AppStrings.createdAt: createdAt.toIso8601String(),
    AppStrings.updatedAt: updatedAt.toIso8601String(),
    AppStrings.socialRelation: socialRelation,
  };
}
