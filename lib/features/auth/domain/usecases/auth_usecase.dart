import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

abstract class IAuthUsecase {
  FutureHttpRequest<LoginResponse> login({required LoginRequest loginRequest});
  FutureHttpRequest<User> register({required RegisterRequest registerRequest});
  FutureEither<void, void> saveToken(String token);
  FutureEither<String, void> get token;
  FutureEither<void, void> logout();
}

class AuthUsecase implements IAuthUsecase {
  AuthUsecase({
    required IAuthRepository authRepository,
    required AuthClientService authClientService,
  })  : _authRepository = authRepository,
        _authClientService = authClientService;

  final IAuthRepository _authRepository;
  final AuthClientService _authClientService;

  @override
  FutureHttpRequest<LoginResponse> login({required LoginRequest loginRequest}) {
    return _authRepository.login(loginRequest: loginRequest);
  }

  @override
  FutureHttpRequest<User> register({required RegisterRequest registerRequest}) {
    return _authRepository.register(registerRequest: registerRequest);
  }

  @override
  FutureEither<void, void> saveToken(String token) {
    return _authClientService.saveToken(token);
  }

  @override
  FutureEither<void, void> logout() => _authClientService.logout();

  @override
  FutureEither<String, void> get token => _authClientService.accessToken;
}
