import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory User({
    required int id,
    required String name,
    required String surname,
    required String birthdate,
    required String username,
    required DateTime createdAt,
    String? photo,
    String? email,
    String? phone,
    String? photoUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
