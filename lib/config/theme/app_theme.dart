import 'package:flutter/material.dart';

/// App Theme
///
/// This class is used to define the app theme.
///
/// Gonzalo Quedena
class AppTheme {
  /// Get Theme
  ///
  /// This method returns the app theme.
  ThemeData theme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      );
}
