import 'package:rentapp/core/core.dart';

typedef Json = Map<String, dynamic>;

typedef FutureEither<L, R> = Future<Either<L, R>>;
typedef FutureHttpRequest<R> = Future<Either<HttpRequestFailure, R>>;
typedef OnUploadProgress = void Function(double percentage);
