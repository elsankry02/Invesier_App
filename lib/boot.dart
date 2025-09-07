import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/data/provider/provider.dart';

Future<List<Override>> getOverrides() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  return [prefsProvider.overrideWithValue(prefs)];
}
