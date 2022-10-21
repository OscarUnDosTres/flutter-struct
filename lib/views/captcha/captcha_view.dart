import 'dart:convert';
import 'dart:io';
// import 'dart:io';

import 'package:flutter/material.dart';

// import 'dart:ui' as ui;
// import 'dart:html' as html;

// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CaptchaView extends StatefulWidget {
  const CaptchaView({super.key});

  @override
  State<CaptchaView> createState() => _CaptchaView();
}

class _CaptchaView extends State<CaptchaView> {
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();

    // ignore: undefined_prefixed_name
    // ui.platformViewRegistry.registerViewFactory(
    //   "recaptcha",
    //   (int viewId) => html.IFrameElement()
    //     ..style.height = '100%'
    //     ..style.width = '100%'
    //     ..src = '/assets/html/recaptcha.html'
    //     ..style.border = 'none',
    // );
    // html.window.onMessage.listen((event) {
    //   // _bloc.captchaCompleted();
    // });

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Image(
    //         image: AssetImage('assets/images/undostres_logo.png'),
    //         width: 180,
    //       ),
    //     ),
    //     body: Container(
    //       width: 400,
    //       height: 200,
    //       child: const Directionality(
    //         textDirection: TextDirection.ltr,
    //         child: HtmlElementView(
    //           viewType: 'recaptcha',
    //         ),
    //       ),
    //     ));

    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/images/undostres_logo.png'),
          width: 180,
        ),
      ),
      body: Center(
          child: WebView(
        initialUrl: "https://recaptcha-fa095.web.app/",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: {
          JavascriptChannel(
              name: 'Captcha',
              onMessageReceived: (JavascriptMessage message) {
                //This is where you receive message from
                //javascript code and handle in Flutter/Dart
                //like here, the message is just being printed
                //in Run/LogCat window of android studio
                //print(message.message);
              })
        },
        onWebViewCreated: (WebViewController w) {
          webViewController = w;
        },
      )),
    );
  }
}
