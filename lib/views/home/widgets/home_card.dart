import 'package:flutter/material.dart';
import 'package:undostresflutter/core/extensions/color_ext.dart';
import 'package:undostresflutter/views/home/widgets/home_card_item.dart';

import '../../../data/models/services.dart';

class HomeCard extends StatelessWidget {
  final Service service;

  const HomeCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 8),
          Row(
            children: <Widget>[
              const SizedBox(width: 8),
              Text(service.title,
                  style: Theme.of(context).textTheme.headline6!.apply(
                      color: service.color.toColor(), fontWeightDelta: 3)),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 8),
          GridView.builder(
              itemCount: service.items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9, crossAxisCount: 5),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                return HomeCardItem(item: service.items[index]);
              })),
        ],
      ),
    );
  }
}
