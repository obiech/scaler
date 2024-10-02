// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shimmer/shimmer.dart';

/// Extension methods on the [Widget] class to add shimmer effects.
extension ShimmerX on Widget {
  /// Wraps the widget with a shimmer effect while keeping its structure.
  Widget shimmer() => Shimmer.fromColors(
        baseColor: const Color(0xff6C2F80).withOpacity(0.1),
        highlightColor: Colors.white12.withOpacity(0.3),
        period: const Duration(milliseconds: 2600),
        child: Container(child: this),
      );
}
