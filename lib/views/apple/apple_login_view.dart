import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleLoginView extends StatefulWidget {
  const AppleLoginView({super.key});

  @override
  State<AppleLoginView> createState() => _AppleLoginView();
}

class _AppleLoginView extends State<AppleLoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/images/undostres_logo.png'),
          width: 180,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(child: SignInWithAppleButton(
          onPressed: () async {
            final credential = await SignInWithApple.getAppleIDCredential(
                scopes: [
                  AppleIDAuthorizationScopes.email,
                  AppleIDAuthorizationScopes.fullName,
                ],
                webAuthenticationOptions: WebAuthenticationOptions(
                  clientId: "mx.com.dev.123",
                  redirectUri: Uri.parse('http://localhost:56750/apple-login'),
                ));

            // ignore: avoid_print
            print(credential);
          },
        )),
      ),
    );
  }
}
