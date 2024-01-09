import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension SizeBoxExtension on num {
  SizedBox get sh {
    return SizedBox(height: toDouble());
  }

  SizedBox get sw {
    return SizedBox(width: toDouble());
  }
}
