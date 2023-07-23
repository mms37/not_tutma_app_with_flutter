// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled12/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Add and remove notes', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(NotesApp());

    // Verify that our app has a title
    expect(find.text('Notlar'), findsOneWidget);

    // Add a note
    await tester.enterText(find.byType(TextField), 'Bu bir nottur.');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the note is added
    expect(find.text('Bu bir nottur.'), findsOneWidget);

    // Tap on the star icon to mark the note as starred
    await tester.tap(find.byIcon(Icons.star_border).first);
    await tester.pump();

    // Verify that the note is starred
    expect(find.byIcon(Icons.star).first, findsOneWidget);

    // Remove the note
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    // Verify that the note is removed
    expect(find.text('Bu bir nottur.'), findsNothing);
  });
}
