// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:pro_5/main.dart';

void main() {
  testWidgets('Department dashboard home loads', (WidgetTester tester) async {
    await tester.pumpWidget(const DepartmentApp());
    await tester.pump();

    expect(find.text('MCA Department Dashboard'), findsOneWidget);
    expect(find.text('Campus Glimpse'), findsOneWidget);
    expect(find.text('Quick Access'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Academics'), findsOneWidget);
    expect(find.text('Notices'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });
}
