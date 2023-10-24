import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

abstract class IAuthRepository {
  FutureHttpRequest<LoginResponse> login({required LoginRequest loginRequest});
  FutureHttpRequest<User> register({required RegisterRequest registerRequest});
}
