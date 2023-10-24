import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rentapp/core/core.dart';

/// An interceptor that will try to send failed requests again
class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    required Dio dio,
    required bool enableLogging,
    RetryOptions? options,
  })  : _options = options ?? const RetryOptions(),
        _dio = dio,
        _enableLogging = enableLogging;

  final Dio _dio;
  final bool _enableLogging;
  final RetryOptions _options;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    var extra = RetryOptions.fromExtra(err.requestOptions) ?? _options;

    final shouldRetry = extra.retries > 0 && await _options.retryEvaluator(err);
    if (!shouldRetry) {
      return super.onError(err, handler);
    }

    if (extra.retryInterval.inMilliseconds > 0) {
      await Future<void>.delayed(extra.retryInterval);
    }

    // Update options to decrease retry count before new try
    extra = extra.copyWith(retries: extra.retries - 1);
    err.requestOptions.extra = err.requestOptions.extra
      ..addAll(extra.toExtra());

    if (_enableLogging) {
      log('👀 Retry request ${err.response?.realUri}');
    }
    // We retry with the updated options
    await _dio
        .request<void>(
          err.requestOptions.path,
          cancelToken: err.requestOptions.cancelToken,
          data: err.requestOptions.data,
          onReceiveProgress: err.requestOptions.onReceiveProgress,
          onSendProgress: err.requestOptions.onSendProgress,
          queryParameters: err.requestOptions.queryParameters,
          options: err.requestOptions.toOptions(),
        )
        .then(
          (value) => handler.resolve(value),
          onError: (Object error) => handler.reject(error as DioException),
        );
  }
}
