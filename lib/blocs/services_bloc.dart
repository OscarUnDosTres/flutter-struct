// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rxdart/subjects.dart';

import 'package:undostresflutter/data/models/services.dart';
import 'package:undostresflutter/data/repositories/services_repository.dart';

class ServicesBloc {
  final ServicesRepository repository;

  late BehaviorSubject<List<Service>> _servicesFetcher;

  Stream<List<Service>> get allServices => _servicesFetcher.stream;

  ServicesBloc({
    required this.repository,
  }) {
    _servicesFetcher =
        BehaviorSubject<List<Service>>.seeded(List.empty(growable: true));
  }

  void fetchServices() async {
    repository.fetchAllServices().then((value) {
      if (value.isEmpty) {
        throw Exception('Empty value');
      } else {
        _servicesFetcher.sink.add(value);
      }
    }).catchError((e) {
      _servicesFetcher.error;
    });
  }

  void dispose() async {
    await _servicesFetcher.drain();
    _servicesFetcher.close();
  }
}
