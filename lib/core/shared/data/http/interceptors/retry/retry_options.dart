import 'dart:async';

import 'package:dio/dio.dart';

extension RequestOptionsExtensions on RequestOptions {
  Options toOptions() {
    return Options(
      method: method,
      sendTimeout: sendTimeout,
      receiveTimeout: receiveTimeout,
      extra: extra,
      headers: headers,
      responseType: responseType,
      contentType: contentType,
      validateStatus: validateStatus,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      requestEncoder: requestEncoder,
      responseDecoder: responseDecoder,
      listFormat: listFormat,
    );
  }
}

typedef RetryEvaluator = FutureOr<bool> Function(DioException error);

class RetryOptions {
  const RetryOptions({
    this.retries = 1,
    RetryEvaluator? retryEvaluator,
    this.retryInterval = const Duration(seconds: 1),
  }) : _retryEvaluator = retryEvaluator;

  factory RetryOptions.noRetry() {
    return const RetryOptions(retries: 0);
  }

  /// The number of retry in case of an error
  final int retries;

  /// The interval before a retry.
  final Duration retryInterval;

  /// Evaluating if a retry is necessary.regarding the error.
  ///
  /// It can be a good candidate for additional operations too, like
  /// updating authentication token in case of a unauthorized error (be careful
  /// with concurrency though).
  ///
  /// Defaults to [defaultRetryEvaluator].
  RetryEvaluator get retryEvaluator => _retryEvaluator ?? defaultRetryEvaluator;

  final RetryEvaluator? _retryEvaluator;

  static const extraKey = 'cache_retry_request';

  /// Returns `true` only if the responses hasn't been cancelled or got
  /// a bas status code.
  static FutureOr<bool> defaultRetryEvaluator(DioException error) {
    return error.type != DioExceptionType.cancel &&
        error.type != DioExceptionType.badResponse;
  }

  static RetryOptions? fromExtra(RequestOptions request) =>
      request.extra[extraKey] as RetryOptions?;

  RetryOptions copyWith({int? retries, Duration? retryInterval}) {
    return RetryOptions(
      retries: retries ?? this.retries,
      retryInterval: retryInterval ?? this.retryInterval,
    );
  }

  Map<String, dynamic> toExtra() => {extraKey: this};

  Options toOptions() => Options(extra: toExtra());

  Options mergeIn(Options options) => options.copyWith(
        extra: <String, dynamic>{}
          ..addAll(options.extra ?? {})
          ..addAll(toExtra()),
      );
}
