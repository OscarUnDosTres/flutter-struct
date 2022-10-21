// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:undostresflutter/data/models/services.dart';
import 'package:undostresflutter/views/home/home_view.dart';
import 'package:undostresflutter/views/services/service_view.dart';
import 'package:undostresflutter/views/test/test_view.dart';
import 'package:undostresflutter/views/user/user_id_view.dart';
import 'package:undostresflutter/views/captcha/captcha_view.dart';
import 'package:undostresflutter/views/upload_file/upload_file_view.dart';
import 'package:undostresflutter/views/scroller/scroller.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView(title: "title");
        },
        routes: <RouteBase>[
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
            path: 'captcha',
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
              return CaptchaView();
            },
          ),
        ]),
  ],
);
