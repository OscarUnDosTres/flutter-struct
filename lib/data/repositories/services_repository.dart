import 'package:undostresflutter/data/api/services_provider.dart';
import 'package:undostresflutter/data/models/services.dart';

class ServicesRepository implements IServicesRepository {
  IServicesProvider provider;

  @override
  List<Service>? services;

  ServicesRepository({required this.provider});

  @override
  Future<List<Service>> fetchAllServices() {
    if (services == null) {
      return provider.fetchAllServicesApi2();
    } else {
      return Future.value(services);
    }
  }

  @override
  List<Service> addServiceItem() {
    services![0].items.add(ServiceItem(
        id: 1,
        title: "Prueba",
        action: "prueba",
        imageName: "new_look_mobile_home.png"));
    return services!;
  }

  @override
  List<Service> removeLast() {
    services![0].items.removeLast();
    return services!;
  }
}

abstract class IServicesRepository {
  List<Service>? services;

  Future<List<Service>> fetchAllServices();
  List<Service> addServiceItem();
  List<Service> removeLast();
}
