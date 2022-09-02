import 'package:undostresflutter/data/api/services_provider.dart';
import 'package:undostresflutter/data/models/services.dart';

class ServicesRepository {
  ServicesProvider provider;

  ServicesRepository({required this.provider});

  Future<List<Service>> fetchAllServices() => provider.fetchAllServices();
}
