import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';

abstract class IAddressRepository {
  FutureHttpRequest<List<Address>> addresses();
  FutureHttpRequest<Address> saveAddress({
    required AddressRequest request,
  });
  FutureHttpRequest<void> deletedAddress(String id);
}
