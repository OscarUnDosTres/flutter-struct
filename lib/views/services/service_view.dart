import 'package:flutter/material.dart';

import '../../data/models/services.dart';

class ServiceView extends StatefulWidget {
  ServiceView({Key? key, required this.service}) : super(key: key);

  ServiceItem service;

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/images/undostres_logo.png'),
          width: 180,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: 8),
            Text(widget.service.title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .apply(fontWeightDelta: 3)),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Numero de Celular'),
            ),
          ],
        ),
      ),
    );
  }
}
