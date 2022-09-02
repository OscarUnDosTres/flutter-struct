import 'dart:convert';

class Service {
  late int id;
  late String title;
  late bool showing;
  late String color;
  late bool collapsable;
  late List<ServiceItem> items;

  Service({
    required this.id,
    required this.title,
    required this.color,
    required this.items,
    this.collapsable = false,
    this.showing = true,
  });

  Service.fromJSON({
    required String json,
  }) {
    final data = jsonDecode(json);
    id = data['id'];
    title = data['title'];
    showing = data['showing'];
    color = data['color'];
    collapsable = data['collapsable'];
    items = List.empty(growable: true);

    for (var element in data['items']) {
      items.add(ServiceItem.fromJSON(json: jsonEncode(element)));
    }
  }

  Service.empty() {
    id = 1;
    title = "";
    showing = true;
    color = "";
    collapsable = false;
    items = List.empty();
  }
}

class ServiceItem {
  late int id;
  late String title;
  late bool showing;
  late String action;
  late String imageName;

  ServiceItem({
    required this.id,
    required this.title,
    required this.action,
    required this.imageName,
    this.showing = true,
  });

  ServiceItem.fromJSON({
    required String json,
  }) {
    final data = jsonDecode(json);
    id = data['id'];
    title = data['title'];
    showing = data['showing'];
    action = data['action'];
    imageName = data['imageName'];
  }
}
