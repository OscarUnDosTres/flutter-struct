import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:undostresflutter/data/models/services.dart';

class HomeCardItem extends StatelessWidget {
  final ServiceItem item;

  HomeCardItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/new_look_mobile_home.png'),
              width: 48,
              height: 48,
            ),
            const SizedBox(height: 8),
            Text(item.title)
          ],
        ),
        onTap: () => context.go("/service", extra: item)

        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("clicked ${item.title}"))),
        );
  }
}
