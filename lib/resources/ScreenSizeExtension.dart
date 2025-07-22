import 'package:flutter/material.dart';

extension ScreenSizeExtension on BuildContext {
  // Screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  // Screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  // SafeArea insets
  double get topInset => MediaQuery.of(this).padding.top;
  double get bottomInset => MediaQuery.of(this).padding.bottom;
  double get leftInset => MediaQuery.of(this).padding.left;
  double get rightInset => MediaQuery.of(this).padding.right;
}
