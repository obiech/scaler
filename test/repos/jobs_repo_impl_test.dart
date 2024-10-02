// import 'dart:convert';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:scaler/core/api_client/client.dart';
import 'package:scaler/features/jobs/repo/jobs_repo_impl.dart';
import '../sample_data.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late JobsRepoImpl jobsRepo;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    jobsRepo = JobsRepoImpl(client: mockApiClient);
  });

  group('getJobDetails', () {
    test(
        'When getJobDetails is called and the statusCode is 200 '
        'should return JobDetails', () async {
      // Arrange
      when(() => mockApiClient.get(any())).thenAnswer(
        (_) async => Response(
          data: mockJobDetailsJson,
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );

      // Act
      final result = await jobsRepo.getJobDetails(jobId);

      // Assert
      expect(result, isA<Right>());
      final jobDetails = (result as Right).value;
      expect(jobDetails.id, '1');
      expect(jobDetails.title, 'Software Engineer');

      verify(() => jobsRepo.getJobDetails(jobId)).called(1);
    });

    test(
        'When getJobDetails is called and exception is thrown '
        'should return AppError', () async {
      // Arrange
      when(() => mockApiClient.get(any())).thenThrow(Exception('API Error'));

      // Act
      final result = await jobsRepo.getJobDetails(jobId);

      // Assert
      expect(result, isA<Left>());
      final error = (result as Left).value;
      expect(error.message, 'Something Went Wrong.');
      verify(() => jobsRepo.getJobDetails(jobId)).called(1);
    });
  });

  group('getJobPost', () {
    test(
        'When getJobPost is called and 200 statuscode is return '
        'should return Right', () async {
      // Arrange
      when(() => mockApiClient.get(any())).thenAnswer(
        (_) async => Response(
          data: mockJobPostJson,
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );

      // Act
      final result = await jobsRepo.getJobPost();

      // Assert
      expect(result, isA<Right>());
      verify(() => jobsRepo.getJobPost()).called(1);
    });

    test(
        'When getJobPost is called and Exception is thrown '
        'should return Left', () async {
      // Arrange
      when(() => mockApiClient.get(any())).thenThrow(Exception('API Error'));

      // Act
      final result = await jobsRepo.getJobPost();

      // Assert
      expect(result, isA<Left>());
      final error = (result as Left).value;
      expect(error.message, 'Something Went Wrong.');
      verify(() => jobsRepo.getJobPost()).called(1);
    });
  });
}
