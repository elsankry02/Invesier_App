import 'package:flutter/material.dart';

import '../extension/extension.dart';

abstract class AppTextTheme {
  // 🟣 Display
  static TextStyle kDisplayLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.displayLarge!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kDisplayMedium(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.displayMedium!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kDisplaySmall(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.displaySmall!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  // 🟣 Headline
  static TextStyle kHeadlineLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.headlineLarge!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kHeadlineMedium(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.headlineMedium!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kHeadlineSmall(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.headlineSmall!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  // 🟣 Title
  static TextStyle kTitleLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.titleLarge!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kTitleMedium(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.titleMedium!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kTitleSmall(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.titleSmall!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  // 🟣 Label
  static TextStyle kLabelLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.labelLarge!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kLabelMedium(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.labelMedium!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kLabelSmall(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.labelSmall!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  // 🟣 Body
  static TextStyle kBodyLarge(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.bodyLarge!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kBodyMedium(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.bodyMedium!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }

  static TextStyle kBodySmall(
    BuildContext context, {
    Color? color,
    FontWeight? fontWeight,
  }) {
    return context.kTextTheme.bodySmall!.copyWith(
      color: color,
      fontWeight: fontWeight,
    );
  }
}
