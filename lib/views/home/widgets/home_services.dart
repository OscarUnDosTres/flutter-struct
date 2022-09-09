// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:undostresflutter/data/models/services.dart';

import 'home_card.dart';

class HomeServices extends StatelessWidget {
  final Stream stream;

  const HomeServices({
    Key? key,
    required this.stream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var services = snapshot.data as List<Service>;
            if (services.isEmpty) {
              return const Text("Loading....");
            } else {
              return ListView.builder(
                  itemCount: services.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (((context, index) {
                    return HomeCard(service: services[index]);
                  })));
            }
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
