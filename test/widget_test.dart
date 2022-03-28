// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rgehenrypoitier/main.dart';
import 'package:rgehenrypoitier/src/app/pages/list/book_widget.dart';
import 'package:rgehenrypoitier/src/app/widgets/app_cart_price.dart';
import 'package:rgehenrypoitier/src/domain/entities/book.dart';

void main() {
  testWidgets('Testing unadded book widget', (WidgetTester tester) async {
    Book bk = Book("isbn", 'title', 1, "cover", ["synopsis", "rge"]);
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: BookWidget(
          book: bk,
          alreadyInCart: true,
        ),
      ),
    ));

    expect(find.byIcon(Icons.remove_shopping_cart_outlined), findsOneWidget);
  });
  testWidgets('Testing added book widget', (WidgetTester tester) async {
    Book bk = Book("isbn", 'title', 1, "cover", ["synopsis", "rge"]);
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: BookWidget(
          book: bk,
          alreadyInCart: false,
        ),
      ),
    ));

    expect(find.byIcon(Icons.add_shopping_cart_outlined), findsOneWidget);
  });
}
