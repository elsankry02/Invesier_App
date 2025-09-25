import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/get/get_user_profile_model.dart';
import '../provider.dart';

final usernameProvider = StateProvider<String>((ref) {
  return "";
});
final getUserIdProvider = FutureProvider<GetUserProfileModel>((ref) async {
  final service = ref.read(getUserProfileServiceProvider);
  final username = ref.watch(usernameProvider);
  return await service.getUserProfile(username: username);
});
