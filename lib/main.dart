import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/cached/cached_helper.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedHelper.getInstance();
  runApp(ProviderScope(child: const InvesierApp()));
}
