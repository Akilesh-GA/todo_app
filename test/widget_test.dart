import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app01/main.dart';

void main() {
  testWidgets('Welcome screen displays correctly and navigates to Todo List page', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the welcome message is displayed.
    expect(find.text('Welcome to Todo List App'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);

    // Tap the 'Get Started' button and trigger a frame.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify that the navigation to the Todo List page is successful.
    expect(find.text('Todo List'), findsOneWidget);
    expect(find.text('Enter a task'), findsOneWidget);
  });

  testWidgets('Add and remove a todo item', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Navigate to the Todo List page.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    // Verify that the app starts with an empty list.
    expect(find.text('Enter a task'), findsOneWidget);
    expect(find.text('task++'), findsOneWidget);

    // Enter a new todo item and add it.
    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.text('task++'));
    await tester.pump();

    // Verify the new todo item is added.
    expect(find.text('Buy milk'), findsOneWidget);

    // Remove the todo item.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // Verify the todo item is removed.
    expect(find.text('Buy milk'), findsNothing);
  });
}
