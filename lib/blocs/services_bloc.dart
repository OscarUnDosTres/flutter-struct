import 'package:rxdart/subjects.dart';

import 'package:undostresflutter/data/models/services.dart';
import 'package:undostresflutter/data/repositories/services_repository.dart';

class ServicesBloc {
  final ServicesRepository repository;

  late BehaviorSubject<List<Service>?> _servicesFetcher;
  Stream<List<Service>?> get allServices => _servicesFetcher.stream;

  ServicesBloc({
    required this.repository,
  }) {
    _servicesFetcher = BehaviorSubject.seeded(null);
  }

  void fetchServices() async {
    _servicesFetcher.sink.add(List.empty(growable: false));
    repository.fetchAllServices().then((value) {
      if (value.isEmpty) {
        throw Exception('Empty value');
      } else {
        repository.services = value;
        _servicesFetcher.sink.add(value);
      }
    }).catchError((e) {
      _servicesFetcher.addError(e);
    });
  }

  void addService() {
    _servicesFetcher.add(repository.addServiceItem());
  }

  void removeService() {
    _servicesFetcher.add(repository.removeLast());
  }

  void clearCache() {
    repository.services = null;
    fetchServices();
  }

  void dispose() async {
    await _servicesFetcher.drain();
    _servicesFetcher.close();
  }
}
