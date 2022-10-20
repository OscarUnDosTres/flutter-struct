import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:undostresflutter/data/api/services_provider.dart';
import 'package:undostresflutter/data/models/services.dart';
import 'package:undostresflutter/data/repositories/services_repository.dart';

import 'dart:convert';

void main() {
  group('Services Repository', () {
    test('fetch All services with exception', () {
      final provider = ServicesProviderFailMock();
      final repo = ServicesRepository(provider: provider);

      expect(() => repo.fetchAllServices(), throwsA(isA<HttpException>()));
    });

    test('fetch All services with wrong json', () {
      final provider = ServicesProviderFail2Mock();
      final repo = ServicesRepository(provider: provider);

      expect(() => repo.fetchAllServices(), throwsA(isA<FormatException>()));
    });

    test('fetch All services with good data', () async {
      final provider = ServicesProviderSuccessMock();
      final repo = ServicesRepository(provider: provider);

      final value = await repo.fetchAllServices();

      expect(value.length, 2);
    });
  });
}

class ServicesProviderFailMock implements IServicesProvider {
  @override
  Future<List<Service>> fetchAllServicesApi1() {
    throw HttpException("message");
  }

  @override
  Future<List<Service>> fetchAllServicesApi2() {
    throw HttpException("message");
  }
}

class ServicesProviderFail2Mock implements IServicesProvider {
  @override
  Future<List<Service>> fetchAllServicesApi1() {
    List<Service> list = List.empty(growable: true);
    final data = jsonDecode("json+/=>asd, aerf'asd");
    for (var element in data['data']) {
      list.add(Service.fromJSON(json: jsonEncode(element)));
    }

    // Set 2 seconds delayed for simulating an API calls :)
    return Future.delayed(const Duration(seconds: 2)).then((value) => list);
  }

  @override
  Future<List<Service>> fetchAllServicesApi2() {
    List<Service> list = List.empty(growable: true);
    final data = jsonDecode("json+/=>asd, aerf'asd");
    for (var element in data['data']) {
      list.add(Service.fromJSON(json: jsonEncode(element)));
    }

    // Set 2 seconds delayed for simulating an API calls :)
    return Future.delayed(const Duration(seconds: 2)).then((value) => list);
  }
}

class ServicesProviderSuccessMock implements IServicesProvider {
  @override
  Future<List<Service>> fetchAllServicesApi1() {
    List<Service> list = List.empty(growable: true);
    final data = jsonDecode(
        '{"data":[{"id":1,"title":"Recargas y Servicios","showing":true,"color":"#3F53B4","collapsable":false,"items":[{"id":1,"title":"Recarga","showing":true,"action":"action_recarga","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Tag","showing":true,"action":"action_tag","imageName":"new_look_mobile_home.png"},{"id":1,"title":"CFE","showing":true,"action":"action_cfe","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Internet","showing":true,"action":"action_internet","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Agua","showing":true,"action":"action_agua","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Gas","showing":true,"action":"action_gas","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Television","showing":true,"action":"action_tv","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Celular","showing":true,"action":"action_cellphone_plan","imageName":"new_look_mobile_home.png"}]},{"id":1,"title":"Tiendas en linea","showing":true,"color":"#469DD8","collapsable":false,"items":[{"id":1,"title":"Celulares","showing":true,"action":"action_tag","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Ropa","showing":true,"action":"action_cfe","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Computo","showing":true,"action":"action_internet","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Gadgets","showing":true,"action":"action_agua","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Gamming","showing":true,"action":"action_gas","imageName":"new_look_mobile_home.png"}]}]}');
    for (var element in data['data']) {
      list.add(Service.fromJSON(json: jsonEncode(element)));
    }

    // Set 2 seconds delayed for simulating an API calls :)
    return Future.delayed(const Duration(seconds: 2)).then((value) => list);
  }

  @override
  Future<List<Service>> fetchAllServicesApi2() {
    List<Service> list = List.empty(growable: true);
    final data = jsonDecode(
        '{"data":[{"id":1,"title":"Recargas y Servicios","showing":true,"color":"#3F53B4","collapsable":false,"items":[{"id":1,"title":"Recarga","showing":true,"action":"action_recarga","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Tag","showing":true,"action":"action_tag","imageName":"new_look_mobile_home.png"},{"id":1,"title":"CFE","showing":true,"action":"action_cfe","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Internet","showing":true,"action":"action_internet","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Agua","showing":true,"action":"action_agua","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Gas","showing":true,"action":"action_gas","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Television","showing":true,"action":"action_tv","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Celular","showing":true,"action":"action_cellphone_plan","imageName":"new_look_mobile_home.png"}]},{"id":1,"title":"Tiendas en linea","showing":true,"color":"#469DD8","collapsable":false,"items":[{"id":1,"title":"Celulares","showing":true,"action":"action_tag","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Ropa","showing":true,"action":"action_cfe","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Computo","showing":true,"action":"action_internet","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Gadgets","showing":true,"action":"action_agua","imageName":"new_look_mobile_home.png"},{"id":1,"title":"Gamming","showing":true,"action":"action_gas","imageName":"new_look_mobile_home.png"}]}]}');
    for (var element in data['data']) {
      list.add(Service.fromJSON(json: jsonEncode(element)));
    }

    // Set 2 seconds delayed for simulating an API calls :)
    return Future.delayed(const Duration(seconds: 2)).then((value) => list);
  }
}
