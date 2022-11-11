// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:undostresflutter/models/services.dart';
import 'package:undostresflutter/presentation/views/apple/apple_login_view.dart';
import 'package:undostresflutter/presentation/views/home/home_view.dart';
import 'package:undostresflutter/presentation/views/paypal/paypal_success.dart';
import 'package:undostresflutter/presentation/views/paypal/paypal_view.dart';
import 'package:undostresflutter/presentation/views/services/service_view.dart';
import 'package:undostresflutter/presentation/views/test/test_view.dart';
import 'package:undostresflutter/presentation/views/user/user_id_view.dart';
import 'package:undostresflutter/presentation/views/captcha/captcha_view.dart';
import 'package:undostresflutter/presentation/views/upload_file/upload_file_view.dart';
import 'package:undostresflutter/presentation/views/scroller/scroller.dart';
import 'package:undostresflutter/presentation/views/user/user_wallet_view.dart';

import '../presentation/views/slide_up/slide_up_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView(title: "title");
        },
        routes: <RouteBase>[
          GoRoute(
              path: 'paypal',
              builder: (BuildContext context, GoRouterState state) {
                return const PayPalView();
              }),
          GoRoute(
              path: 'paypal-success/:payment/:token',
              builder: (BuildContext context, GoRouterState state) {
                String payment = state.params["payment"]!;
                String token = state.params["token"]!;
                return PayPalSuccess(paymentID: payment, token: token);
              }),
          GoRoute(
              path: 'service',
              builder: (BuildContext context, GoRouterState state) {
                return ServiceView(
                  service: state.extra as ServiceItem,
                );
              }),
          GoRoute(
              path: 'test',
              builder: (BuildContext context, GoRouterState state) {
                return TestView();
              }),
          GoRoute(
              path: 'verify-user-id',
              builder: (BuildContext context, GoRouterState state) {
                return const UserIdView();
              }),
          GoRoute(
            path: 'upload-file',
            builder: (BuildContext context, GoRouterState state) {
              return const UploadFileView();
            },
          ),
          GoRoute(
            path: 'scroller',
            builder: (BuildContext context, GoRouterState state) {
              return const ScrollerView();
            },
          ),
          GoRoute(
            path: 'captcha',
            builder: (BuildContext context, GoRouterState state) {
              return const CaptchaView();
            },
          ),
          GoRoute(
            path: 'slide-up',
            builder: (BuildContext context, GoRouterState state) {
              return const SlideUpView();
            },
          ),
          GoRoute(
            path: 'apple-login',
            builder: (BuildContext context, GoRouterState state) {
              return const AppleLoginView();
            },
          ),
          GoRoute(
            path: 'verify-user-wallet',
            builder: (BuildContext context, GoRouterState state) {
              return const UserWalletView();
            },
          ),
        ]),
  ],
);
