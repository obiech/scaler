import 'package:flutter/cupertino.dart';

// Abstract class for API clients
abstract class ApiClient<T> {
  // Patch request
  Future<T> patch(String endpoint, {dynamic body});

  // Post request
  Future<T> post(
    String endpoint, {
    // Request body
    dynamic body,
  });

  // Put request
  Future<T> put(String endpoint, {Map<String, dynamic>? body});

  // Get request
  Future<T> get(String endpoint);

  // Throws an error if condition is not met
  @visibleForTesting
  @protected
  @mustCallSuper
  T throwIfNot({
    // Response object
    required T response,
    // Condition to check
    required bool condition,
    // Error to throw
    required Exception error,
  }) {
    if (!condition) {
      throw error;
    } else {
      return response;
    }
  }
}
