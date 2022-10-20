import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/services.dart';

class ServicesProvider implements IServicesProvider {
  @override
  Future<List<Service>> fetchAllServicesApi1() async {
    List<Service> list = List.empty(growable: true);
    String json = await rootBundle.loadString('assets/json/services_data.json');
    final data = jsonDecode(json);
    for (var element in data['data']) {
      list.add(Service.fromJSON(json: jsonEncode(element)));
    }

    // Set 2 seconds delayed for simulating an API calls :)
    return Future.delayed(const Duration(seconds: 2)).then((value) => list);
  }

  @override
  Future<List<Service>> fetchAllServicesApi2() async {
    List<Service> list = List.empty(growable: true);
    String json = await rootBundle.loadString('assets/json/services_data.json');
    final data = jsonDecode(json);
    for (var element in data['data']) {
      list.add(Service.fromJSON(json: jsonEncode(element)));
    }

    // Set 2 seconds delayed for simulating an API calls :)
    return Future.delayed(const Duration(seconds: 2)).then((value) => list);
  }
}

abstract class IServicesProvider {
  Future<List<Service>> fetchAllServicesApi1();
  Future<List<Service>> fetchAllServicesApi2();
}
