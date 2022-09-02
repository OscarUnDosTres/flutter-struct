import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/services.dart';

class ServicesProvider {
  Future<List<Service>> fetchAllServices() async {
    List<Service> list = List.empty(growable: true);
    String json = await rootBundle.loadString('assets/json/services_data.json');
    final data = jsonDecode(json);
    for (var element in data['data']) {
      list.add(Service.fromJSON(json: jsonEncode(element)));
    }

    return Future.delayed(const Duration(seconds: 2)).then((value) => list);
  }
}
