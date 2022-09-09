import 'package:undostresflutter/data/api/services_provider.dart';
import 'package:undostresflutter/data/models/services.dart';

class ServicesRepository {
  ServicesProvider provider;
  List<Service>? services;

  ServicesRepository({required this.provider});

  Future<List<Service>> fetchAllServices() {
    if (services == null) {
      return provider.fetchAllServicesApi1();
    } else {
      return Future.value(services);
    }
  }

  List<Service> addServiceItem() {
    services![0].items.add(ServiceItem(
        id: 1,
        title: "Prueba",
        action: "prueba",
        imageName: "new_look_mobile_home.png"));
    return services!;
  }

  List<Service> removeLast() {
    services![0].items.removeLast();
    return services!;
  }
}
