import 'package:rentapp/core/core.dart';
import 'package:rentapp/features/features.dart';
import 'package:rentapp_ui/rentapp_ui.dart';

class AddressRepository implements IAddressRepository {
  AddressRepository({required Http http}) : _http = http;

  final Http _http;

  @override
  FutureHttpRequest<List<Address>> addresses() {
    return performHttpRequest(
      _http.send(
        APIServices.addresses,
        parser: (_, list) => (list as List).mapList(
          (json) => Address.fromJson(json as Json),
        ),
      ),
    );
  }

  @override
  FutureHttpRequest<Address> saveAddress({required AddressRequest request}) {
    return performHttpRequest(
      _http.send(
        APIServices.addressStore,
        method: HttpMethod.post,
        body: request.toJson(),
        parser: (_, json) => Address.fromJson(json as Json),
      ),
    );
  }

  @override
  FutureHttpRequest<void> deletedAddress(String id) {
    return performHttpRequest(
      _http.send(
        '${APIServices.addresses}/$id',
        method: HttpMethod.delete,
        parser: (_, json) {},
      ),
    );
  }
}
