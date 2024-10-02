part of 'job_bloc.dart';

/// Base class for all job-related events.
/// This is the parent class for events handled by the JobBloc.
class JobEvent {
  const JobEvent();
}

/// Event to request the list of job posts.
/// This event is triggered when the user wants to load the list of jobs.
class GetJobList extends JobEvent {
  const GetJobList();
}

/// Event to request the details of a specific job.
/// This event is triggered when the user selects a job and requests its detailed information.
class GetJobDetails extends JobEvent {
  const GetJobDetails(this.id);

  // The unique identifier for the job whose details are being requested.
  final String id;
}
