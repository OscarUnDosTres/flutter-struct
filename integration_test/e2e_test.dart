import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:undostresflutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', ()
  {
    testWidgets('Vertical scrolling until element is visible', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      var scrollerButton = find.widgetWithText(ElevatedButton, 'Scroller');

      await tester.tap(scrollerButton);
      await tester.pumpAndSettle();

      var verticalScrollView = find
          .byType(SingleChildScrollView)
          .first;
      final scrollableFinder = find
          .descendant(
        of: verticalScrollView, matching: find.byType(Scrollable),)
          .first;
      final someColorContainer = find
          .textContaining('0xffffeb3b')
          .last;

      await tester.scrollUntilVisible(
        someColorContainer,
        500.0,
        scrollable: scrollableFinder,
      );
      await tester.pumpAndSettle();

      expect(someColorContainer, findsOneWidget);
    });

    testWidgets('Swipe up / Drag / Mouse actions', (tester) async {
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
    });
  });
}
