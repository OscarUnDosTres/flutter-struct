// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:undostresflutter/data/models/services.dart';

class HomeButton extends StatelessWidget {
  final Function() func;
  final Stream stream;
  final String title;

  const HomeButton({
    Key? key,
    required this.func,
    required this.stream,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: ((context, snapshot) {
          return Center(
            child: ElevatedButton(
                onPressed: !isEnabled(snapshot) ? null : func,
                child: Text(title)),
          );
        }));
  }

  bool isEnabled(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasData) {
      var services = snapshot.data as List<Service>;
      if (services.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}
