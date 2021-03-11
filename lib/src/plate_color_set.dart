import 'package:flutter/material.dart';

/// Represents a set of colors used by a specific plate type.
class PlateColorSet {
  /// The color used to paint the license plate's border
  final Color borderColor;

  /// The color used to paint the license plate's letters
  final Color lettersCollor;

  /// The color used to fill the license plate's background
  final Color backgroundColor;
  const PlateColorSet(
      {required this.backgroundColor,
      required this.borderColor,
      required this.lettersCollor});
}
