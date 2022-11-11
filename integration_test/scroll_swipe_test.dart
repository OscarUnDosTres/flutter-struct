import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:undostresflutter/app/app.dart';
import 'package:undostresflutter/blocs/services_bloc.dart';
import 'package:undostresflutter/core/utils/service_locator.dart';
import 'package:undostresflutter/data/repositories/services_repository.dart';
import 'package:undostresflutter/keys/keys.dart';
import 'package:undostresflutter/main.dart' as app;

import '../test/unit_tests/services_test/services_repository_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  tearDown(() async {
    await getIt.reset();
  });

  group('Scroller', () {
    testWidgets('Vertical and horizontal scrolling until element is visible', (
        tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(K.scrollerButton));
      await tester.pumpAndSettle();

      //var verticalScrollView = find
      //    .byType(SingleChildScrollView)
      //    .first;
      final scrollableFinder = find
          .descendant(
        of: find.byKey(K.colorPaletteScrollView), matching: find.byType(Scrollable),)
          .first;
      final someColorContainer = find.byKey(K.aColorContainer);
     //    .textContaining('0xffffeb3b')
     //    .last;

      await tester.scrollUntilVisible(
        someColorContainer,
        500.0,
        scrollable: scrollableFinder,
      );
      await tester.pumpAndSettle();

      expect(someColorContainer, findsOneWidget);
    });

    testWidgets('Swipe panel up and scroll until Data 8 is visible', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var slideUpButton = find.widgetWithText(ElevatedButton, 'Slide Up');
      final slideUpButtonText = find.descendant(
          of: slideUpButton, matching: find.byType(Text));
      final String? buttonText = (tester.firstWidget(slideUpButtonText) as Text)
          .data;
      print(buttonText);

      await tester.tap(slideUpButton);
      await tester.pumpAndSettle();

      var draggableSheet = find
          .byType(DraggableScrollableSheet)
          .first;
      final scrollableFinder = find
          .descendant(of: draggableSheet, matching: find.byType(Scrollable),)
          .first;

      final panelHeading = find
          .descendant(
          of: draggableSheet,
          matching: find.byType(Text)
      )
          .first;
      expect(panelHeading, findsOneWidget);

      final panelHeadingText = (panelHeading
          .evaluate()
          .first
          .widget as Text).data;
      expect(panelHeadingText, 'Slide Up Title');

      await tester.drag(panelHeading, const Offset(0.0, -15000.0));
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
          find.text('Data 8'), 500.0, scrollable: scrollableFinder);
      await tester.pumpAndSettle();

      final data8Item = find
          .textContaining('Data 8')
          .last;
      expect(data8Item, findsOneWidget);
      expect(find.text('Data 8'), findsOneWidget);
    });
  });

  group('Slide up', () {
    testWidgets('Swipe panel up and scroll until Data 8 is visible', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var slideUpButton = find.widgetWithText(ElevatedButton, 'Slide Up');
      final slideUpButtonText = find.descendant(
          of: slideUpButton, matching: find.byType(Text));
      final String? buttonText = (tester.firstWidget(slideUpButtonText) as Text)
          .data;
      print(buttonText);

      await tester.tap(slideUpButton);
      await tester.pumpAndSettle();

      var draggableSheet = find
          .byType(DraggableScrollableSheet)
          .first;
      final scrollableFinder = find
          .descendant(of: draggableSheet, matching: find.byType(Scrollable),)
          .first;

      final panelHeading = find
          .descendant(
          of: draggableSheet,
          matching: find.byType(Text)
      )
          .first;
      expect(panelHeading, findsOneWidget);

      final panelHeadingText = (panelHeading
          .evaluate()
          .first
          .widget as Text).data;
      expect(panelHeadingText, 'Slide Up Title');

      await tester.drag(panelHeading, const Offset(0.0, -15000.0));
      await tester.pumpAndSettle();

      await tester.scrollUntilVisible(
          find.text('Data 8'), 500.0, scrollable: scrollableFinder);
      await tester.pumpAndSettle();

      final data8Item = find
          .textContaining('Data 8')
          .last;
      expect(data8Item, findsOneWidget);
      expect(find.text('Data 8'), findsOneWidget);
    });
  });
}
