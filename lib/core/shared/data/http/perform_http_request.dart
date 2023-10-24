import 'dart:io';

import 'package:rentapp/core/core.dart';

FutureEither<HttpRequestFailure, T> performHttpRequest<T>(
  Future<HttpResult<T>> future,
) async {
  final result = await future;
  return result.when(
    success: (_, value) => Either.right(value),
    failed: (statusCode, error) {
      if (error is SocketException) {
        return Either.left(HttpRequestFailure.network());
      }
      HttpRequestFailure? failure;
      switch (statusCode) {
        case HttpStatus.forbidden:
          failure = HttpRequestFailure.forbidden();
        case HttpStatus.unauthorized:
          failure = HttpRequestFailure.unauthorized();
        case HttpStatus.notFound:
          failure = HttpRequestFailure.notFound();
        case HttpStatus.unprocessableEntity:
          failure = HttpRequestFailure.unprocessableEntity();
        case HttpStatus.internalServerError:
          failure = HttpRequestFailure.server();
      }
      failure ??= HttpRequestFailure.unhandledException(error: error);
      return Either.left(failure);
    },
  );
}
