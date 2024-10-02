import 'package:scaler/core/models/app_error.dart';
import 'package:scaler/features/jobs/models/job_details.dart';
import 'package:scaler/features/jobs/models/job_post.dart';

/// An abstract class defining the contract for job-related repository operations.
abstract class JobsRepo {
  /// Fetches a list of job posts.
  ///
  /// This method returns an [AppErrorOr<List<JobPost>>], which can either be:
  /// - [Right] containing a list of [JobPost] instances if the operation is successful,
  /// - or [Left] containing an [AppError] if an error occurs during the fetch operation.
  AppErrorOr<List<JobPost>> getJobPost();

  /// Fetches the details of a specific job based on the given job ID.
  ///
  /// This method returns an [AppErrorOr<JobDetails>], which can either be:
  /// - [Right] containing a [JobDetails] instance if the operation is successful,
  /// - or [Left] containing an [AppError] if an error occurs during the fetch operation.
  AppErrorOr<JobDetails> getJobDetails(String id);
}
