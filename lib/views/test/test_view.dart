import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
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
            Text("Esto es una prueba",
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
