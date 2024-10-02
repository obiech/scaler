part of 'job_bloc.dart';

/// Represents the state of the job module, which holds the current status,
/// list of jobs, job details, and potential errors.
class JobState extends Equatable {
  const JobState({
    required this.status,
    required this.error,
    required this.jobsList,
    this.jobDetails,
  });

  /// Factory method to create the initial state of the job module.
  /// The initial state has no errors, an empty job list, and a status of 'initial'.
  factory JobState.initial() {
    return JobState(
      status: Status.initial,
      error: AppError.empty(), // No error initially
      jobsList: const [], // Empty list of jobs at the start
    );
  }

  /// Creates a new [JobState] by copying the current state and modifying
  /// specific fields that are passed to the function. This allows for immutability
  /// while making changes only to the desired fields.
  JobState copyWith({
    List<JobPost>? jobsList,
    JobDetails? jobDetails,
    AppError? error,
    Status? status,
  }) {
    return JobState(
      status: status ?? this.status,
      error: error ?? this.error, // Retain the current error if not provided
      jobsList: jobsList ?? this.jobsList,
      jobDetails: jobDetails, // Can pass new job details if available
    );
  }

  /// List of job posts, fetched or currently available.
  final List<JobPost> jobsList;

  /// The details of a specific job, can be null if not fetched.
  final JobDetails? jobDetails;

  /// Any errors encountered during fetching jobs or job details.
  final AppError error;

  /// Represents the current status of the bloc (e.g., loading, success, failed).
  final Status status;

  @override
  List<Object?> get props => [
        error,
        jobsList,
        status,
        jobDetails,
      ]; // Equatable props to compare JobState instances.
}

/// Enum representing different possible states of the bloc.
enum Status {
  initial, // The state when nothing has happened yet
  failed, // Indicates an error occurred
  loading, // The state when a fetch or action is in progress
  success, // The state when data has been successfully fetched or action succeeded
  empty // Can be used to represent an empty state with no data
}
