import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

abstract class IUserRepository {
  FutureHttpRequest<User> userInfo();
  FutureHttpRequest<User> updateUser({
    required UpdateUserRequest updateUserRequest,
  });
}
