// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A stateless widget that displays a notification bell icon.
class NotificationBell extends StatelessWidget {
  /// Creates a [NotificationBell] widget.
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/bell-03.png',
          height: 16.h,
          width: 16.h,
        ),
        SizedBox(width: 24.w),
      ],
    );
  }
}
