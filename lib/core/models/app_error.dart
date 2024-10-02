// Package imports:
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  const AppError(this.message, [this.statusCode]);

  factory AppError.empty() => const AppError('');

  final String message;
  final String? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

typedef AppErrorOr<T> = Future<Either<AppError, T>>;
