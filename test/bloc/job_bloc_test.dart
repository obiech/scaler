import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:scaler/core/models/app_error.dart';
import 'package:scaler/features/jobs/bloc/job_bloc.dart';
// import 'package:scaler/features/jobs/models/job_post.dart';
import 'package:scaler/features/jobs/repo/jobs_repo.dart';

import '../sample_data.dart';

class MockJobsRepo extends Mock implements JobsRepo {}

class MockHydratedStorage extends Mock implements HydratedStorage {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late JobBloc jobBloc;
  late MockJobsRepo mockJobsRepo;
  late MockHydratedStorage storage;

  setUp(() {
    mockJobsRepo = MockJobsRepo();
    jobBloc = JobBloc(mockJobsRepo);
    storage = MockHydratedStorage();
    when(() => storage.clear()).thenAnswer((_) async {});
    when(() => storage.close()).thenAnswer((_) async {});
    when(() => storage.delete(any())).thenAnswer((_) async {});
    when(() => storage.read(any())).thenAnswer((_) async {});
    when(() => storage.write(any(), any())).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  tearDown(() {
    jobBloc.close();
  });
  test('initial state is JobState.initial', () {
    expect(jobBloc.state, JobState.initial());
  });

  group('JobBloc', () {
    blocTest<JobBloc, JobState>(
      'When GetJobList is added and job list is fetched successfully '
      'Should emits [loading, success]',
      build: () {
        return jobBloc;
      },
      setUp: () {
        when(() => mockJobsRepo.getJobPost())
            .thenAnswer((_) async => Right(jobs));
      },
      act: (bloc) => bloc.add(const GetJobList()),
      expect: () => [
        JobState.initial().copyWith(status: Status.loading),
        JobState.initial().copyWith(status: Status.success, jobsList: jobs),
      ],
      verify: (_) {
        verify(() => mockJobsRepo.getJobPost()).called(1);
      },
    );

    blocTest<JobBloc, JobState>(
      'When GetJobList is added and fetching fails '
      'Should emits [loading, failed]',
      build: () {
        when(() => mockJobsRepo.getJobPost())
            .thenAnswer((_) async => const Left(AppError('Failed to fetch')));
        return jobBloc;
      },
      act: (bloc) => bloc.add(const GetJobList()),
      expect: () => [
        JobState.initial().copyWith(status: Status.loading),
        JobState.initial().copyWith(
          status: Status.failed,
          error: const AppError('Failed to fetch'),
        ),
      ],
      verify: (_) {
        verify(() => mockJobsRepo.getJobPost()).called(1);
      },
    );

    blocTest<JobBloc, JobState>(
      'When GetJobDetails is added and job details are fetched successfully '
      'should emits [loading, success]',
      build: () {
        when(() => mockJobsRepo.getJobDetails('1'))
            .thenAnswer((_) async => const Right(jobdetails));
        return jobBloc;
      },
      act: (bloc) => bloc.add(GetJobDetails(jobdetails.id)),
      expect: () => [
        JobState.initial().copyWith(status: Status.loading),
        JobState.initial().copyWith(
          status: Status.success,
          jobDetails: jobdetails,
        ),
      ],
      verify: (_) {
        verify(() => mockJobsRepo.getJobDetails(any())).called(1);
      },
    );

    blocTest<JobBloc, JobState>(
      'when GetJobDetails is added and fetching fails '
      'should emits [loading, failed]',
      build: () {
        when(() => mockJobsRepo.getJobDetails('1')).thenAnswer(
          (_) async => const Left(AppError('Failed to fetch details')),
        );
        return jobBloc;
      },
      act: (bloc) => bloc.add(GetJobDetails(jobdetails.id)),
      expect: () => [
        JobState.initial().copyWith(status: Status.loading),
        JobState.initial().copyWith(
          status: Status.failed,
          error: const AppError('Failed to fetch details'),
        ),
      ],
      verify: (_) {
        verify(() => mockJobsRepo.getJobDetails(any())).called(1);
      },
    );
  });
}
