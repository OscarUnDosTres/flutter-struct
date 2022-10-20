import 'package:flutter_test/flutter_test.dart';
import 'package:undostresflutter/blocs/services_bloc.dart';
import 'package:undostresflutter/data/models/services.dart';
import 'package:undostresflutter/data/repositories/services_repository.dart';

import 'services_repository_test.dart';

void main() {
  late ServicesBloc bloc;
  late ServicesRepository repo;
  group("Services BLoC", () {
    //This will run before every test
    setUp(() {
      repo = ServicesRepository(provider: ServicesProviderSuccessMock());
      bloc = ServicesBloc(repository: repo);
    });

    test('should emit a list with two Services', () async {
      bloc.fetchServices();
      expect(
          bloc.allServices,
          emitsInOrder([
            List.empty(growable: false),
            predicate<List<Service>>((r) => r.length == 2)
          ]));
    });

    test('should emit a list with two Services and null', () async {
      expect(
          bloc.allServices,
          emitsInOrder([
            null,
            List.empty(growable: false),
            predicate<List<Service>>((r) => r.length == 2)
          ]));

      bloc.fetchServices();
    });
  });
}
