import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rentapp/features/features.dart';

part 'address_cubit.freezed.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(
    super.initialState, {
    required IAddressRepository addressRepository,
  }) : _addressRepository = addressRepository;

  final IAddressRepository _addressRepository;

  AddressLoaded get addressLoadedState => state.maybeMap(
        loaded: (value) => value,
        orElse: () => throw AssertionError(),
      );

  Future<void> loadAddresses() async {
    final result = await _addressRepository.addresses();
    final newState = result.when(
      left: (_) => const AddressState.error(),
      right: (addresses) => AddressState.loaded(addresses: addresses),
    );
    emit(newState);
  }

  Future<void> addAddress(String reference, int userId) async {
    final request = AddressRequest(reference: reference);
    final addresses = [
      ...addressLoadedState.addresses,
      Address(
        id: Random().nextInt(1000),
        reference: reference,
        userId: userId,
      ),
    ];
    emit(addressLoadedState.copyWith(addresses: addresses));
    final result = await _addressRepository.saveAddress(
      request: request,
    );
    final newAddresses = result.when(
      left: (_) => [...addressLoadedState.addresses]..removeLast(),
      right: (value) => [...addressLoadedState.addresses]..last = value,
    );
    emit(addressLoadedState.copyWith(addresses: newAddresses));
  }

  Future<void> deletedAddress(Address address) async {
    final addresses = [...addressLoadedState.addresses];
    emit(
      addressLoadedState.copyWith(
        addresses: [...addresses]..remove(address),
      ),
    );
    final result = await _addressRepository.deletedAddress(
      address.id.toString(),
    );
    result.whenIsLeft(
      (_) => emit(
        addressLoadedState.copyWith(addresses: [...addresses, address]),
      ),
    );
  }
}
