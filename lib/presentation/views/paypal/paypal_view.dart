import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PayPalView extends StatefulWidget {
  const PayPalView({super.key});

  @override
  State<PayPalView> createState() => _PayPalView();
}

class _PayPalView extends State<PayPalView> {
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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                var url = Uri.parse(
                    "http://localhost:3000/pay/name=RedHat/sku=001-1/prc=30.00/curr=USD/qnt=1");
                if (await canLaunchUrl(url)) {
                  // HttpRequest.postFormData(urlP, data);
                  await launchUrl(url, webOnlyWindowName: "_self");
                } else {
                  throw 'Cannot launch $url';
                }
              },
              child: const Text("Buy"))
        ],
      )),
    );
  }
}
