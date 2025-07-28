import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'boot.dart';

void main() async {
  final override = await getOverrides();
  runApp(ProviderScope(overrides: override, child: const InvesierApp()));
}
