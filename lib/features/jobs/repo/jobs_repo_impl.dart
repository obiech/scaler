// ignore_for_file: avoid_dynamic_calls

import 'package:dartz/dartz.dart';
import 'package:scaler/core/api_client/client.dart';
import 'package:scaler/core/models/app_error.dart';
import 'package:scaler/features/jobs/models/job_details.dart';
import 'package:scaler/features/jobs/models/job_post.dart';
import 'package:scaler/features/jobs/repo/jobs_repo.dart';

/// Implementation of the JobsRepo interface, responsible for fetching job-related data
class JobsRepoImpl implements JobsRepo {
  /// Creates an instance of [JobsRepoImpl].
  ///
  /// Requires an [ApiClient] instance to make HTTP requests.
  JobsRepoImpl({required this.client});

  /// The API client used to make network requests.
  final ApiClient client;

  /// The base endpoint for job-related API calls.
  static const String endpoint =
      'https://mpa0771a40ef48fcdfb7.free.beeceptor.com';

  /// Fetches the details of a specific job based on the given job ID.
  ///
  /// Returns a [Right] containing [JobDetails] if successful, or a [Left]
  /// containing an [AppError] if an error occurs during the request.
  @override
  AppErrorOr<JobDetails> getJobDetails(String id) async {
    try {
      // Making a GET request to fetch job details
      final res = await client.get('$endpoint/jobs/$id');
      // Parsing the response into JobDetails and returning it
      return Right(JobDetails.fromJson(res.data['data']));
    } catch (e) {
      // Returning an error if the request fails
      return const Left(AppError('Something Went Wrong.'));
    }
  }

  /// Fetches a list of job posts.
  ///
  /// Returns a [Right] containing a list of [JobPost] if successful, or a [Left]
  /// containing an [AppError] if an error occurs during the request.
  @override
  AppErrorOr<List<JobPost>> getJobPost() async {
    try {
      // Making a GET request to fetch all job posts
      final res = await client.get('$endpoint/jobs');
      // Parsing the response into a list of JobPosts and returning it
      final posts = List<Map<String, dynamic>>.from(res.data['data'])
          .map(JobPost.fromJson)
          .toList();
      return Right(posts);
    } catch (e) {
      // Returning an error if the request fails
      return const Left(AppError('Something Went Wrong.'));
    }
  }
}
