import 'package:intl/intl.dart';

String timeAgo(String dateTimeString) {
  // Parse the input string to a DateTime object
  final inputTime = DateFormat('yyyy-MM-dd').parse(dateTimeString);

  // Get the current time
  final currentTime = DateTime.now();

  // Calculate the difference
  final difference = currentTime.difference(inputTime);

  // Return a human-readable string based on the difference
  if (difference.inDays > 0) {
    return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
  } else if (difference.inHours > 0) {
    return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
  } else if (difference.inMinutes > 0) {
    return "${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago";
  } else {
    return 'just now';
  }
}
