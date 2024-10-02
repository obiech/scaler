// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:scaler/core/models/app_error.dart';
import 'package:scaler/features/jobs/bloc/job_bloc.dart';
import 'package:scaler/features/jobs/screens/job_listing.dart';
import 'package:scaler/features/jobs/widgets/error_box.dart';
import 'package:scaler/features/shimmers/job_post_box_shimmer.dart';
import '../sample_data.dart';

// import 'package:mockito/mockito.dart';


class MockJobBloc extends MockBloc<JobEvent, JobState> implements JobBloc {}

class MockJobEvent extends Mock implements JobEvent {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    // Register the fallback value
    registerFallbackValue(MockJobEvent());
  });
  group('JobsTab Widget Tests', () {
    late JobBloc jobBloc;

    setUp(() {
      jobBloc = MockJobBloc();
    });

    Widget createWidgetUnderTest() {
      return BlocProvider<JobBloc>(
        create: (_) => jobBloc..add(const GetJobList()),
        child: const MaterialApp(
          home: ScreenUtilInit(
            designSize: Size(375, 824),
            child: JobsTab(),
          ),
        ),
      );
    }

    testWidgets(
        'When status is loading '
        'Should display loading shimmer', (WidgetTester tester) async {
      final state = JobState.initial().copyWith(status: Status.loading);
      when(() => jobBloc.state).thenReturn(state);

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.byType(JobPostBoxShimmer), findsOneWidget);
      expect(find.text('Jobs'), findsOneWidget);
    });

    testWidgets(
        'When status is failed '
        'Should display error box', (WidgetTester tester) async {
      // Arrange
      const errorMessage = 'Failed to load jobs';
      final state = JobState.initial().copyWith(
        status: Status.failed,
        error: const AppError(errorMessage),
      );
      when(() => jobBloc.state).thenReturn(state);

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text(errorMessage), findsOneWidget);
      expect(find.byType(ErrorBox), findsOneWidget);
      expect(find.text('Jobs'), findsOneWidget);
    });

    testWidgets(
        'When status is success but jobs is empty '
        'Should display error box', (WidgetTester tester) async {
      // Arrange
      final state = JobState.initial().copyWith(
        status: Status.success,
        jobsList: [],
      );
      when(() => jobBloc.state).thenReturn(state);

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('No Jobs Found.'), findsOneWidget);
      expect(find.byType(ErrorBox), findsOneWidget);
      expect(find.text('Jobs'), findsOneWidget);
    });

    testWidgets(
        'When status is success and jobs are returned '
        'Should display jobs list', (WidgetTester tester) async {
      // Arrange
      final state = JobState.initial().copyWith(
        status: Status.success,
        jobsList: jobs,
      );
      when(() => jobBloc.state).thenReturn(state);

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text(jobs.first.companyName), findsOneWidget);
      expect(find.text('Jobs'), findsOneWidget);
    });
  });
}
