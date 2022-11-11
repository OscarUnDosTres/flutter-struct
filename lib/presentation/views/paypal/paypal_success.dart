import 'package:flutter/material.dart';

class PayPalSuccess extends StatefulWidget {
  const PayPalSuccess(
      {super.key, required this.paymentID, required this.token});

  final String paymentID;
  final String token;

  @override
  State<PayPalSuccess> createState() => _PayPalSuccess();
}

class _PayPalSuccess extends State<PayPalSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Image(
            image: AssetImage('assets/images/undostres_logo.png'),
            width: 180,
          ),
        ),
        body: Center(
            child: Column(children: [
          Text(widget.paymentID),
          Text(widget.token),
          const Text("Compra exitosa")
        ])));
  }
}
