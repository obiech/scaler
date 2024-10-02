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
import 'package:scaler/features/jobs/screens/job_info.dart';
import 'package:scaler/features/jobs/widgets/error_box.dart';
import 'package:scaler/features/shimmers/jobs_info_shimmer.dart';
import '../sample_data.dart';

class MockJobBloc extends MockBloc<JobEvent, JobState> implements JobBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('JobsTab Widget Tests', () {
    late JobBloc jobBloc;

    setUp(() {
      jobBloc = MockJobBloc();
    });

    Widget createWidgetUnderTest() {
      return BlocProvider<JobBloc>(
        create: (_) => jobBloc..add(GetJobDetails(job.id)),
        child: const MaterialApp(
          home: ScreenUtilInit(
            designSize: Size(375, 824),
            child: JobInfo(),
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
      expect(find.byType(JobsInfoShimmer), findsOneWidget);
      expect(find.byType(JobInfo), findsOneWidget);
    });

    testWidgets(
        'When status is failed '
        'Should display error box', (WidgetTester tester) async {
      // Arrange
      const errorMessage = 'Failed to get job details';
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
      expect(find.byType(JobInfo), findsOneWidget);
    });

    testWidgets(
        'When status is success '
        'Should display jobs details', (WidgetTester tester) async {
      // Arrange
      final state = JobState.initial().copyWith(
        status: Status.success,
        jobDetails: jobdetails,
      );
      when(() => jobBloc.state).thenReturn(state);

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text(jobdetails.companyName), findsOneWidget);
    });
    testWidgets(
        'When in details page '
        'Should show apply button', (WidgetTester tester) async {
      // Arrange
      final state = JobState.initial().copyWith(
        status: Status.success,
        jobDetails: jobdetails,
      );
      when(() => jobBloc.state).thenReturn(state);

      // Act
      await tester.pumpWidget(createWidgetUnderTest());

      // Assert
      expect(find.text('Apply'), findsOneWidget);
    });
  });
}
