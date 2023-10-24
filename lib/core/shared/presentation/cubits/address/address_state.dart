part of 'address_cubit.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.initial() = _Initial;
  const factory AddressState.loading() = _Loading;
  const factory AddressState.loaded({required List<Address> addresses}) =
      AddressLoaded;
  const factory AddressState.error() = _Error;
}
