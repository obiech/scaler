// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A customizable shimmer box that serves as a placeholder for loading content.
///
/// This widget can be used to display a shimmering effect while data is loading.
class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    super.key,
    required this.height,
    required this.width,
    this.radius = 10,
  });

  /// The height of the shimmer box.
  final double height;

  /// The width of the shimmer box.
  final double width;

  /// The border radius of the shimmer box. Defaults to 10.
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
        color: const Color(0xff6C2F80),
      ),
    );
  }
}
