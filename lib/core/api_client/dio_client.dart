// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:scaler/core/api_client/client.dart';

// DioClient class extends ApiClient, specializing in Response types.
class DioClient extends ApiClient<Response> {
  // Constructor that takes a Dio instance.
  DioClient(this._plugin);
  final Dio _plugin; // Private Dio instance for making HTTP requests.

  // Override the GET request method.
  @override
  Future<Response> get(String endpoint) async {
    // Make a GET request to the specified endpoint.
    final response = await _plugin.get(endpoint);
    return responseOrError(response); // Handle response or throw an error.
  }

  // Override the PATCH request method.
  @override
  Future<Response> patch(String endpoint, {dynamic body}) async {
    // Make a PATCH request to the specified endpoint with an optional body.
    final response =
        await _plugin.patch(endpoint, data: body, options: Options());
    return responseOrError(response); // Handle response or throw an error.
  }

  // Override the POST request method.
  @override
  Future<Response> post(String endpoint, {dynamic body}) async {
    // Make a POST request to the specified endpoint with an optional body.
    final response =
        await _plugin.post(endpoint, data: body, options: Options());
    return responseOrError(response); // Handle response or throw an error.
  }

  // Override the PUT request method.
  @override
  Future<Response> put(String endpoint, {Map<String, dynamic>? body}) async {
    // Make a PUT request to the specified endpoint with an optional body.
    final response = await _plugin.put(endpoint, data: body);
    return responseOrError(response); // Handle response or throw an error.
  }

  // Method to handle the response and throw an error if the response is not successful.
  Response responseOrError(Response response) {
    // Check if the response status code indicates success (2xx).
    return throwIfNot(
      response: response,
      // Condition to check if the status code starts with '2'.
      condition: response.statusCode.toString().trim().startsWith('2'),
      error: Exception('Something went Wrong'), // Generic error message.
    );
  }
}
