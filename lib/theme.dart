import 'package:flutter/material.dart';

import 'constants/colors.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme.light().copyWith(
    /// Primary colors
    primary: FCColors.yellow,
    onPrimary: FCColors.gray600,
    primaryContainer: FCColors.darkerYellow,
    onPrimaryContainer: FCColors.gray600,

    /// Background
    background: FCColors.gray100,
    onBackground: FCColors.gray600,

    /// Error
    error: FCColors.red,
  ),
);
