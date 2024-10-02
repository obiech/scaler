import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A stateless widget that displays an image with caching and error handling.
class CustomImage extends StatelessWidget {
  /// Creates a [CustomImage] widget.
  ///
  /// Requires [image] URL and [size] for the image dimensions.
  const CustomImage({
    super.key,
    required this.image, // The URL of the image to be displayed.
    required this.size, // The size (height and width) of the image.
  });

  final String image; // The URL of the image to be displayed.
  final double size; // The size of the image in logical pixels.

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Image(
        height: size.h,
        width: size.h,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
        image: CachedNetworkImageProvider(image),
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.logo_dev_rounded,
            size: size.h,
          );
        },
      ),
    );
  }
}
