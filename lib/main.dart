import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/boot.dart';

import 'app.dart';

void main() async {
  final override = await getOverrides();
  runApp(ProviderScope(overrides: override, child: const InvesierApp()));
}
