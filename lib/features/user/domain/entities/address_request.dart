import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_request.freezed.dart';
part 'address_request.g.dart';

@freezed
class AddressRequest with _$AddressRequest {
  factory AddressRequest({
    required String reference,
  }) = _AddressRequest;

  factory AddressRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressRequestFromJson(json);
}
