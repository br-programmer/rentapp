import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({required Http http}) : _http = http;
  final Http _http;

  @override
  FutureHttpRequest<LoginResponse> login({required LoginRequest loginRequest}) {
    return performHttpRequest(
      _http.send(
        APIServices.login,
        method: HttpMethod.post,
        body: loginRequest.toJson(),
        parser: (_, json) => LoginResponse.fromJson(json as Json),
      ),
    );
  }

  @override
  FutureHttpRequest<User> register({required RegisterRequest registerRequest}) {
    return performHttpRequest(
      _http.send(
        APIServices.register,
        method: HttpMethod.post,
        body: registerRequest.toJson(),
        parser: (_, json) => User.fromJson(json as Json),
      ),
    );
  }
}
