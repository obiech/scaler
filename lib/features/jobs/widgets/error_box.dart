// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A stateless widget that displays an error message centered on the screen.
class ErrorBox extends StatelessWidget {
  /// Creates an [ErrorBox] widget.
  ///
  /// Requires a [message] to be displayed.
  const ErrorBox(
    this.message, {
    super.key,
  }); // Constructor accepting a message with an optional key.

  final String message; // The error message to be displayed in the box.

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
