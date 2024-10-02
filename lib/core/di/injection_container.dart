// Package imports:
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:scaler/core/api_client/client.dart';
import 'package:scaler/core/api_client/dio_client.dart';
import 'package:scaler/features/jobs/repo/jobs_repo.dart';
import 'package:scaler/features/jobs/repo/jobs_repo_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final _dio = Dio();

  sl
    ..registerLazySingleton<JobsRepo>(() => JobsRepoImpl(client: sl()))
    ..registerLazySingleton<ApiClient>(() => DioClient(_dio));
}
