import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:scaler/core/models/app_error.dart';
import 'package:scaler/features/jobs/models/job_details.dart';
import 'package:scaler/features/jobs/models/job_post.dart';
import 'package:scaler/features/jobs/repo/jobs_repo.dart';

part 'job_event.dart';
part 'job_state.dart';

/// Bloc for managing job-related events and states.
/// It uses HydratedMixin to persist the state across app launches.
class JobBloc extends Bloc<JobEvent, JobState> with HydratedMixin {
  // Constructor: Initializes the bloc with the JobsRepo and sets the initial state.
  JobBloc(this.repo) : super(JobState.initial()) {
    // Event handlers for the events the JobBloc will manage.
    // When a [GetJobList] event is received, call the _onGetJobListing method.
    on<GetJobList>(_onGetJobListing);
    // When a [GetJobDetails] event is received, call the _onGetJobDetails method.
    on<GetJobDetails>(_onGetJobDetails);
  }

  // Reference to the job repository, which handles data fetching.
  final JobsRepo repo;

  /// Handler for [GetJobList] event. This method will fetch the list of jobs.
  ///
  /// It first emits a loading state, then fetches the jobs using the repository.
  /// If the fetch is successful, it emits a success state with the list of jobs.
  /// If the fetch fails, it emits a failed state with the error.
  Future _onGetJobListing(GetJobList event, Emitter<JobState> emit) async {
    // Emit a loading state while the job posts are being fetched.
    emit(state.copyWith(status: Status.loading));

    // Fetch the job posts from the repository.
    final res = await repo.getJobPost();

    // Handle the result of the fetch operation (either failure or success).
    res.fold(
      // On failure, emit a failed state with the error.
      (left) => emit(state.copyWith(status: Status.failed, error: left)),
      // On success, emit a success state with the list of job posts.
      (right) => emit(state.copyWith(status: Status.success, jobsList: right)),
    );
  }

  /// Handler for GetJobDetails event. This method will fetch the details of a specific job.
  ///
  /// It first emits a loading state, then fetches the job details using the repository.
  /// If the fetch is successful, it emits a success state with the job details.
  /// If the fetch fails, it emits a failed state with the error.
  Future _onGetJobDetails(GetJobDetails event, Emitter<JobState> emit) async {
    // Emit a loading state while the job details are being fetched.
    emit(state.copyWith(status: Status.loading));

    // Fetch the job details from the repository using the job ID from the event.
    final res = await repo.getJobDetails(event.id);

    // Handle the result of the fetch operation (either failure or success).
    res.fold(
      // On failure, emit a failed state with the error.
      (left) => emit(state.copyWith(status: Status.failed, error: left)),
      // On success, emit a success state with the job details.
      (right) =>
          emit(state.copyWith(status: Status.success, jobDetails: right)),
    );
  }

  /// Method to restore the JobState from JSON when the app is restarted.
  /// This method is used by the HydratedMixin to persist the bloc state.
  @override
  JobState? fromJson(Map<String, dynamic> json) {
    return JobState.initial();
  }

  /// Method to convert the JobState to JSON for persistence.
  /// This method is used by the HydratedMixin to save the bloc state.
  @override
  Map<String, dynamic>? toJson(JobState state) {
    return {};
  }
}
