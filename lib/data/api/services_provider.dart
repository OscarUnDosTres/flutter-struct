import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/services.dart';

class ServicesProvider {
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
