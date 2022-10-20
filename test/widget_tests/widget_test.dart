// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:undostresflutter/app/app.dart';
import 'package:undostresflutter/blocs/services_bloc.dart';
import 'package:undostresflutter/core/utils/service_locator.dart';
import 'package:undostresflutter/data/repositories/services_repository.dart';

import '../unit_tests/services_test/services_repository_test.dart';

void main() {
  group('Home Widget Success tests', () {
    setUp(() {
      getIt.registerSingleton<ServicesBloc>(ServicesBloc(
          repository:
              ServicesRepository(provider: ServicesProviderSuccessMock())));
    });
    testWidgets('Test Home load all services', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Verify that we have the Load Services Button
      expect(find.text('Load Services'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // // Tap the 'Load Services' icon and trigger a frame.
      await tester.tap(find.text('Load Services'));
      await tester.pump(const Duration(milliseconds: 10));

      // // Verify that Loading text is present
      expect(find.text('Loading....'), findsOneWidget);

      await tester.pump(const Duration(seconds: 2));

      // // Verify that Recharge text is present
      expect(find.text('Recarga'), findsOneWidget);
    });
  });
}
