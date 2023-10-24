import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_request.freezed.dart';
part 'update_user_request.g.dart';

@freezed
class UpdateUserRequest with _$UpdateUserRequest {
  factory UpdateUserRequest({
    required String name,
    required String surname,
    required String birthdate,
    required String username,
    required String email,
    required String phone,
  }) = _UpdateUserRequest;

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);
}
