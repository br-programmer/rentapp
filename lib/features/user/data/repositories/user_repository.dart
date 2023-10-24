import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

class UserRepository implements IUserRepository {
  UserRepository({required Http http}) : _http = http;

  final Http _http;

  @override
  FutureHttpRequest<User> userInfo() {
    return performHttpRequest(
      _http.send(
        APIServices.userInfo,
        parser: (_, json) => User.fromJson(json as Json),
      ),
    );
  }

  @override
  FutureHttpRequest<User> updateUser({
    required UpdateUserRequest updateUserRequest,
  }) {
    return performHttpRequest(
      _http.send(
        APIServices.updateInfo,
        method: HttpMethod.post,
        body: updateUserRequest.toJson(),
        parser: (_, json) => User.fromJson(json as Json),
      ),
    );
  }
}
