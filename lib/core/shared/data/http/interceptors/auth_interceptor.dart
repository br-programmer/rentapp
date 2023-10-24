import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rentapp/core/core.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required AuthClientService authClientService,
  }) : _authClientService = authClientService;

  final AuthClientService _authClientService;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final response = await _authClientService.accessToken;
    final accessToken = response.when(
      left: (value) => value,
      right: (_) => null,
    );
    if (accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }
}
